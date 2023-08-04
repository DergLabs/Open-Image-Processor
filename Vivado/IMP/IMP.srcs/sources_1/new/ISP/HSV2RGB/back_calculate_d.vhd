----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2023 06:17:04 PM
-- Design Name: 
-- Module Name: back_calculate_d - Behavioral
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

entity back_calculate_d is
    Port ( 
        -- Inputs
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        s : in STD_LOGIC_VECTOR (15 downto 0);
        v : in STD_LOGIC_VECTOR (7 downto 0);

        -- Outputs
        d : out STD_LOGIC_VECTOR (7 downto 0)
    );
end back_calculate_d;

architecture Behavioral of back_calculate_d is
    
    -- DSP inputs
    signal dsp_a_input_30b : std_logic_vector(29 downto 0) := (others => '0');
    signal dsp_b_input_18b : std_logic_vector(17 downto 0) := (others => '0');

    -- DSP outputs
    signal mult_out : std_logic_vector(47 downto 0) := (others => '0');
    signal carry_out : std_logic_vector(3 downto 0) := (others => '0');

    -- multiply stage output signal
    signal mult_out_48b : std_logic_vector(47 downto 0) := (others => '0');

    -- bit shift stage
    signal bit_shift_out : std_logic_vector(7 downto 0) := (others => '0');

begin

    DSP48E1_d_mult : DSP48E1
    generic map (
    -- Feature Control Attributes: Data Path Selection
    A_INPUT => "DIRECT",                -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
    B_INPUT => "DIRECT",                -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
    USE_DPORT => FALSE,                 -- Select D port usage (TRUE or FALSE)
    USE_MULT => "MULTIPLY",                 -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
    USE_SIMD => "ONE48",               -- SIMD selection ("ONE48", "TWO24", "FOUR12")

    -- Pattern Detector Attributes: Pattern Detection Configuration !!! NONE USED !!!
    AUTORESET_PATDET => "NO_RESET",     -- "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
    MASK => X"3fffffffffff",            -- 48-bit mask value for pattern detect (1=ignore)
    PATTERN => X"000000000000",         -- 48-bit pattern match for pattern detect
    SEL_MASK => "MASK",                 -- "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
    SEL_PATTERN => "PATTERN",           -- Select pattern value ("PATTERN" or "C")
    USE_PATTERN_DETECT => "NO_PATDET",  -- Enable pattern detect ("PATDET" or "NO_PATDET")

    -- Register Control Attributes: Pipeline Register Configuration
    ACASCREG => 1,                      -- Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
    ADREG => 1,                         -- Number of pipeline stages for pre-adder (0 or 1)
    ALUMODEREG => 1,                    -- Number of pipeline stages for ALUMODE (0 or 1)
    AREG => 1,                          -- Number of pipeline stages for A (0, 1 or 2)
    BCASCREG => 1,                      -- Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
    BREG => 1,                          -- Number of pipeline stages for B (0, 1 or 2)
    CARRYINREG => 1,                    -- Number of pipeline stages for CARRYIN (0 or 1)
    CARRYINSELREG => 1,                 -- Number of pipeline stages for CARRYINSEL (0 or 1)
    CREG => 1,                          -- Number of pipeline stages for C (0 or 1)
    DREG => 1,                          -- Number of pipeline stages for D (0 or 1)
    INMODEREG => 1,                     -- Number of pipeline stages for INMODE (0 or 1)
    MREG => 1,                          -- Number of multiplier pipeline stages (0 or 1)
    OPMODEREG => 1,                     -- Number of pipeline stages for OPMODE (0 or 1)
    PREG => 1                           -- Number of pipeline stages for P (0 or 1)
    )   
    port map (  
    -- Output Ports     
    CARRYOUT => carry_out,              -- 4-bit output: Carry output
    P => mult_out,                      -- 48-bit output: Primary data output

    -- Cascade: 30-bit (each) input: Cascade Ports
    ACIN => (others => '0'),            -- 30-bit input: A cascade data input
    BCIN => (others => '0'),            -- 18-bit input: B cascade input
    CARRYCASCIN => '0',                 -- 1-bit input: Cascade carry input
    MULTSIGNIN => '0',                  -- 1-bit input: Multiplier sign input
    PCIN => (others => '0'),            -- 48-bit input: P cascade input

    -- Control: 4-bit (each) input: Control Inputs/Status Bits
    ALUMODE => "0000",                  -- 4-bit input: ALU control input (0000 for add)
    CARRYINSEL => "000",                -- 3-bit input: Carry select input
    CLK => CLK,                         -- 1-bit input: Clock input
    INMODE => "10001",                  -- 5-bit input: INMODE control input (00000 for A*B+C)
    OPMODE => "0110101",                -- 7-bit input: Operation mode input (0110011 for A*B and C in)

    -- Data: 30-bit (each) input: Data Ports
    A => dsp_a_input_30b,               -- 30-bit input: A data input
    B => dsp_b_input_18b,                 -- 18-bit input: B data input
    C => (others => '0'),               -- 48-bit input: C data input
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

    multiply_s_v : process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                dsp_a_input_30b <= (others => '0');
                dsp_b_input_18b <= (others => '0');
                mult_out_48b <= (others => '0');
            else
                dsp_a_input_30b(15 downto 0) <= s;
                dsp_b_input_18b(7 downto 0) <= v;
                mult_out_48b <= mult_out;
            end if;
        end if;
    end process multiply_s_v;

    bit_shift : process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                bit_shift_out <= (others => '0');
            else
                bit_shift_out <= std_logic_vector(shift_right(unsigned(mult_out), 16)(7 downto 0));

            end if;
        end if;
    end process bit_shift;

    add_and_output : process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                d <= (others => '0');
            else
                d <= std_logic_vector(unsigned(bit_shift_out));
            end if;
        end if;
    end process add_and_output;


end Behavioral;
