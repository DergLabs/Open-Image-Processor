----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2023 10:02:24 PM
-- Design Name: 
-- Module Name: calculate_h - Behavioral
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
--use IEEE.NUMERIC_STD_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity calculate_h is
    Port (
        -- Inputs
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        min : in STD_LOGIC_VECTOR (7 downto 0);
        mid : in STD_LOGIC_VECTOR (7 downto 0);
        selector_index : in STD_LOGIC_VECTOR (2 downto 0);

        -- Ram inputs
        inverse_ram_data : in STD_LOGIC_VECTOR (17 downto 0); -- Inverse value for delta

        -- Outputs
        h : out STD_LOGIC_VECTOR (23 downto 0)

     );
end calculate_h;

architecture rtl of calculate_h is
    -- Components
    component vector_delay_line
        generic (
            WIDTH : integer;
            DEPTH : integer
        );
        PORT(
            clk : in std_logic;
            reset : in std_logic;
            data_in : in std_logic_vector;
            data_out : out std_logic_vector
        ); 
    end component;


    -- DSP Signals
    signal carry_out : std_logic_vector (3 downto 0) := (others => '0');

    -- Pipeline stage signals
    signal ram_data_delayed : std_logic_vector (17 downto 0) := (others => '0'); 
    signal mid_reg : std_logic_vector (7 downto 0) := (others => '0');
    signal min_reg : std_logic_vector (7 downto 0) := (others => '0');
    signal selector_index_delayed :  std_logic_vector(2 downto 0) := (others => '0');

    -- Stage 1: Calculate c - m (used in F calculation)
    signal stage1_out : unsigned (7 downto 0) := (others => '0');

    -- Stage 2: Calculate (c-m)<<16 (used in F calculation)
    signal stage_1_30b : unsigned (29 downto 0) := (others => '0');

    -- Stage 3: Calculate (c-m)<<16 / delta (used in F calculation)
    signal delta_inverse : std_logic_vector (17 downto 0):= (others => '0');

    signal stage_3_mult_out : std_logic_vector (47 downto 0):= (others => '0');
    signal stage_3_mult_out_shifted : unsigned (23 downto 0) := (others => '0');

    -- stage 4: calculate F based on selector_index
    signal f : unsigned (23 downto 0) := (others => '0');

    -- stage 5: shift I by 16
    signal I_shifted : unsigned (23 downto 0) := (others => '0');
    signal selector_index_24b : unsigned (23 downto 0) := (others => '0');

begin

    -- DSP used for multiplying ((c-m)<<16) and delta inverse
    DSP48E1_h_mult : DSP48E1
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
        A => std_logic_vector(shift_left(stage_1_30b, 16)),               -- 30-bit input: A data input
        B => ram_data_delayed,                 -- 18-bit input: B data input
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

    selector_index_delay_line : vector_delay_line
    generic map (
        WIDTH => 3, -- delay line bit width
        DEPTH => 6 -- Number of delay stages
    )
    port map (
        clk => clk,
        reset => rst,
        data_in => selector_index,
        data_out => selector_index_delayed
    );

    ram_data_delay_line : vector_delay_line
    generic map (
        WIDTH => 18, -- delay line bit width
        DEPTH => 2 -- Number of delay stages
    )
    port map (
        clk => clk,
        reset => rst,
        data_in => inverse_ram_data,
        data_out => ram_data_delayed
    );

    -- Pipeline Registers
    register_inputs : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                mid_reg <= (others => '0');
                min_reg <= (others => '0');
            else
                mid_reg <= mid;
                min_reg <= min;
            end if;
        end if; 
    end process register_inputs;

    -- Stage 1 : Calculate c - m (used in F calculation)
    calculate_c_minus_m : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                stage1_out <= X"00";
            else
                stage1_out <= unsigned(mid_reg) - unsigned(min_reg);
            end if;
        end if;
    end process calculate_c_minus_m;

    stage_1_30b <= (29 downto 8 => '0') & unsigned(stage1_out); -- Convert 8b to 24b

    -- Stage 2: multiply ((c-m)<<16) by inverse of delta (done in DSP) (used in F calculation)
    divide : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                stage_3_mult_out_shifted <= (others => '0');
            else
                stage_3_mult_out_shifted <= shift_right(unsigned(stage_3_mult_out), 16)(23 downto 0); -- Shift right by 16 bits (precision factor)
            end if;
        end if;
    end process divide;

    -- stage 3: calculate F based on selector_index
    calculate_f : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                f <=(others => '0');
            else
                case selector_index_delayed is
                    when "001" => 
                        f <= unsigned(X"00FFFF" - stage_3_mult_out_shifted); 
                    when "011" =>
                        f <= unsigned(X"00FFFF" - stage_3_mult_out_shifted); 
                    when "101" =>
                        f <= unsigned(X"00FFFF" - stage_3_mult_out_shifted); 
                    when others =>
                            f <= stage_3_mult_out_shifted;
                end case;   
            end if;
        end if;
    end process calculate_f;

    -- stage 4: bit shift I by 16
    selector_index_24b <= (23 downto 3 => '0') & unsigned(selector_index_delayed);
    shift_i : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                I_shifted <= (others => '0');
            else
                I_shifted <= shift_left(unsigned(selector_index_24b), 16);
            end if;
        end if;
    end process shift_i;

    -- Stage 5: Calculate H
    calculate_h : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' or delta_inverse = X"00" then
                H <= (others => '0');
            else
                H <= std_logic_vector(unsigned(I_shifted) + unsigned(f));
            end if;
        end if;
    end process calculate_h;

end rtl;  