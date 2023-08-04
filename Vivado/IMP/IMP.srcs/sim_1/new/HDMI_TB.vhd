----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/01/2023 02:42:05 PM
-- Design Name: 
-- Module Name: HDMI_TB - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity HDMI_TB is
--  Port ( );
end HDMI_TB;

architecture sim of HDMI_TB is
    constant clock : integer := 50e6; -- core clk in Mhz -- !!!fix me!!! Unable to run at clk speeds that are not a multiple of pixel clk
    constant ClkPeriod : time := 1 sec / clock;

    constant TMDS_clock : integer := 74250000; -- pixel clk in Mhz
    constant tmds_clk_period : time := 1 sec / TMDS_clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal TMDS_clk : std_logic := '1';

    -- HDMI Aux signals
    signal hdmi_ddc_scl_io : std_logic := '0';
    signal hdmi_ddc_sda_io : std_logic := '0';
    signal hdmi_hdmi_in_hpd : std_logic := '0';
    signal HDMI_hdmi_in_OEN : std_logic := '0';

    -- HDMI input TMDS signals
    signal TMDS_clk_hdmi_in_n : std_logic := '0';
    signal TMDS_clk_hdmi_in_p : std_logic := '0';
    signal TMDS_data_hdmi_in_n : std_logic_vector(2 downto 0) := (others => '0');
    signal TMDS_data_hdmi_in_p : std_logic_vector(2 downto 0) := (others => '0');

    -- HDMI output TMDS signals
    signal HDMI_hdmi_out_OEN : std_logic := '0';
    signal TMDS_clk_hdmi_out_n : std_logic := '0';
    signal TMDS_clk_hdmi_out_p : std_logic := '0';
    signal TMDS_data_hdmi_out_n : std_logic_vector(2 downto 0) := (others => '0');
    signal TMDS_data_hdmi_out_p : std_logic_vector(2 downto 0) := (others => '0');

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin

    TOP : entity work.top
        port map (
            -- System signals
            sys_clk => clk, 
            rst_n => rst,

            -- HDMI Aux signals
            hdmi_ddc_scl_io => hdmi_ddc_scl_io,
            hdmi_ddc_sda_io => hdmi_ddc_sda_io,
            hdmi_hdmi_in_hpd => hdmi_hdmi_in_hpd,
            HDMI_hdmi_in_OEN => HDMI_hdmi_in_OEN,

            -- HDMI input TMDS signals
            TMDS_clk_hdmi_in_n => TMDS_clk_hdmi_in_n,
            TMDS_clk_hdmi_in_p => TMDS_clk_hdmi_in_p,
            TMDS_data_hdmi_in_n => TMDS_data_hdmi_in_n,
            TMDS_data_hdmi_in_p => TMDS_data_hdmi_in_p,

            -- HDMI output TMDS signals
            HDMI_hdmi_out_OEN => HDMI_hdmi_out_OEN,
            TMDS_clk_hdmi_out_n => TMDS_clk_hdmi_out_n,
            TMDS_clk_hdmi_out_p => TMDS_clk_hdmi_out_p,
            TMDS_data_hdmi_out_n => TMDS_data_hdmi_out_n,
            TMDS_data_hdmi_out_p => TMDS_data_hdmi_out_p
        );

        clk <= not clk after ClkPeriod / 2;
        TMDS_clk <= not TMDS_clk after tmds_clk_period / 2;
        
        process(TMDS_clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    prog_counter <= (others => '0');
                else
                    if prog_counter = X"FF" then
                        prog_counter <= (others => '0');
                    else
                        prog_counter <= prog_counter + 1;
                    end if;
                    
                    

                end if;
            end if;
        end process;

        
        
        process(clk)
        variable count : integer := 0;
        variable val : integer := 0;
        begin
        if rising_edge(clk) then
            if count = 0 then
                rst <= '1';
                val := 0; -- reset value at the start
            else
                rst <= '0';
                val := val + 5; -- increment by 5 each clock cycle
            end if;

            count := count + 1;

        end if;
    end process;
end sim;
