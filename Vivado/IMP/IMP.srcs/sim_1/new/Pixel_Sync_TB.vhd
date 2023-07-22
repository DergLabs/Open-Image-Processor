----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2023 03:31:14 AM
-- Design Name: 
-- Module Name: Pixel_Sync_TB - Behavioral
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

entity Pixel_Sync_TB is
--  Port ( );
end Pixel_Sync_TB;

architecture Behavioral of Pixel_Sync_TB is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal vid_pVDE : std_logic := '1';
    signal vid_pHSync : std_logic := '1';
    signal vid_pVSync : std_logic := '1';

    signal vid_pVDE_o : std_logic := '0';
    signal vid_pHSync_o : std_logic := '0';
    signal vid_pVSync_o : std_logic := '0';


    signal prog_counter : unsigned(7 downto 0) := (others => '0');
begin

    Pixel_Sync : entity work.Pixel_Sync
        port map (
            pixel_clk => clk,
            vid_pVDE_in => vid_pVDE,
            vid_pHSync_in => vid_pHSync,
            vid_pVSync_in => vid_pVSync,

            vid_pVDE_out => vid_pVDE_o,
            vid_pHSync_out => vid_pHSync_o,
            vid_pVSync_out => vid_pVSync_o
        );

    clk <= not clk after clk_period / 2;


    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"42" then
                    prog_counter <= (others => '0');
                else
                    prog_counter <= prog_counter + 1;
                end if;
            end if;
        end if;
    end process;



    process
    begin

    end process;

end Behavioral;
