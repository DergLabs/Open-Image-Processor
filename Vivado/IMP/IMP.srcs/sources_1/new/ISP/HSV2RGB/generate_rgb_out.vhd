----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2023 07:40:13 PM
-- Design Name: 
-- Module Name: generate_rgb_out - Behavioral
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

entity generate_rgb_out is
    Port (
        -- inputs
        clk : in std_logic;
        rst : in std_logic;
        i : in std_logic_vector(2 downto 0);
        v : in std_logic_vector(7 downto 0);
        c : in std_logic_vector(7 downto 0);
        m : in std_logic_vector(7 downto 0);
        pixel_ready_in : in std_logic;
    
        -- outputs
        pixel_ready_out : out std_logic;
        r : out std_logic_vector(7 downto 0);
        g : out std_logic_vector(7 downto 0);
        b : out std_logic_vector(7 downto 0);
        rgb_out : out std_logic_vector(23 downto 0)
     );
end generate_rgb_out;

architecture Behavioral of generate_rgb_out is
begin

    pixel_ready_logic : process(clk)
    variable isHigh : std_logic;
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                pixel_ready_out <= '0';
            else
                if (pixel_ready_in = '0') OR (isHigh = '1') then
                    isHigh := '0';
                    pixel_ready_out <= '0';
                elsif pixel_ready_in = '1' then
                    isHigh := '1';
                    pixel_ready_out <= '1';
                end if;
            end if;
        end if;
    end process pixel_ready_logic;
                    


    assign_rgb : process (clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                r <= (others => '0');
                g <= (others => '0');
                b <= (others => '0');
                rgb_out <= (others => '0');
            else
                if (pixel_ready_in = '1') then 
                    case i is
                        when b"000" => --I = 0
                            r <= v;
                            g <= c;
                            b <= m;
                            rgb_out <= v & c & m;
                            report "I = 0 Case";
                        when b"001" => -- I = 1
                            r <= c;
                            g <= v;
                            b <= m;
                            rgb_out <= c & v & m;
                            report "I = 1 Case";
                        when b"010" => -- I = 2
                            r <= m;
                            g <= v;
                            b <= c;
                            rgb_out <= m & v & c;
                            report "I = 2 Case";
                        when b"011" => -- I = 3
                            r <= m;
                            g <= c;
                            b <= v;
                            rgb_out <= m & c & v;
                            report "I = 3 Case";
                        when b"100" => -- I = 4
                            r <= c;
                            g <= m;
                            b <= v;
                            rgb_out <= c & m & v;
                            report "I = 4 Case";
                        when b"101" => -- I = 5
                            r <= v;
                            g <= m;
                            b <= c;
                            rgb_out <= v & m & c;
                            report "I = 5 Case";
                        when others =>
                            report "ERROR: mux_sel is not a valid value";
                            r <= (others => '0');
                            g <= (others => '0');
                            b <= (others => '0');
                            rgb_out <= (others => '0');
                    end case;
                else
                    --r <= (others => '0');
                    --g <= (others => '0');
                    --b <= (others => '0');
                    --rgb_out <= (others => '0');
                end if;
            end if;
        end if;
    end process assign_rgb;

end Behavioral;
