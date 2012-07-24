library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity refreshDisplay is
    Port ( clk50Mhz : in  STD_LOGIC;
           clk60Hz : out  STD_LOGIC);
end refreshDisplay;

architecture Behavioral of refreshDisplay is

signal counter: integer range 0 to 8_333_350;

begin

process(clk50Mhz)
begin
	if rising_edge(clk50Mhz)then
		counter <= counter + 1;
		if (counter < 4_166_674)then
			clk60Hz <= '1';
		else
			clk60Hz <= '0';
		end if;
		if (counter > 8_333_349)then
			counter <= 0;
		end if;
	end if;
	
end process;

end Behavioral;
