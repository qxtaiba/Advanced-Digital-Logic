----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:03 04/01/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_S : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_Out : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (3 downto 0);

begin

process (A, B, ALU_S)
	
begin
	case (ALU_S) is 
	when "000" => 
		ALU_Result <= std_logic_vector(signed(A)+signed(B));
	when "001" => 
		ALU_Result <= std_logic_vector(signed(A)-signed(B));
	when "010" => 
		ALU_Result <= A and B;
	when "011" => 
	    ALU_Result <= A or B;
	when "100" => 
	   ALU_Result <= std_logic_vector(shift_left(unsigned(A), to_Integer(unsigned(B))));
	when "101" => 
	   ALU_Result <= std_logic_vector(shift_right(unsigned(A), to_Integer(unsigned(B))));
	when "110" => 
	   ALU_Result <= std_logic_vector(shift_right(signed(A), to_Integer(unsigned(B))));
	when "111" => 
	   ALU_Result <= std_logic_vector(rotate_right(unsigned(A), to_Integer(unsigned(B))));
   when others =>
		ALU_Result <= (others => '0');
	end case;
  
end process;

 ALU_Out <= ALU_Result; -- ALU out

end Behavioral;

