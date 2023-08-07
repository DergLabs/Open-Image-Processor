----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2023 03:41:23 PM
-- Design Name: 
-- Module Name: HSV_ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity HSV_ALU is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;

        h_in : in std_logic_vector(23 downto 0);
        s_in : in std_logic_vector(15 downto 0);
        v_in : in std_logic_vector(7 downto 0);

        h_operand : in signed(24 downto 0);
        s_operand : in signed(16 downto 0);
        v_operand : in signed(8 downto 0);

        opcode_h : in std_logic_vector(10 downto 0);
        opcode_sv : in std_logic_vector(10 downto 0);
        en_h : in std_logic;
        en_sv : in std_logic;

        h_out : out std_logic_vector(23 downto 0);
        s_out : out std_logic_vector(15 downto 0);
        v_out : out std_logic_vector(7 downto 0)
     );
end HSV_ALU;

architecture Behavioral of HSV_ALU is
    -- DSP data Signals for H alu
    signal a_input_h : STD_LOGIC_VECTOR (29 downto 0);
    signal b_input_h : STD_LOGIC_VECTOR (17 downto 0);
    signal c_input_h : STD_LOGIC_VECTOR (47 downto 0);

    signal carry_out_h : STD_LOGIC_VECTOR (3 downto 0);
    signal p_out_h : STD_LOGIC_VECTOR (47 downto 0);

    -- DSP data Signals for SV alu
    signal a_input_sv : STD_LOGIC_VECTOR (29 downto 0);
    signal b_input_sv : STD_LOGIC_VECTOR (17 downto 0);
    signal c_input_sv : STD_LOGIC_VECTOR (47 downto 0);

    signal carry_out_sv : STD_LOGIC_VECTOR (3 downto 0);
    signal p_out_sv : STD_LOGIC_VECTOR (47 downto 0);
    

    -- DSP Control Signals for H
    signal DSP_ALUMODE_H : STD_LOGIC_VECTOR (3 downto 0);
    signal DSP_OPMODE_H : STD_LOGIC_VECTOR (6 downto 0);

    -- DSP Control Signals for SV
    signal DSP_ALUMODE_SV : STD_LOGIC_VECTOR (3 downto 0);
    signal DSP_OPMODE_SV : STD_LOGIC_VECTOR (6 downto 0);

    -- HSV signals sign extended
    signal h_data_in : STD_LOGIC_VECTOR (23 downto 0);
    signal s_data_in : STD_LOGIC_VECTOR (23 downto 0); -- Extended to 24-bit for DSP SIMD mode
    signal v_data_in : STD_LOGIC_VECTOR (23 downto 0);

    signal h_operand_48b : signed (47 downto 0);
    signal s_operand_24b : signed (23 downto 0);
    signal v_operand_24b : signed (23 downto 0);
