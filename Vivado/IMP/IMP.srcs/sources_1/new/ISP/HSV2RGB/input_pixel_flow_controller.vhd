----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2023 07:43:54 PM
-- Design Name: 
-- Module Name: input_pixel_flow_controller - Behavioral
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

entity input_pixel_flow_controller is
    Port ( 
        -- inputs
        clk : in std_logic;
        rst : in std_logic;
        pixel_ready : in std_logic;
        h : in std_logic_vector(23 downto 0);
        s : in std_logic_vector(15 downto 0);
        v : in std_logic_vector(7 downto 0);

        -- outputs
        h_out : out std_logic_vector(23 downto 0);
        s_out : out std_logic_vector(15 downto 0);
        v_out : out std_logic_vector(7 downto 0)
    );
end input_pixel_flow_controller;

architecture Behavioral of input_pixel_flow_controller is

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                h_out <= (others => '0');
                s_out <= (others => '0');
                v_out <= (others => '0');
            elsif pixel_ready = '1' then
                h_out <= h;
                s_out <= s;
                v_out <= v;
            end if;
        end if;
    end process;


end Behavioral;
