library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexor is

     port( CLK : in  STD_LOGIC;
           digito1 : in  STD_LOGIC_VECTOR(6 downto 0);
			  digito2 : in  STD_LOGIC_VECTOR(6 downto 0);
			  digito3 : in  STD_LOGIC_VECTOR(6 downto 0);
			  digito4 : in  STD_LOGIC_VECTOR(6 downto 0);
			  AN : out  STD_LOGIC_VECTOR(3 downto 0);
           numdisplay : out  STD_LOGIC_VECTOR(6 downto 0));

end multiplexor;

architecture Behavioral of multiplexor is

signal contador: integer range 0 to 3:= 0;

begin

		process(CLK, digito1, digito2, digito3, digito4)	
			  begin
			  
					if(rising_edge(CLK))then					
										
						case(contador) is
						when 0 =>
							AN <= "0001";
							numdisplay<=digito1;
							contador<=contador+1;
						when 1 =>
							AN <= "0010";
							numdisplay<=digito2;
							contador<=contador+1;
						when 2 =>
							AN <= "0100";
							numdisplay<=digito3;
							contador<=contador+1;
						when 3 =>
							AN <= "1000";
							numdisplay<=digito4;						
							if (contador=3) then
								contador<=0;
							end if;	
						end case;						
					end if;
		end process;


end Behavioral;
