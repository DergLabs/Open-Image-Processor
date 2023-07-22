----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2023 08:07:24 PM
-- Design Name: 
-- Module Name: PriorityEncoder_TB - Behavioral
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

entity PriorityEncoder_TB is
end PriorityEncoder_TB;

architecture sim of PriorityEncoder_TB is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal n_core_busy : std_logic_vector(14 downto 0) := (others => '1');
    signal core_select : std_logic_vector(3 downto 0) := (others => '0');

    signal prog_counter : unsigned(7 downto 0) := (others => '0');

begin

        PriorityEncoder : entity work.PriorityEncoder
            port map (
                clk => clk,
                rst => rst,
                n_core_busy => n_core_busy,
                core_select => core_select
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
            variable core_busy : unsigned(14 downto 0) := (others => '0');
        begin
            if rising_edge(clk) then
                if count = 0 then
                    core_busy(0) := '0';
                else
                    n_core_busy <= std_logic_vector(shift_right(unsigned(n_core_busy), 1));
                end if;

                count := count + 1;

            end if;
        end process;
end sim;
