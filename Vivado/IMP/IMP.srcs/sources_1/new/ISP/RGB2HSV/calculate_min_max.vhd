----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2023 10:02:55 PM
-- Design Name: 
-- Module Name: calculate_min_max - Behavioral
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
-- arithmetic functions with Signed or Unsigned architecture
use IEEE.NUMERIC_STD_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity calculate_min_max is
    Port (
        -- Inputs
        clk : in std_logic;
        rst : in std_logic;

        r : in std_logic_vector(7 downto 0);
        g : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(7 downto 0);

        -- Outputs
        min : out std_logic_vector(7 downto 0);
        max : out std_logic_vector(7 downto 0);
        mid : out std_logic_vector(7 downto 0);
        diff : out std_logic_vector(7 downto 0);
        index : out std_logic_vector(2 downto 0)
     );
end calculate_min_max;


architecture rtl of calculate_min_max is

    -- RGB Register Outputs (Also re-sizes the RGB values to 12-bits)
    signal r_reg, g_reg, b_reg : std_logic_vector(11 downto 0) := (others => '0');

    -- Retiming registers (handles the 2 clock cycle delay from DSP)
    signal r_retime1, g_retime1, b_retime1 : std_logic_vector(11 downto 0) := (others => '0');
    signal r_retime2, g_retime2, b_retime2 : std_logic_vector(11 downto 0) := (others => '0');

    -- DSP Input Signals
    signal A_input : std_logic_vector(29 downto 0) := (others => '0');
    signal B_input : std_logic_vector(17 downto 0):= (others => '0');
    signal c_input : std_logic_vector(47 downto 0):= (others => '0');

    -- DSP Output Signals
    signal carry_out : std_logic_vector(3 downto 0) := (others => '0');
    signal p_out : std_logic_vector(47 downto 0) := (others => '0');

    -- MUX Select Signal
    signal mux_sel : std_logic_vector(2 downto 0) := (others => '0');
