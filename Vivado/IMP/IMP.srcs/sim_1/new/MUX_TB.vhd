----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2023 09:41:52 PM
-- Design Name: 
-- Module Name: MUX_TB - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_TB is
end MUX_TB;

architecture sim of MUX_TB is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal rgb_out : std_logic_vector(23 downto 0) := (others => '0');
    signal sel : std_logic_vector(3 downto 0) := (others => '0');
    type std_logic_aoa is array (natural range <>) of std_logic_vector;
    signal core_rgb_bus_in : std_logic_aoa(0 to 14)(23 downto 0);

    signal prog_counter : unsigned(7 downto 0) := (others => '0');

begin

        MUX : entity work.MUX
            port map (
                clk => clk,
                rst => rst,
                rgb_in => core_rgb_bus_in,
                sel => sel,
                rgb_out => rgb_out
            );

        clk <= not clk after clk_period / 2;
 
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    prog_counter <= (others => '0');
                else
                    if prog_counter = X"0E" then
                        prog_counter <= (others => '0');
                    else
                        prog_counter <= prog_counter + 1;
                    end if;
                end if;
            end if;
        end process;

        
        
        process(clk)
            variable count : integer := 0;
            variable rgb_val : integer := 0;
            variable sel_val : integer := 0;
        begin
            if rising_edge(clk) then
                if count = 0 then
                    --rst <= '1';
                    for i in 0 to 14 loop
                        core_rgb_bus_in(i) <= (others => '0');
                    end loop;
                    sel <= (others => '0');
                    rgb_val := 0; -- reset value at the start
                    sel_val := 0;
                else
                    if sel_val = 14 then
                        sel_val := 0;
                    else
                        sel_val := sel_val + 1;
                    end if;
                    rst <= '0';
                    sel <= std_logic_vector(to_unsigned(sel_val, sel'length));
                    for i in 0 to 14 loop
                        rgb_val := rgb_val + 5;
                        core_rgb_bus_in(i) <= std_logic_vector(to_unsigned(rgb_val, core_rgb_bus_in(i)'length));
                    end loop;
                end if;

                count := count + 1;

            end if;
        end process;
end sim;