begin

    -- Register inputs and split into component values
    registers : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                h_data_in <= (others => '0');
                s_data_in <= (others => '0');
                v_data_in <= (others => '0');
                h_operand_48b <= (others => '0');
                s_operand_24b <= (others => '0');
                v_operand_24b <= (others => '0');
            else
                h_data_in <= h_in;
                s_data_in(15 downto 0) <= s_in;
                v_data_in(7 downto 0) <= v_in;

                h_operand_48b <= resize(h_operand, h_operand_48b'length);
                s_operand_24b <= resize(s_operand, s_operand_24b'length);
                v_operand_24b <= resize(v_operand, v_operand_24b'length);
            end if;
        end if;
    end process registers;

    -- Map HSV values to DSP inputs
    a_input_h <= X"000000" & h_data_in(23 downto 18);
    b_input_h <= h_data_in(17 downto 0);
    c_input_h <= std_logic_vector(h_operand_48b);       
    
    a_input_sv <= s_data_in & v_data_in(23 downto 18);
    b_input_sv <= v_data_in(17 downto 0);
    c_input_sv <= std_logic_vector(s_operand_24b) & std_logic_vector(v_operand_24b);

    -- Control DSP ctrl signals based on opcode            
    HSV_ALU_OUTPUT_CTRL : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                h_out <= (others => '0');
                s_out <= (others => '0');
                v_out <= (others => '0');
            else
                if (en_h) then
                    DSP_ALUMODE_H <= opcode_h(3 downto 0);
                    DSP_OPMODE_H <= opcode_h(10 downto 4);

                    if (p_out_h(47) = '1') then
                        h_out <= (others => '0');
                    elsif (p_out_h(23 downto 0) >= X"05F370") then
                        h_out <= X"05F370";
                    else
                        h_out <= p_out_h(23 downto 0);
                    end if;
                
                else
                    DSP_ALUMODE_H <= (others => '0');
                    DSP_OPMODE_H <= (others => '0');
                    h_out <= h_in;
                end if;

                if (en_sv) then
                    DSP_ALUMODE_SV <= opcode_sv(3 downto 0);
                    DSP_OPMODE_SV <= opcode_sv(10 downto 4);

                    if (p_out_sv(47) = '1') then
                        s_out <= (others => '0');
                    elsif (p_out_sv(47 downto 24) >= X"00FFFF") then
                        s_out <= X"FFFF";
                    else
                        s_out <= p_out_sv(39 downto 24);
                    end if;

                    if (p_out_sv(23) = '1') then 
                        report "V out underflow";
                        v_out <= (others => '0');
                    elsif (p_out_sv(23 downto 0) >= X"0000FF") then
                        report "V out overflow";
                        v_out <= X"FF";
                    else
                        report "V out normal";
                        v_out <= p_out_sv(7 downto 0);
                    end if;
                else
                    DSP_ALUMODE_H <= (others => '0');
                    DSP_OPMODE_H <= (others => '0');
                    s_out <= s_in;
                    v_out <= v_in;
                end if;

            end if;
        end if;
    end process HSV_ALU_OUTPUT_CTRL;

    DSP48E1_H_ALU : DSP48E1
    generic map (
    -- Feature Control Attributes: Data Path Selection
    A_INPUT => "DIRECT",                -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
    B_INPUT => "DIRECT",                -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
    USE_DPORT => FALSE,                 -- Select D port usage (TRUE or FALSE)
    USE_MULT => "NONE",                 -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
    USE_SIMD => "ONE48",               -- SIMD selection ("ONE48", "TWO24", "FOUR12")

    -- Pattern Detector Attributes: Pattern Detection Configuration !!! NONE USED !!!
    AUTORESET_PATDET => "NO_RESET",     -- "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
    MASK => X"3fffffffffff",            -- 48-bit mask value for pattern detect (1=ignore)
    PATTERN => X"000000000000",         -- 48-bit pattern match for pattern detect
    SEL_MASK => "MASK",                 -- "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
    SEL_PATTERN => "PATTERN",           -- Select pattern value ("PATTERN" or "C")
    USE_PATTERN_DETECT => "NO_PATDET",  -- Enable pattern detect ("PATDET" or "NO_PATDET")

    -- Register Control Attributes: Pipeline Register Configuration
    ACASCREG => 0,                      -- Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
    ADREG => 0,                         -- Number of pipeline stages for pre-adder (0 or 1)
    ALUMODEREG => 0,                    -- Number of pipeline stages for ALUMODE (0 or 1)
    AREG => 0,                          -- Number of pipeline stages for A (0, 1 or 2)
    BCASCREG => 0,                      -- Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
    BREG => 0,                          -- Number of pipeline stages for B (0, 1 or 2)
    CARRYINREG => 0,                    -- Number of pipeline stages for CARRYIN (0 or 1)
    CARRYINSELREG => 0,                 -- Number of pipeline stages for CARRYINSEL (0 or 1)
    CREG => 0,                          -- Number of pipeline stages for C (0 or 1)
    DREG => 0,                          -- Number of pipeline stages for D (0 or 1)
    INMODEREG => 0,                     -- Number of pipeline stages for INMODE (0 or 1)
    MREG => 0,                          -- Number of multiplier pipeline stages (0 or 1)
    OPMODEREG => 0,                     -- Number of pipeline stages for OPMODE (0 or 1)
    PREG => 0                           -- Number of pipeline stages for P (0 or 1)
    )   
    port map (  
    -- Output Ports     
    CARRYOUT => carry_out_h,              -- 4-bit output: Carry output
    P => p_out_h,                         -- 48-bit output: Primary data output

    -- Cascade: 30-bit (each) input: Cascade Ports
    ACIN => (others => '0'),            -- 30-bit input: A cascade data input
    BCIN => (others => '0'),            -- 18-bit input: B cascade input
    CARRYCASCIN => '0',                 -- 1-bit input: Cascade carry input
    MULTSIGNIN => '0',                  -- 1-bit input: Multiplier sign input
    PCIN => (others => '0'),            -- 48-bit input: P cascade input

    -- Control: 4-bit (each) input: Control Inputs/Status Bits
    ALUMODE => DSP_ALUMODE_H,             -- 4-bit input: ALU control input (0011 for sub (C-A*B))
    CARRYINSEL => "000",                -- 3-bit input: Carry select input
    CLK => clk,                         -- 1-bit input: Clock input
    INMODE => "00000",                  -- 5-bit input: INMODE control input
    OPMODE => DSP_OPMODE_H,               -- 7-bit input: Operation mode input (C-A*B)

    -- Data: 30-bit (each) input: Data Ports
    A => a_input_h,                       -- 30-bit input: A data input
    B => b_input_h,                       -- 18-bit input: B data input
    C => c_input_h,                       -- 48-bit input: C data input
    CARRYIN => '0',                     -- 1-bit input: Carry input signal
    D => (others => '0'),               -- 25-bit input: D data input

    -- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
    CEA1 => '1',                        -- 1-bit input: Clock enable input for 1st stage AREG
    CEA2 => '1',                        -- 1-bit input: Clock enable input for 2nd stage AREG
    CEAD => '1',                        -- 1-bit input: Clock enable input for ADREG
    CEALUMODE => '1',                   -- 1-bit input: Clock enable input for ALUMODE
    CEB1 => '1',                        -- 1-bit input: Clock enable input for 1st stage BREG
    CEB2 => '1',                        -- 1-bit input: Clock enable input for 2nd stage BREG
    CEC => '1',                         -- 1-bit input: Clock enable input for CREG
    CECARRYIN => '1',                   -- 1-bit input: Clock enable input for CARRYINREG
    CECTRL => '1',                      -- 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
    CED => '1',                         -- 1-bit input: Clock enable input for DREG
    CEINMODE => '1',                    -- 1-bit input: Clock enable input for INMODEREG
    CEM => '1',                         -- 1-bit input: Clock enable input for MREG
    CEP => '1',                         -- 1-bit input: Clock enable input for PREG
    RSTA => rst,                        -- 1-bit input: Reset input for AREG
    RSTALLCARRYIN => rst,               -- 1-bit input: Reset input for CARRYINREG
    RSTALUMODE => rst,                  -- 1-bit input: Reset input for ALUMODEREG
    RSTB => rst,                        -- 1-bit input: Reset input for BREG
    RSTC => rst,                        -- 1-bit input: Reset input for CREG
    RSTCTRL => rst,                     -- 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
    RSTD => rst,                        -- 1-bit input: Reset input for DREG and ADREG
    RSTINMODE => rst,                   -- 1-bit input: Reset input for INMODEREG
    RSTM => rst,                        -- 1-bit input: Reset input for MREG
    RSTP => rst                         -- 1-bit input: Reset input for PREG
    );

    DSP48E1_SV_ALU : DSP48E1
    generic map (
    -- Feature Control Attributes: Data Path Selection
    A_INPUT => "DIRECT",                -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
    B_INPUT => "DIRECT",                -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
    USE_DPORT => FALSE,                 -- Select D port usage (TRUE or FALSE)
    USE_MULT => "NONE",                 -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
    USE_SIMD => "TWO24",               -- SIMD selection ("ONE48", "TWO24", "FOUR12")

    -- Pattern Detector Attributes: Pattern Detection Configuration !!! NONE USED !!!
    AUTORESET_PATDET => "NO_RESET",     -- "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
    MASK => X"3fffffffffff",            -- 48-bit mask value for pattern detect (1=ignore)
    PATTERN => X"000000000000",         -- 48-bit pattern match for pattern detect
    SEL_MASK => "MASK",                 -- "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
    SEL_PATTERN => "PATTERN",           -- Select pattern value ("PATTERN" or "C")
    USE_PATTERN_DETECT => "NO_PATDET",  -- Enable pattern detect ("PATDET" or "NO_PATDET")

    -- Register Control Attributes: Pipeline Register Configuration
    ACASCREG => 0,                      -- Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
    ADREG => 0,                         -- Number of pipeline stages for pre-adder (0 or 1)
    ALUMODEREG => 0,                    -- Number of pipeline stages for ALUMODE (0 or 1)
    AREG => 0,                          -- Number of pipeline stages for A (0, 1 or 2)
    BCASCREG => 0,                      -- Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
    BREG => 0,                          -- Number of pipeline stages for B (0, 1 or 2)
    CARRYINREG => 0,                    -- Number of pipeline stages for CARRYIN (0 or 1)
    CARRYINSELREG => 0,                 -- Number of pipeline stages for CARRYINSEL (0 or 1)
    CREG => 0,                          -- Number of pipeline stages for C (0 or 1)
    DREG => 0,                          -- Number of pipeline stages for D (0 or 1)
    INMODEREG => 0,                     -- Number of pipeline stages for INMODE (0 or 1)
    MREG => 0,                          -- Number of multiplier pipeline stages (0 or 1)
    OPMODEREG => 0,                     -- Number of pipeline stages for OPMODE (0 or 1)
    PREG => 0                           -- Number of pipeline stages for P (0 or 1)
    )   
    port map (  
    -- Output Ports     
    CARRYOUT => carry_out_sv,              -- 4-bit output: Carry output
    P => p_out_sv,                         -- 48-bit output: Primary data output

    -- Cascade: 30-bit (each) input: Cascade Ports
    ACIN => (others => '0'),            -- 30-bit input: A cascade data input
    BCIN => (others => '0'),            -- 18-bit input: B cascade input
    CARRYCASCIN => '0',                 -- 1-bit input: Cascade carry input
    MULTSIGNIN => '0',                  -- 1-bit input: Multiplier sign input
    PCIN => (others => '0'),            -- 48-bit input: P cascade input

    -- Control: 4-bit (each) input: Control Inputs/Status Bits
    ALUMODE => DSP_ALUMODE_SV,             -- 4-bit input: ALU control input (0011 for sub (C-A*B))
    CARRYINSEL => "000",                -- 3-bit input: Carry select input
    CLK => clk,                         -- 1-bit input: Clock input
    INMODE => "00000",                  -- 5-bit input: INMODE control input
    OPMODE => DSP_OPMODE_SV,               -- 7-bit input: Operation mode input (C-A*B)

    -- Data: 30-bit (each) input: Data Ports
    A => a_input_sv,                       -- 30-bit input: A data input
    B => b_input_sv,                       -- 18-bit input: B data input
    C => c_input_sv,                       -- 48-bit input: C data input
    CARRYIN => '0',                     -- 1-bit input: Carry input signal
    D => (others => '0'),               -- 25-bit input: D data input

    -- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
    CEA1 => '1',                        -- 1-bit input: Clock enable input for 1st stage AREG
    CEA2 => '1',                        -- 1-bit input: Clock enable input for 2nd stage AREG
    CEAD => '1',                        -- 1-bit input: Clock enable input for ADREG
    CEALUMODE => '1',                   -- 1-bit input: Clock enable input for ALUMODE
    CEB1 => '1',                        -- 1-bit input: Clock enable input for 1st stage BREG
    CEB2 => '1',                        -- 1-bit input: Clock enable input for 2nd stage BREG
    CEC => '1',                         -- 1-bit input: Clock enable input for CREG
    CECARRYIN => '1',                   -- 1-bit input: Clock enable input for CARRYINREG
    CECTRL => '1',                      -- 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
    CED => '1',                         -- 1-bit input: Clock enable input for DREG
    CEINMODE => '1',                    -- 1-bit input: Clock enable input for INMODEREG
    CEM => '1',                         -- 1-bit input: Clock enable input for MREG
    CEP => '1',                         -- 1-bit input: Clock enable input for PREG
    RSTA => rst,                        -- 1-bit input: Reset input for AREG
    RSTALLCARRYIN => rst,               -- 1-bit input: Reset input for CARRYINREG
    RSTALUMODE => rst,                  -- 1-bit input: Reset input for ALUMODEREG
    RSTB => rst,                        -- 1-bit input: Reset input for BREG
    RSTC => rst,                        -- 1-bit input: Reset input for CREG
    RSTCTRL => rst,                     -- 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
    RSTD => rst,                        -- 1-bit input: Reset input for DREG and ADREG
    RSTINMODE => rst,                   -- 1-bit input: Reset input for INMODEREG
    RSTM => rst,                        -- 1-bit input: Reset input for MREG
    RSTP => rst                         -- 1-bit input: Reset input for PREG
    );

end Behavioral;