begin

    -- Register the RGB inputs for the adders and mux's
    register_inputs : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                r_reg <= (others => '0');
                g_reg <= (others => '0');
                b_reg <= (others => '0');

                r_retime1 <= (others => '0');
                g_retime1 <= (others => '0');
                b_retime1 <= (others => '0');
                r_retime2 <= (others => '0');
                g_retime2 <= (others => '0');
                b_retime2 <= (others => '0');

            else
                -- Assign RGB inpit to Register, resize to 12-bits. MSB's are 0
                r_reg(7 downto 0) <= r;
                g_reg(7 downto 0) <= g;
                b_reg(7 downto 0) <= b;

                -- Retiming Registers
                r_retime1 <= r_reg;
                g_retime1 <= g_reg;
                b_retime1 <= b_reg;

                r_retime2 <= r_retime1;
                g_retime2 <= g_retime1;
                b_retime2 <= b_retime1;

            end if;
        end if; 
    end process register_inputs;


    A_input <= g_reg & b_reg & b_reg(11 downto 6); -- [29 - 18 G, 17 - 6 B, 5 - 0 B_upper]
    B_input <= b_reg(5 downto 0) & 12b"000000000000";  -- [17 - 12 B_lower, 11 - 0 0x0]

    c_input <= r_reg & r_reg & g_reg & 12b"000000000000"; -- [47 - 36 R, 35 - 24 R, 23 - 12 G, 11 - 0 0x0]

    DSP48E1_minMax : DSP48E1
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
    MREG => 0,                          -- Number of multiplier pipeline stages (0 or 1)
    OPMODEREG => 1,                     -- Number of pipeline stages for OPMODE (0 or 1)
    PREG => 1                           -- Number of pipeline stages for P (0 or 1)
    )   
    port map (  
    -- Output Ports     
    CARRYOUT => carry_out,              -- 4-bit output: Carry output
    P => p_out,                         -- 48-bit output: Primary data output

    -- Cascade: 30-bit (each) input: Cascade Ports
    ACIN => (others => '0'),            -- 30-bit input: A cascade data input
    BCIN => (others => '0'),            -- 18-bit input: B cascade input
    CARRYCASCIN => '0',                 -- 1-bit input: Cascade carry input
    MULTSIGNIN => '0',                  -- 1-bit input: Multiplier sign input
    PCIN => (others => '0'),            -- 48-bit input: P cascade input

    -- Control: 4-bit (each) input: Control Inputs/Status Bits
    ALUMODE => "0011",                  -- 4-bit input: ALU control input (0011 for sub)
    CARRYINSEL => "000",                -- 3-bit input: Carry select input
    CLK => CLK,                         -- 1-bit input: Clock input
    INMODE => "00000",                  -- 5-bit input: INMODE control input
    OPMODE => "0110011",                -- 7-bit input: Operation mode input (0110011 for A:B and C in)

    -- Data: 30-bit (each) input: Data Ports
    A => A_input,                       -- 30-bit input: A data input
    B => B_input,                       -- 18-bit input: B data input
    C => c_input,                       -- 48-bit input: C data input
    CARRYIN => '0',                     -- 1-bit input: Carry input signal
    D => (others => '0'),               -- 25-bit input: D data input

    -- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
    CEA1 => '1',                        -- 1-bit input: Clock enable input for 1st stage AREG
    CEA2 => '1',                        -- 1-bit input: Clock enable input for 2nd stage AREG
    CEAD => '0',                        -- 1-bit input: Clock enable input for ADREG
    CEALUMODE => '1',                   -- 1-bit input: Clock enable input for ALUMODE
    CEB1 => '1',                        -- 1-bit input: Clock enable input for 1st stage BREG
    CEB2 => '1',                        -- 1-bit input: Clock enable input for 2nd stage BREG
    CEC => '1',                         -- 1-bit input: Clock enable input for CREG
    CECARRYIN => '1',                   -- 1-bit input: Clock enable input for CARRYINREG
    CECTRL => '1',                      -- 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
    CED => '0',                         -- 1-bit input: Clock enable input for DREG
    CEINMODE => '1',                    -- 1-bit input: Clock enable input for INMODEREG
    CEM => '0',                         -- 1-bit input: Clock enable input for MREG
    CEP => '1',                         -- 1-bit input: Clock enable input for PREG
    RSTA => rst,                        -- 1-bit input: Reset input for AREG
    RSTALLCARRYIN => rst,               -- 1-bit input: Reset input for CARRYINREG
    RSTALUMODE => rst,                  -- 1-bit input: Reset input for ALUMODEREG
    RSTB => rst,                        -- 1-bit input: Reset input for BREG
    RSTC => rst,                        -- 1-bit input: Reset input for CREG
    RSTCTRL => rst,                     -- 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
    RSTD => '0',                        -- 1-bit input: Reset input for DREG and ADREG
    RSTINMODE => rst,                   -- 1-bit input: Reset input for INMODEREG
    RSTM => rst,                        -- 1-bit input: Reset input for MREG
    RSTP => rst                         -- 1-bit input: Reset input for PREG

    );

    -- Extract the sign bit from the 3 12-bit sub-results of P 
    mux_sel <= p_out(47) & p_out(35) & p_out(23);

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                min <= (others => '0');
                mid <= (others => '0');
                max <= (others => '0');
                index <= (others => '0');
            else
                case mux_sel is
                    when "000" => 
                        min <= b_retime2(7 downto 0); 
                        max <= r_retime2(7 downto 0); 
                        mid <= g_retime2(7 downto 0); 
                        index <= b"000"; 
                        diff <= r_retime2(7 downto 0)-b_retime2(7 downto 0); 
                    when "001" => 
                        min <= g_retime2(7 downto 0); 
                        max <= r_retime2(7 downto 0); 
                        mid <= b_retime2(7 downto 0); 
                        index <= b"101"; 
                        diff <= r_retime2(7 downto 0)-g_retime2(7 downto 0); 
                    when "010" =>  report "ERROR IMPOSSIBLE COMPARISON OUTCOME (R>G, B>R, G>B)";
                    when "011" => 
                         min <= g_retime2(7 downto 0);
                         max <= b_retime2(7 downto 0); 
                         mid <= r_retime2(7 downto 0); 
                         index <= b"100"; 
                         diff <= b_retime2(7 downto 0)-g_retime2(7 downto 0);
                    when "100" => 
                        min <= b_retime2(7 downto 0); 
                        max <= g_retime2(7 downto 0); 
                        mid <= r_retime2(7 downto 0); 
                        index <= b"001"; 
                        diff <= g_retime2(7 downto 0)-b_retime2(7 downto 0);
                    when "101" => 
                        min <= r_retime2(7 downto 0); 
                        max <= b_retime2(7 downto 0); 
                        mid <= g_retime2(7 downto 0); 
                        index <= b"011"; 
                        diff <= b_retime2(7 downto 0)-r_retime2(7 downto 0);
                    when "110" => 
                        min <= r_retime2(7 downto 0); 
                        max <= g_retime2(7 downto 0); 
                        mid <= b_retime2(7 downto 0); 
                        index <= b"010"; 
                        diff <= g_retime2(7 downto 0)-r_retime2(7 downto 0); 
                    when "111" => 
                        min <= r_retime2(7 downto 0); 
                        max <= b_retime2(7 downto 0); 
                        mid <= g_retime2(7 downto 0); 
                        index <= b"011"; 
                        diff <= b_retime2(7 downto 0)-r_retime2(7 downto 0);
                    when others => 
                        index <= b"000";
                end case;   
            end if;
        end if;
    end process;
end rtl;
