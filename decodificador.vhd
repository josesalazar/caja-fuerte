library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decodificador is
		Port (	digito1 : in STD_LOGIC_VECTOR (3 downto 0);
					digito2 : in STD_LOGIC_VECTOR (3 downto 0);
					digito3 : in STD_LOGIC_VECTOR (3 downto 0);
					digito4 : in STD_LOGIC_VECTOR (3 downto 0);
					Outdigito1 : out STD_LOGIC_VECTOR (6 downto 0);
					Outdigito2 : out STD_LOGIC_VECTOR (6 downto 0);
					Outdigito3 : out STD_LOGIC_VECTOR (6 downto 0);
					Outdigito4 : out STD_LOGIC_VECTOR (6 downto 0));
end decodificador;

architecture Behavioral of decodificador is

begin

		process(digito1,digito2,digito3,digito4)is
		
		begin
			
				case digito1 is
				when "0000" => Outdigito1 <= "0000001";
				when "0001" => Outdigito1 <= "1001111";
				when "0010" => Outdigito1 <= "0010010";
				when "0011" => Outdigito1 <= "0000110";
				when "0100" => Outdigito1 <= "1001100";
				when "0101" => Outdigito1 <= "0100100";
				when "0110" => Outdigito1 <= "0100000";
				when "0111" => Outdigito1 <= "0001111";
				when "1000" => Outdigito1 <= "0000000";
				when "1001" => Outdigito1 <= "0000100";
				when others => Outdigito1 <= "1111111";
				end case;

				case digito2 is
				when "0000" => Outdigito2 <= "0000001";
				when "0001" => Outdigito2 <= "1001111";
				when "0010" => Outdigito2 <= "0010010";
				when "0011" => Outdigito2 <= "0000110";
				when "0100" => Outdigito2 <= "1001100";
				when "0101" => Outdigito2 <= "0100100";
				when "0110" => Outdigito2 <= "0100000";
				when "0111" => Outdigito2 <= "0001111";
				when "1000" => Outdigito2 <= "0000000";
				when "1001" => Outdigito2 <= "0000100";
				when others => Outdigito2 <= "1111111";
				end case;
				
				case digito3 is
				when "0000" => Outdigito3 <= "0000001";
				when "0001" => Outdigito3 <= "1001111";
				when "0010" => Outdigito3 <= "0010010";
				when "0011" => Outdigito3 <= "0000110";
				when "0100" => Outdigito3 <= "1001100";
				when "0101" => Outdigito3 <= "0100100";
				when "0110" => Outdigito3 <= "0100000";
				when "0111" => Outdigito3 <= "0001111";
				when "1000" => Outdigito3 <= "0000000";
				when "1001" => Outdigito3 <= "0000100";
				when others => Outdigito3 <= "1111111";
				end case;

				case digito4 is
				when "0000" => Outdigito4 <= "0000001";
				when "0001" => Outdigito4 <= "1001111";
				when "0010" => Outdigito4 <= "0010010";
				when "0011" => Outdigito4 <= "0000110";
				when "0100" => Outdigito4 <= "1001100";
				when "0101" => Outdigito4 <= "0100100";
				when "0110" => Outdigito4 <= "0100000";
				when "0111" => Outdigito4 <= "0001111";
				when "1000" => Outdigito4 <= "0000000";
				when "1001" => Outdigito4 <= "0000100";
				when others => Outdigito4 <= "1111111";
				end case;

		end process;

end Behavioral;

