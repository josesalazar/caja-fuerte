
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Detector_Pulso is
    Port ( Clk : in  STD_LOGIC;
           Btn : in  STD_LOGIC;
           Pulso : out  STD_LOGIC := '0'
			);
end Detector_Pulso;

architecture Behavioral of Detector_Pulso is

signal auxpulso : std_logic := '0';

begin
process(Clk)
begin
	if rising_edge(Clk) then
		if auxpulso = '0' and Btn = '1' then
			Pulso <= '1';
			auxpulso <= '1';
		elsif auxpulso = '1' and Btn = '1' then
			Pulso <= '0';
			auxpulso <= '1';
		end if;			
	end if;
		
		if Btn = '0' then 
			auxpulso <= '0';
		end if;

end process;
end Behavioral;

