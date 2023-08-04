----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2023 06:59:21 PM
-- Design Name: 
-- Module Name: back_calculate_c - Behavioral
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

entity back_calculate_c_m is
    Port ( 
        --inputs 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        h : in STD_LOGIC_VECTOR (23 downto 0);
        i : in STD_LOGIC_VECTOR (2 downto 0);
        d : in STD_LOGIC_VECTOR (7 downto 0);
        v : in STD_LOGIC_VECTOR (7 downto 0);

        --outputs
        c : out STD_LOGIC_VECTOR (7 downto 0);
        m : out STD_LOGIC_VECTOR (7 downto 0)
    );
end back_calculate_c_m;

architecture Behavioral of back_calculate_c_m is
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
    

    -- Delay Line signals
    signal d_delayed : std_logic_vector(7 downto 0) := (others => '0');
    signal v_delayed : std_logic_vector(7 downto 0) := (others => '0');
    signal i_delayed : std_logic_vector(2 downto 0) := (others => '0');
    signal h_delayed : std_logic_vector(23 downto 0) := (others => '0');

    -- RGB input signals
    signal h_reg : std_logic_vector(23 downto 0) := (others => '0');
    signal i_reg : std_logic_vector(2 downto 0) := (others => '0');
    signal d_reg : std_logic_vector(7 downto 0) := (others => '0');

    -- DSP Input Signals
    signal a_input : std_logic_vector(29 downto 0) := (others => '0');
    signal b_input : std_logic_vector(17 downto 0):= (others => '0');
    signal c_input : std_logic_vector(47 downto 0):= (others => '0');

    -- DSP Output Signals
    signal carry_out : std_logic_vector(3 downto 0) := (others => '0');
    signal p_out : std_logic_vector(47 downto 0) := (others => '0');
    signal p_out_reg : unsigned(23 downto 0) := (others => '0');
    signal p_out_24b_reg : unsigned(23 downto 0) := (others => '0');
    signal p_out_24b_sub_reg : unsigned(23 downto 0) := (others => '0');

    -- check f signals
    signal f : unsigned(23 downto 0) := (others => '0');

    -- calculate F * d stage sginals
    signal f_d : unsigned(31 downto 0) := (others => '0');

    -- calculate F * d shift stage signals
    signal f_d_shift : unsigned(7 downto 0) := (others => '0');

    -- calculate v sub d stage signals
    signal min : unsigned(7 downto 0) := (others => '0');

begin

    d_delay_line : vector_delay_line
    generic map (
        WIDTH => 8, -- delay line bit width
        DEPTH => 7 -- Number of delay stages
    )
    port map (
        clk => clk,
        reset => rst,
        data_in => d,
        data_out => d_delayed
    );

    v_delay_line : vector_delay_line
    generic map (
        WIDTH => 8, -- delay line bit width
        DEPTH => 8 -- Number of delay stages
    )
    port map (
        clk => clk,
        reset => rst,
        data_in => v,
        data_out => v_delayed
    );

    i_delay_line : vector_delay_line
    generic map (
        WIDTH => 3, -- delay line bit width
        DEPTH => 7 -- Number of delay stages
    )
    port map (
        clk => clk,
        reset => rst,
        data_in => i,
        data_out => i_delayed 
    );

    h_delay_line : vector_delay_line
    generic map (
        WIDTH => 24, -- delay line bit width
        DEPTH => 5 -- Number of delay stages
    )
    port map (
        clk => clk,
        reset => rst,
        data_in => h,
        data_out => h_delayed
    );

    registers : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                h_reg <= (others => '0');
                i_reg <= (others => '0');
                d_reg <= (others => '0');
            else
                -- Assign RGB inpit to Register, resize to 12-bits. MSB's are 0
                h_reg <= h;
                i_reg <= i;
                d_reg <= d_delayed;
            end if;
        end if; 
    end process registers;

    -- Assign inputs to DSP48E1 inputs
    a_input(15 downto 0) <= X"FFFF";
    b_input(2 downto 0) <= i_reg;
    --C_input(23 downto 0) <= h_reg;

    DSP48E1_F_Calculate : DSP48E1
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
    P => p_out,                         -- 48-bit output: Primary data output

    -- Cascade: 30-bit (each) input: Cascade Ports
    ACIN => (others => '0'),            -- 30-bit input: A cascade data input
    BCIN => (others => '0'),            -- 18-bit input: B cascade input
    CARRYCASCIN => '0',                 -- 1-bit input: Cascade carry input
    MULTSIGNIN => '0',                  -- 1-bit input: Multiplier sign input
    PCIN => (others => '0'),            -- 48-bit input: P cascade input

    -- Control: 4-bit (each) input: Control Inputs/Status Bits
    ALUMODE => "0000",                  -- 4-bit input: ALU control input (0011 for sub (C-A*B))
    CARRYINSEL => "000",                -- 3-bit input: Carry select input
    CLK => clk,                         -- 1-bit input: Clock input
    INMODE => "00000",                  -- 5-bit input: INMODE control input
    OPMODE => "0000101",                -- 7-bit input: Operation mode input (C-A*B)

    -- Data: 30-bit (each) input: Data Ports
    A => a_input,                       -- 30-bit input: A data input
    B => b_input,                       -- 18-bit input: B data input
    C => (others => '0'),                       -- 48-bit input: C data input
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

    -- retiming registers for the output of the multiplier
    register_mult_out : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                p_out_reg <= (others => '0');
            else
                p_out_reg <= unsigned(p_out(23 downto 0));
            end if;
        end if;
    end process register_mult_out;

    -- second Register for the output of the multiplier
    register_mult_out2 : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                p_out_24b_reg <= (others => '0');
            else
                p_out_24b_reg <= (unsigned(h_delayed) - p_out_reg);
            end if;
        end if;
    end process register_mult_out2;

    -- Subtraction output register
    register_sub_out : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                p_out_24b_sub_reg <= (others => '0');
            else
                p_out_24b_sub_reg <= 65535 - p_out_24b_reg;
            end if;
        end if;
    end process register_sub_out;

    check_selector_index : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                f <= (others => '0');
            else
                if (i_delayed = b"001" or i_delayed = b"011" or i_delayed = b"101") then
                    f <= p_out_24b_sub_reg; 
                else
                    f <= p_out_24b_reg;
                end if;
            end if;
        end if;
    end process check_selector_index;


    calculate_c_mult_f_d : process(clk) -- smaller multiplication, we dont need to use a DSP for this 
    begin
        if rising_edge(clk) then
            if rst = '1' then
                f_d <= (others => '0');
            else
                f_d <= f * unsigned(d_delayed);
            end if;
        end if;
    end process calculate_c_mult_f_d;

    
    calculate_c_shift_f_d : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                f_d_shift <= (others => '0');
            else
                f_d_shift <= shift_right(f_d, 16)(7 downto 0);
            end if;
        end if;
    end process calculate_c_shift_f_d;


    calculate_m : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                min <= (others => '0');
            else
                min <= unsigned(v_delayed) - unsigned(d_reg);
            end if;
        end if;
    end process calculate_m;


    generate_m_c : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1' or v_delayed = X"00") then
                c <= (others => '0');
                m <= (others => '0');
            else
                c <= std_logic_vector(f_d_shift + min);
                m <= std_logic_vector(min);
            end if;
        end if;
    end process generate_m_c;

end Behavioral;
