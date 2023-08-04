----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2023 06:46:47 PM
-- Design Name: 
-- Module Name: HSV2RGB_TB - Behavioral
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

entity HSV2RGB_TB is
--  Port ( );
end HSV2RGB_TB;

architecture sim of HSV2RGB_TB is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal h : std_logic_vector(23 downto 0) := (others => '0');
    signal s : std_logic_vector(15 downto 0) := (others => '0');
    signal v : std_logic_vector(7 downto 0) := (others => '0');
    signal pixel_ready_in : std_logic := '0';

    signal RGB_OUT : std_logic_vector(23 downto 0) := (others => '0');
    signal pixel_ready_out : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
begin

    TOP : entity work.HSV2RGB_Top
    port map (
        clk => clk,
        rst => rst,
        h => h,
        s => s,
        v => v,
        pixel_ready_in => pixel_ready_in,


        RGB_out => RGB_OUT,
        pixel_ready_out => pixel_ready_out
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
    variable wait_rst : boolean := TRUE;
    variable delay_ns : integer := 10;
    begin
        rst <= '1';
        wait_rst := FALSE;
        pixel_ready_in <= '0';
        h <= X"000000";
        s <= X"0000";
        v <= X"00";
        wait for 50 ns;

        rst <= '0';
        wait_rst := TRUE; 
        pixel_ready_in <= '1';
        h <= X"038019";
        s <= X"00FF";
        v <= X"EF";
        wait for delay_ns * ns;

        pixel_ready_in <= '1';
        h <= X"000000";
        s <= X"fffe";
        v <= X"ff";
        wait for delay_ns * ns;

        h <= X"050000";
        s <= X"d9aa";
        v <= X"ff";
        wait for delay_ns * ns;

        h <= X"03ab87";
        s <= X"f0c0";
        v <= X"79";
        wait for delay_ns * ns;

        h <= X"02190c";
        s <= X"15df";
        v <= X"98";
        wait for delay_ns * ns;

        h <= X"021000";
        s <= X"c825";
        v <= X"bb";
        wait for delay_ns * ns;

        h <= X"0118f1";
        s <= X"edec";
        v <= X"EF";
        wait for delay_ns * ns;

        h <= X"02e9f4";
        s <= X"edec";
        v <= X"ff";
        wait for delay_ns * ns;

        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;
end sim;
