----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2023 09:37:27 PM
-- Design Name: 
-- Module Name: ALU_CTRL_TB - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_CTRL_TB is
--  Port ( );
end ALU_CTRL_TB;

architecture Behavioral of ALU_CTRL_TB is
    constant clock : integer := 200e6;
    constant period : time := 1 sec / clock;

    constant dclock : integer := 24e6;
    constant dperiod : time := 1 sec / dclock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal dclk : std_logic := '1';

    signal cs : std_logic := '0';
    signal din : std_logic_vector(7 downto 0) := (others => '0');

    signal rgb_alu_operand : std_logic_vector(23 downto 0) := (others => '0');
    signal rgb_alu_opmode : std_logic_vector(10 downto 0) := (others => '0');

    signal hsv_alu_operand : std_logic_vector(47 downto 0) := (others => '0');
    signal hsv_alu_opmode : std_logic_vector(10 downto 0) := (others => '0');
begin

    ALU_REG_CTRL_IO : entity work.ALU_REG_CTRL_IO
    port map (
        clk => clk,
        rst => rst,
        cs => cs,
        sclk => dclk,
        din => din,
        rgb_alu_operand => rgb_alu_operand,
        rgb_alu_opmode => rgb_alu_opmode,
        hsv_alu_operand => hsv_alu_operand,
        hsv_alu_opmode => hsv_alu_opmode
    );

    clk <= not clk after period / 2;
    dclk <= not dclk after dperiod / 2;

    process (clk)
    variable count : integer := 0;
    begin
        if rising_edge(clk) then
            if count = 0 then
                rst <= '1';
                count := 1;
            else
                rst <= '0';
                count := count + 1;
                if count = 50 then
                    count := 0;
                end if;
            end if;
        end if;
    end process;

    process(dclk)
    variable count : integer := 0;
    begin
        if rising_edge(dclk) then
            if count = 0 then
                cs <= '0';
                din <= X"00";
                count := 1;
            elsif count = 1 then
                cs <= '1';
                din <= X"de";
                count := 2;
            elsif count = 2 then
                cs <= '1';
                din <= X"ad";
                count := 3;
            elsif count = 3 then
                cs <= '1';
                din <= X"be";
                count := 4;
            elsif count = 4 then
                cs <= '1';
                din <= X"ef";
                count := 5;
            elsif count = 5 then
                cs <= '1';
                din <= X"00";
                count := 6;
            elsif count = 6 then
                cs <= '1';
                din <= X"10";
                count := 7;
            elsif count = 7 then
                cs <= '1';
                din <= X"20";
                count := 8;
            elsif count = 8 then
                cs <= '1';
                din <= X"30";
                count := 0;
            end if;
        end if;
    end process;

end Behavioral;
