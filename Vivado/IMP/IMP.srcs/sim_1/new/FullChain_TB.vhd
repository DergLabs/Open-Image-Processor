----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2023 06:46:47 PM
-- Design Name: 
-- Module Name: FullChain_TB - Behavioral
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

entity FullChain_TB is
--  Port ( );
end FullChain_TB;

architecture sim of FullChain_TB is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal rgb_in : std_logic_vector(23 downto 0) := (others => '0');
    signal data_in_valid : std_logic := '0';

    signal rgb_out : std_logic_vector(23 downto 0) := (others => '0');
    signal data_ready_rgb2hsv : std_logic := '0';
    signal data_ready_hsv2rgb : std_logic := '0';
    signal n_core_busy : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
begin

    TOP : entity work.ISPCore
    port map (
        clk => clk,
        rst => rst,
        RGB_IN => rgb_in,
        data_in_valid => data_in_valid,
        
        RGB_OUT => rgb_out,
        data_out_ready_rgb2hsv => data_ready_rgb2hsv,
        data_out_ready_hsv2rgb => data_ready_hsv2rgb,
        n_core_busy => n_core_busy
    );

    clk <= not clk after clk_period / 2;
    
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"1C" then
                    prog_counter <= (others => '0');
                else
                    prog_counter <= prog_counter + 1;
                end if;
            end if;
        end if;
    end process;

    process is
    variable delay_ns : integer := 130;
    begin
        rst <= '1';
        data_in_valid <= '0';
        rgb_in <= X"000000";
        wait for 100 ns;

        rst <= '0';
        data_in_valid <= '1';
        rgb_in <= X"abcdef";
        wait for 10 ns;
        data_in_valid <= '0';
        wait for delay_ns * ns;

        data_in_valid <= '1';
        rgb_in <= X"00FFFF";
        wait for 10 ns;
        data_in_valid <= '0';
        wait for delay_ns * ns;

        data_in_valid <= '1';
        rgb_in <= X"FF00FF";
        wait for 10 ns;
        data_in_valid <= '0';
        wait for delay_ns * ns;

        data_in_valid <= '1';
        rgb_in <= X"FFFF00";
        wait for 10 ns;
        data_in_valid <= '0';
        wait for delay_ns * ns;


    end process;

end sim;
