----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2023 03:41:23 PM
-- Design Name: 
-- Module Name: HSV_ALU - Behavioral
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

entity HSV_ALU is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;

        h_in : in std_logic_vector(23 downto 0);
        s_in : in std_logic_vector(15 downto 0);
        v_in : in std_logic_vector(7 downto 0);

        h_addend : in signed(24 downto 0);
        s_addend : in signed(16 downto 0);
        v_addend : in signed(8 downto 0);

        h_out : out std_logic_vector(23 downto 0);
        s_out : out std_logic_vector(15 downto 0);
        v_out : out std_logic_vector(7 downto 0)
     );
end HSV_ALU;

architecture Behavioral of HSV_ALU is
    signal h_in_signed : signed(24 downto 0);
    signal s_in_signed : signed(16 downto 0);
    signal v_in_signed : signed(8 downto 0);

    signal h_out_unsigned : unsigned(24 downto 0);
    signal s_out_unsigned : unsigned(16 downto 0);
    signal v_out_unsigned : unsigned(8 downto 0);
begin

    h_in_signed <= signed(h_in);
    s_in_signed <= signed(s_in);
    v_in_signed <= signed(v_in);

    h_adder : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                h_out <= (others => '0');
                s_out <= (others => '0');
                v_out <= (others => '0');
            else
                h_out_unsigned <= unsigned(h_in_signed + h_addend);
                s_out_unsigned <= unsigned(s_in_signed + s_addend);
                v_out_unsigned <= unsigned(v_in_signed + v_addend);
                
                -- Add logic for min/max pinning
                
                h_out <= std_logic_vector(h_out_unsigned(23 downto 0));
                s_out <= std_logic_vector(s_out_unsigned(15 downto 0));
                v_out <= std_logic_vector(v_out_unsigned(7 downto 0));

            end if;
        end if;
    end process h_adder;
    

end Behavioral;
