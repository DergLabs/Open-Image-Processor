----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2023 08:59:47 PM
-- Design Name: 
-- Module Name: ALU_REG_CTRL_IO - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple 8-bit interface for loading ALU registers with data from external MCU
--              This module currently does not use any standard interface, its a simplified version of 8-bit SPI
--              To use, pull CS high, then clock in 64 bits of data, MSB first.
--              64-bits are shifted into a temp alu_data register
--              Data format is as follows: [63:51 - ALU CTRL][50:0 - ALU Operand]
--              If  bit 63 is 1, then the data is for the RGB ALU, otherwise its for the HSV ALU. Bit 62 enables H and bit 61 enables SV 
--              When selecting the RGB ALU, only bits 26-0 are used for the ALU Operand, bits 50-27 are ignored
--              When selecting the H or SV ALU, bits 50-0 are used for the ALU Operand
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

entity ALU_REG_CTRL_IO is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        cs : in STD_LOGIC;
        sclk : in STD_LOGIC;
        din : in STD_LOGIC;

        rgb_alu_operand : out STD_LOGIC_VECTOR (26 downto 0);
        rgb_alu_opmode : out STD_LOGIC_VECTOR (10 downto 0);
        rgb_alu_en : out STD_LOGIC;

        hsv_alu_operand : out STD_LOGIC_VECTOR (50 downto 0);
        h_alu_opmode : out STD_LOGIC_VECTOR (10 downto 0);
        sv_alu_opmode : out STD_LOGIC_VECTOR (10 downto 0);
        h_alu_en : out STD_LOGIC;
        sv_alu_en : out STD_LOGIC

    );
end ALU_REG_CTRL_IO;

architecture Behavioral of ALU_REG_CTRL_IO is
    constant SRL_DEPTH : std_logic_vector(3 downto 0) := "0011"; -- 3-bit deep shift register used for clock alignment

    signal sclk_a : std_logic := '0';
    signal cs_a : std_logic := '0';
    signal din_a : std_logic := '0';
    signal alu_data : std_logic_vector(63 downto 0) := (others => '0');

begin

    -- Shift register to align SCLK to CLK
    SRL16E_sclk_sync : SRL16E
    generic map (
        INIT => X"0000")
    port map (
        Q => sclk_a,       -- SRL data output
        A0 => SRL_DEPTH(0),     -- Select[0] input
        A1 => SRL_DEPTH(1),     -- Select[1] input
        A2 => SRL_DEPTH(2),     -- Select[2] input
        A3 => SRL_DEPTH(3),     -- Select[3] input
        CE => '1',     -- Clock enable input
        CLK => clk,   -- Clock input
        D => sclk        -- SRL data input
    );

    -- Shift register to align CS to CLK
    SRL16E_cs_sync : SRL16E
    generic map (
        INIT => X"0000")
    port map (
        Q => cs_a,       -- SRL data output
        A0 => SRL_DEPTH(0),     -- Select[0] input
        A1 => SRL_DEPTH(1),     -- Select[1] input
        A2 => SRL_DEPTH(2),     -- Select[2] input
        A3 => SRL_DEPTH(3),     -- Select[3] input
        CE => '1',     -- Clock enable input
        CLK => clk,   -- Clock input
        D => cs        -- SRL data input
    );
    
    -- Shift register to align DIN to CLK
    SRL16E_din_sync : SRL16E
    generic map (
        INIT => X"0000")
    port map (
        Q => din_a,       -- SRL data output
        A0 => SRL_DEPTH(0),     -- Select[0] input
        A1 => SRL_DEPTH(1),     -- Select[1] input
        A2 => SRL_DEPTH(2),     -- Select[2] input
        A3 => SRL_DEPTH(3),     -- Select[3] input
        CE => '1',     -- Clock enable input
        CLK => clk,   -- Clock input
        D => din        -- SRL data input
    );


    recieve_data : process(sclk_a) -- Pack data into 64-bit input register
    begin
        if rising_edge(sclk_a) then
            if (rst = '1') then
                alu_data <= (others => '0');
            else
                if (cs_a = '0') then
                    alu_data <= alu_data(62 downto 0) & din_a; -- Shift in data one bit per clock
                end if;
            end if;
        end if;
    end process recieve_data;

    decode_data : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                rgb_alu_operand <= (others => '0');
                rgb_alu_opmode <= (others => '0');
                hsv_alu_operand <= (others => '0');
                h_alu_opmode <= (others => '0');   
            else
                if (cs_a = '1') then -- Only dispatch data if CS is high and a transmission is complete
                    if (alu_data(63)) then
                        rgb_alu_en <= alu_data(63);
                        rgb_alu_operand <= alu_data(26 downto 0); -- ALU Data
                        rgb_alu_opmode <= 11b"01100110000"; -- set to constant ADD
                        --rgb_alu_opmode <= alu_data(60 downto 51); -- ALU OPCODE
                    else
                        h_alu_en <= alu_data(62);
                        sv_alu_en <= alu_data(61);
                        hsv_alu_operand <= alu_data(50 downto 0);
                        --h_alu_opmode <= alu_data(60 downto 51);
                        h_alu_opmode <= 11b"01100110000";
                        sv_alu_opmode <= 11b"01100110000";
                    end if;
                end if;
            end if;
        end if;
    end process decode_data;

end Behavioral;
