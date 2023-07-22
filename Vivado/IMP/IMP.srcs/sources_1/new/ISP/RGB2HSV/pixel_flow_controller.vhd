----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2023 02:27:54 AM
-- Design Name: 
-- Module Name: pixel_flow_controller - rtl
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
use IEEE.NUMERIC_STD.ALL;

entity pixel_flow_controller is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        h_in : in std_logic_vector(23 downto 0);
        s_in : in std_logic_vector(15 downto 0);
        v_in : in std_logic_vector(7 downto 0);
        pixel_ready : in std_logic;
        data_input_valid: in std_logic;

        h_out : out std_logic_vector(23 downto 0);
        s_out : out std_logic_vector(15 downto 0);
        v_out : out std_logic_vector(7 downto 0);
        pixel_ready_hsv : out std_logic;
        n_core_busy : out std_logic
    );
end pixel_flow_controller;

architecture rtl of pixel_flow_controller is
begin
    

    core_busy_logic : process(clk)
    variable isHigh : std_logic := '0';
    begin   
        if rising_edge(clk) then
            if (rst = '1') then
                n_core_busy <= '1';
                pixel_ready_hsv <= '0';
            else
                if ((data_input_valid = '1' AND pixel_ready = '0') OR (isHigh = '1')) then
                    isHigh := '0';
                    n_core_busy <= '0';
                    pixel_ready_hsv <= '0';
                elsif (pixel_ready = '1' AND data_input_valid = '0') then
                    isHigh := '1';
                    n_core_busy <= '1';
                    pixel_ready_hsv <= '1';
                end if;
            end if;
        end if;
    end process core_busy_logic;

    update_output_pixel : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then 
                h_out <= (others => '0');
                s_out <= (others => '0');
                v_out <= (others => '0');
            else
                if pixel_ready = '1' then
                        h_out <= h_in;
                        s_out <= s_in;
                        v_out <= v_in;
                else 
                    h_out <= (others => '0');
                    s_out <= (others => '0');
                    v_out <= (others => '0');
                end if;
            end if;
        end if;
    end process update_output_pixel;       

end rtl;