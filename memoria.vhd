----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:31 02/22/2012 
-- Design Name: 
-- Module Name:    memoria - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoria is
    Port ( BTN3 : in  STD_LOGIC;
           sw : in  STD_LOGIC;
           digito1 : in  STD_LOGIC_VECTOR (3 downto 0);
           digito2 : in  STD_LOGIC_VECTOR (3 downto 0);
           digito3 : in  STD_LOGIC_VECTOR (3 downto 0);
           digito4 : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           digOut1 : out  STD_LOGIC_VECTOR (3 downto 0);
           digOut2 : out  STD_LOGIC_VECTOR (3 downto 0);
           digOut3 : out  STD_LOGIC_VECTOR (3 downto 0);
           digOut4 : out  STD_LOGIC_VECTOR (3 downto 0));
end memoria;

architecture Behavioral of memoria is

begin

process(clk, digito1, digito2, digito3, digito4, BTN3, sw)	
		begin			  
					if(rising_edge(clk))then	
					
						if(BTN3 = '1' AND sw = '1')then
							digOut1 <= digito1;
							digOut2 <= digito2;
							digOut3 <= digito3;
							digOut4 <= digito4;
						end if;

					end if;

		end process;
		
end Behavioral;

