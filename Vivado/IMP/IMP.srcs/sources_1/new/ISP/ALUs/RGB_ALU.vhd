----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2023 03:41:23 PM
-- Design Name: 
-- Module Name: RGB_ALU - Behavioral
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

entity RGB_ALU is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;

        -- Inputs
        rgb_data_in : in STD_LOGIC_VECTOR (23 downto 0);
        rgb_operand : in STD_LOGIC_VECTOR (23 downto 0);
        opcode : in STD_LOGIC_VECTOR (3 downto 0);

        -- Outputs
        rgb_data_out : out STD_LOGIC_VECTOR (23 downto 0)
    );
end RGB_ALU;

architecture Behavioral of RGB_ALU is

begin


end Behavioral;
