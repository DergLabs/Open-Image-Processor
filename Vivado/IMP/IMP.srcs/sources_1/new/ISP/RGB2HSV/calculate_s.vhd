----------------------------------------------------------------------------------
-- Engineer: John Hofmeyr
-- 
-- Create Date: 07/08/2023 10:02:24 PM
-- Design Name: 
-- Module Name: calculate_s - Behavioral
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
use IEEE.std_logic_textio.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity calculate_s is
    Port (
        -- Inputs
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        delta : in STD_LOGIC_VECTOR (7 downto 0); -- max - min
        v : in STD_LOGIC_VECTOR (7 downto 0); -- V = max

        -- Ram inputs
        inverse_ram_data : in STD_LOGIC_VECTOR (17 downto 0); -- Inverse value for v

        -- S output
        s : out STD_LOGIC_VECTOR (15 downto 0) -- S output (S = ((d << 16) + 1) / v)))
    );
end calculate_s;




architecture rtl of calculate_s is
    -- retiming register signals
    signal ram_data_reg1 : std_logic_vector (17 downto 0) := (others => '0');
    signal ram_data_reg2 : std_logic_vector (17 downto 0) := (others => '0');


    -- DSP Signals
    signal carry_out : std_logic_vector (3 downto 0) := (others => '0');

    -- Pipeline stage signals
    -- Stage 1 : Bit shift d << 16
    signal delta_24b : unsigned (23 downto 0) := (others => '0');
    signal stage_1_delta_bitshifted : unsigned (23 downto 0) := (others => '0'); -- Internal stage signal

    -- Stage 2 : Add 1 to d << 16
    signal stage_2_delta_bitshifted : unsigned (29 downto 0) := (others => '0'); -- Internal stage signal

    -- stage 3: multiply (d << 16) - 1 by v_inv and store result in s
    --signal dsp_a_input_24b : std_logic_vector (23 downto 0) := (others => '0');
    --signal inverse_value : std_logic_vector (17 downto 0) := (others => '0'); -- Internal stage signal
    signal stage_3_mult_out : std_logic_vector (47 downto 0) := (others => '0'); -- Internal stage signal
    signal stage_3_mult_out_shifted : std_logic_vector (47 downto 0) := (others => '0'); -- Internal stage signal

begin

    DSP48E1_s_mult : DSP48E1
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
    P => stage_3_mult_out,              -- 48-bit output: Primary data output

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
    INMODE => "00000",                  -- 5-bit input: INMODE control input (00000 for A*B+C)
    OPMODE => "0000101",                -- 7-bit input: Operation mode input (0110011 for A*B and C in)

    -- Data: 30-bit (each) input: Data Ports
    A => std_logic_vector(stage_2_delta_bitshifted),               -- 30-bit input: A data input
    B => ram_data_reg1,                 -- 18-bit input: B data input
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

    -- Input registers
    register_inputs : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                ram_data_reg1 <= (others => '0');
                --ram_data_reg2 <= (others => '0');
            else
                -- Assign RGB inpit to Register, resize to 12-bits. MSB's are 0
                ram_data_reg1 <= inverse_ram_data(17 downto 0);
                --ram_data_reg2 <= ram_data_reg1;
            end if;
        end if; 
    end process register_inputs;

    delta_24b <= (23 downto 8 => '0') & unsigned(delta); -- Convert delta to 24 bit unsigned

    -- Stage 1 : Bit shift d << 16
    bitShift : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                stage_1_delta_bitshifted <= (others => '0');
            else
                stage_1_delta_bitshifted <= shift_left(delta_24b, 16);
            end if;
        end if;
    end process bitShift;

    -- Stage 2 : subtract 1 from d << 16
    addOne : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                stage_2_delta_bitshifted <= (others => '0');
            else
                stage_2_delta_bitshifted(23 downto 0) <= stage_1_delta_bitshifted - 1;
            end if;
        end if;
    end process addOne;

    -- Stage 3 : multuply ((d << 16) - 1) by inverse value (Done in DSP), then bit shift right by 16
    shift : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s <= (others => '0');
                stage_3_mult_out_shifted <= (others => '0');
            else
                stage_3_mult_out_shifted <= stage_3_mult_out srl 16; -- Bit shift right by 16 (precision factor)
                if delta = X"00" or v = X"00" then
                    s <= (others => '0');
                else
                    s <= stage_3_mult_out_shifted(15 downto 0); -- Assign output
                end if;

            end if;
        end if;
    end process shift;

end rtl;