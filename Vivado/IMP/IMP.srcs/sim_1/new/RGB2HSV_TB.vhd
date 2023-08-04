----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2023 06:08:07 PM
-- Design Name: 
-- Module Name: RGB2HSV_TB - sim
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

entity RGB2HSV_TB is
end RGB2HSV_TB;

architecture sim of RGB2HSV_TB is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal rgb_in : std_logic_vector(23 downto 0) := (others => '0');
    signal data_valid : std_logic := '0';


    signal h : std_logic_vector(23 downto 0) := (others => '0');
    signal s : std_logic_vector(15 downto 0) := (others => '0');
    signal v : std_logic_vector(7 downto 0) := (others => '0');

    signal data_out_ready : std_logic := '0';
    signal n_core_busy : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.RGB2HSV_Top
        port map (
            clk => clk,
            rst => rst,
            RGB => rgb_in,
            data_valid => data_valid,

            h => h,
            s => s,
            v => v,

            data_out_ready => data_out_ready,
            n_core_busy => n_core_busy
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

        
        
        process is
        variable delay_ns : integer := 10;
        variable wait_rst : boolean := TRUE;
        begin
            rst <= '1';
            wait_rst := FALSE;
            data_valid <= '0';
            RGB_IN <= X"000000"; --0
            wait for 50 ns;

            rst <= '0';
            --wait for 10 ns;

            data_valid <= '1';
            rgb_in <= X"abcdef";
            wait for delay_ns * ns;
    
            rgb_in <= X"FFFFFF";
            wait for delay_ns * ns;
    
            rgb_in <= X"FF00FF";
            wait for delay_ns * ns;
    
            rgb_in <= X"123479";
            wait for delay_ns * ns;

            rgb_in <= X"099817";
            wait for delay_ns * ns;
    
            rgb_in <= X"abbbac";
            wait for delay_ns * ns;
    
            rgb_in <= X"ddef34";
            wait for delay_ns * ns;
    
            rgb_in <= X"12ffeb";
            wait_rst := TRUE;
            wait for delay_ns * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;

        end process;

end sim;