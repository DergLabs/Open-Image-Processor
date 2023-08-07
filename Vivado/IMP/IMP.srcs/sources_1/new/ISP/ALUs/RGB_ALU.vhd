----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2023 03:41:23 PM
-- Design Name: 
-- Module Name: RGB_ALU - Behavioral
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

Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity RGB_ALU is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;

        -- Inputs
        rgb_data_in : in STD_LOGIC_VECTOR (23 downto 0);
        r_operand : in signed (8 downto 0); 
        g_operand : in signed (8 downto 0);
        b_operand : in signed (8 downto 0);
        opcode : in STD_LOGIC_VECTOR (10 downto 0);
        en : in STD_LOGIC;

        -- Outputs
        rgb_data_out : out STD_LOGIC_VECTOR (23 downto 0)
    );
end RGB_ALU;

architecture rtl of RGB_ALU is
    
    -- DSP data Signals
    signal a_input : STD_LOGIC_VECTOR (29 downto 0);
    signal b_input : STD_LOGIC_VECTOR (17 downto 0);
    signal c_input : STD_LOGIC_VECTOR (47 downto 0);

    signal carry_out : std_logic_vector(3 downto 0);
    signal dout : STD_LOGIC_VECTOR (47 downto 0);


    -- DSP Control Signals
    signal DSP_ALUMODE : STD_LOGIC_VECTOR (3 downto 0);
    signal DSP_OPMODE : STD_LOGIC_VECTOR (6 downto 0);

    -- RGB signals extended to 12-bits for DSP 4-12 SIMD mode
    signal rgb_data_in_r : STD_LOGIC_VECTOR (11 downto 0);
    signal rgb_data_in_g : STD_LOGIC_VECTOR (11 downto 0);
    signal rgb_data_in_b : STD_LOGIC_VECTOR (11 downto 0);

    signal r_operand_12b : signed (11 downto 0);
    signal g_operand_12b : signed (11 downto 0);
    signal b_operand_12b : signed (11 downto 0);
begin

    -- Register inputs and split into component values
    registers : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                rgb_data_in_r <= (others => '0');
                rgb_data_in_g <= (others => '0');
                rgb_data_in_b <= (others => '0');
                r_operand_12b <= (others => '0');
                g_operand_12b <= (others => '0');
                b_operand_12b <= (others => '0');
            else
                rgb_data_in_r(7 downto 0) <= rgb_data_in(23 downto 16);
                rgb_data_in_g(7 downto 0) <= rgb_data_in(15 downto 8);
                rgb_data_in_b(7 downto 0) <= rgb_data_in(7 downto 0);

                -- resize operands to 12-bits for DSP 4-12 SIMD mode
                r_operand_12b <= resize(r_operand, r_operand_12b'length);
                g_operand_12b <= resize(g_operand, g_operand_12b'length);
                b_operand_12b <= resize(b_operand, b_operand_12b'length);

            end if;
        end if;
    end process registers;

    -- Map RGB values to DSP inputs
    a_input <= rgb_data_in_r & rgb_data_in_g & rgb_data_in_b(11 downto 6);
    b_input <= rgb_data_in_b(5 downto 0) & 12b"000000000000";
    c_input <= std_logic_vector(r_operand_12b) & std_logic_vector(g_operand_12b) & std_logic_vector(b_operand_12b) & 12b"000000000000";

    -- Control DSP ctrl signals based on opcode            
    RGB_ALU : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                rgb_data_out <= (others => '0');
            else
                if (en) then
                    DSP_ALUMODE <= opcode(3 downto 0);
                    DSP_OPMODE <= opcode(10 downto 4);
                    
                    if (dout(47) = '1') then -- Check if output is negative for R
                        rgb_data_out(23 downto 16) <= (others => '0');
                    elsif (dout(47 downto 36) >= X"0FF") then -- Check if output is saturated for R
                        rgb_data_out(23 downto 16) <= (others => '1');
                    else 
                        rgb_data_out(23 downto 16) <= dout(43 downto 36);
                    end if;

                    if (dout(35) = '1') then -- Check if output is negative for G
                        rgb_data_out(15 downto 8) <= (others => '0');
                    elsif (dout(35 downto 24) >= X"0FF") then -- Check if output is saturated for G
                        rgb_data_out(15 downto 8) <= (others => '1');
                    else 
                        rgb_data_out(15 downto 8) <= dout(31 downto 24);
                    end if;
                
                    if (dout(23) = '1') then -- Check if output is negative for B
                        rgb_data_out(7 downto 0) <= (others => '0');
                    elsif (dout(23 downto 12) >= X"0FF") then -- Check if output is saturated for B
                        rgb_data_out(7 downto 0) <= (others => '1');
                    else  
                        rgb_data_out(7 downto 0) <= dout(19 downto 12);
                    end if;
                    
                else
                    DSP_ALUMODE <= (others => '0');
                    DSP_OPMODE <= (others => '0');
                    rgb_data_out <= rgb_data_in;
                end if;
            end if;
        end if;
    end process RGB_ALU;


    DSP48E1_RGB_ALU : DSP48E1
    generic map (
    -- Feature Control Attributes: Data Path Selection
    A_INPUT => "DIRECT",                -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
    B_INPUT => "DIRECT",                -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
    USE_DPORT => FALSE,                 -- Select D port usage (TRUE or FALSE)
    USE_MULT => "NONE",                 -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
    USE_SIMD => "FOUR12",               -- SIMD selection ("ONE48", "TWO24", "FOUR12")

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
    CARRYOUT => carry_out,              -- 4-bit output: Carry output
    P => dout,                         -- 48-bit output: Primary data output

    -- Cascade: 30-bit (each) input: Cascade Ports
    ACIN => (others => '0'),            -- 30-bit input: A cascade data input
    BCIN => (others => '0'),            -- 18-bit input: B cascade input
    CARRYCASCIN => '0',                 -- 1-bit input: Cascade carry input
    MULTSIGNIN => '0',                  -- 1-bit input: Multiplier sign input
    PCIN => (others => '0'),            -- 48-bit input: P cascade input

    -- Control: 4-bit (each) input: Control Inputs/Status Bits
    ALUMODE => DSP_ALUMODE,             -- 4-bit input: ALU control input (0011 for sub (C-A*B))
    CARRYINSEL => "000",                -- 3-bit input: Carry select input
    CLK => clk,                         -- 1-bit input: Clock input
    INMODE => "00000",                  -- 5-bit input: INMODE control input
    OPMODE => DSP_OPMODE,               -- 7-bit input: Operation mode input (C-A*B)

    -- Data: 30-bit (each) input: Data Ports
    A => a_input,                       -- 30-bit input: A data input
    B => b_input,                       -- 18-bit input: B data input
    C => c_input,                       -- 48-bit input: C data input
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
    
end rtl;
