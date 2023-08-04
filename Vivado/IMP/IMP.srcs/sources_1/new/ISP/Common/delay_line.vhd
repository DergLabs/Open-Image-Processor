----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2023 10:02:24 PM
-- Design Name: 
-- Module Name: calculate_h - Behavioral
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
--use IEEE.NUMERIC_STD_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vector_delay_line is
    generic(
        WIDTH : integer := 8;
        DEPTH : integer := 8
    );
    port(
        clk : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(WIDTH-1 downto 0);
        data_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end vector_delay_line;

architecture rtl of vector_delay_line is
      type delayline_type is array(0 to DEPTH-2) of std_logic_vector(WIDTH-1 downto 0);
      signal delay_line : delayline_type;
  begin

    create_delayline : for i in 0 to DEPTH-2 generate
        process(clk)
        begin
            if rising_edge(clk) then
                if (reset = '1') then
                    delay_line(i) <= (others => '0');
                else
                    if i = 0 then
                        delay_line(i) <= data_in;
                    else
                        delay_line(i) <= delay_line(i-1);
                    end if;
                end if;
            end if;
        end process;
    end generate create_delayline;

    output_assignment: process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                data_out <= (others => '0');
            else
                data_out <= delay_line(DEPTH-2);
            end if;
        end if;
    end process output_assignment;

end rtl;