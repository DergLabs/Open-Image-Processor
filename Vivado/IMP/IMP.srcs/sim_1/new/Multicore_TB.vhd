----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2023 06:46:47 PM
-- Design Name: 
-- Module Name: Multicore_TB - Behavioral
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

entity Multicore_TB is
--  Port ( );
end Multicore_TB;

architecture sim of Multicore_TB is
    constant pixel_clock : integer := 74250000; -- pixel clk in Mhz
    constant pxclk_period : time := 1 sec / pixel_clock;

    constant clock : integer := 2*pixel_clock; -- core clk in Mhz -- !!!fix me!!! Unable to run at clk speeds that are not a multiple of pixel clk
    constant ClkPeriod : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal pixel_clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal RGB_IN : std_logic_vector(23 downto 0) := (others => '0');
    signal RGB_OUT : std_logic_vector(23 downto 0) := (others => '0');

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.ISP_top
        port map (
            pixel_clk => pixel_clk,
            core_clk => clk,
            rst => rst,
            RGB_In => RGB_IN,
            RGB_out => RGB_OUT
        );

        clk <= not clk after ClkPeriod / 2;
        pixel_clk <= not pixel_clk after pxclk_period / 2;
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    prog_counter <= (others => '0');
                else
                    if prog_counter = X"10" then
                        prog_counter <= (others => '0');
                    else
                        prog_counter <= prog_counter + 1;
                    end if;
                end if;
            end if;
        end process;

        
        
        process(pixel_clk)
        variable count : integer := 0;
        variable val : integer := 0;
        begin
        if rising_edge(pixel_clk) then
            if count = 0 then
                rst <= '1';
                RGB_IN <= (others => '0');
                val := 0; -- reset value at the start
            else
                rst <= '0';
                val := val + 5; -- increment by 5 each clock cycle
                RGB_IN <= std_logic_vector(to_unsigned(val, RGB_IN'length)); -- need to cast integer to std_logic_vector
            end if;

            count := count + 1;

        end if;
    end process;
end sim;
