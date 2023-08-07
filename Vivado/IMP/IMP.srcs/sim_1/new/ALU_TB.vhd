----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2023 07:46:16 PM
-- Design Name: 
-- Module Name: ALU_TB - Behavioral
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

entity ALU_TB is
--  Port ( );
end ALU_TB;

architecture Behavioral of ALU_TB is
    constant clock : integer := 100e6;
    constant period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal rgb_data_in : std_logic_vector(23 downto 0) := (others => '0');
    signal rgb_operand : std_logic_vector(26 downto 0) := (others => '0');
    signal r_op : signed(8 downto 0) := (others => '0');
    signal g_op : signed(8 downto 0) := (others => '0');
    signal b_op : signed(8 downto 0) := (others => '0');

    signal opcode : std_logic_vector(10 downto 0) := (others => '0');
    signal en : std_logic := '0';

    signal rgb_data_out : std_logic_vector(23 downto 0) := (others => '0');

    signal h_in :std_logic_vector(23 downto 0) := (others => '0');
    signal s_in :std_logic_vector(15 downto 0) := (others => '0');
    signal v_in :std_logic_vector(7 downto 0) := (others => '0');

    signal h_op :signed(24 downto 0) := (others => '0');
    signal s_op :signed(16 downto 0) := (others => '0');
    signal v_op :signed(8 downto 0) := (others => '0');

    signal opcode_h : std_logic_vector(10 downto 0) := (others => '0');
    signal opcode_sv : std_logic_vector(10 downto 0) := (others => '0');
    signal en_h : std_logic := '0';
    signal en_sv : std_logic := '0';

    signal h_out :std_logic_vector(23 downto 0) := (others => '0');
    signal s_out :std_logic_vector(15 downto 0) := (others => '0');
    signal v_out :std_logic_vector(7 downto 0) := (others => '0');

begin


    RGB_ALU : entity work.RGB_ALU
        port map (
            clk => clk,
            rst => rst,
            rgb_data_in => rgb_data_in,
            r_operand => r_op,
            g_operand => g_op,
            b_operand => b_op,
            opcode => opcode,
            en => en,
            rgb_data_out => rgb_data_out
    );

    HSV_ALU : entity work.HSV_ALU
        port map(
            clk => clk,
            rst => rst,
            h_in => h_in,
            s_in => s_in,
            v_in => v_in,

            h_operand => h_op,
            s_operand => s_op,
            v_operand => v_op,

            opcode_h => opcode_h,
            opcode_sv => opcode_sv,
            en_h => en_h,
            en_sv => en_sv,

            h_out => h_out,
            s_out => s_out,
            v_out => v_out
    );

    clk <= not clk after period / 2;

    process is
        variable wait_rst : boolean := TRUE;
        variable delay_ns : integer := 10;
        begin
            rst <= '1';
            wait_rst := FALSE;
            rgb_data_in <= (others => '0');
            rgb_operand <= (others => '0');
            opcode <= (others => '0');
            en <= '0';
            wait for 100 ns;
    
            rst <= '0';
            en <= '1';
            en_h <= '1';
            en_sv <= '1';

            rgb_data_in <= X"11F311"; -- R (17) G (243) B (17)
            h_in <= X"02F9B8";
            s_in <= X"8000";
            v_in <= X"80";

            r_op <= "010010110"; -- 150
            g_op <= "111000110"; -- -58
            b_op <= "000001100"; -- 12

            h_op <= 25b"1111111101000110011101000"; -- -95,000
            s_op <= 17b"00001001110001000"; -- 5,000
            v_op <= 9b"010000000"; -- 128

            opcode <= "01100110000"; -- ADD (10-4 is OPMODE, 3-0 is ALUMODE)
            opcode_h <= "01100110000"; -- ADD (10-4 is OPMODE, 3-0 is ALUMODE)
            opcode_sv <= "01100110000"; -- ADD (10-4 is OPMODE, 3-0 is ALUMODE)
            wait for delay_ns * ns;

            r_op <= "011111010"; -- 250
            g_op <= "100000110"; -- -250
            b_op <= "111101111"; -- -17

            h_op <= 25b"1111111001111001011000000"; -- -200,000
            s_op <= 17b"01001110001000000"; -- 40,000
            v_op <= 9b"110000000"; -- -128
            --rgb_operand <= r_op & g_op & b_op;
            opcode <= "01100110000"; -- ADD (10-4 is OPMODE, 3-0 is ALUMODE)
            opcode_h <= "01100110000"; -- ADD (10-4 is OPMODE, 3-0 is ALUMODE)
            opcode_sv <= "01100110000"; -- ADD (10-4 is OPMODE, 3-0 is ALUMODE)
            wait for delay_ns * ns;

            
            
            wait_rst := TRUE;
            if (wait_rst) then
                wait for 200 ns;
            end if;
        end process;

end Behavioral;
