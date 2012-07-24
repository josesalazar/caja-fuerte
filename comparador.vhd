
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparador is
    Port ( digito1 : in  STD_LOGIC_VECTOR (3 downto 0);
           digito2 : in  STD_LOGIC_VECTOR (3 downto 0);
           digito3 : in  STD_LOGIC_VECTOR (3 downto 0);
           digito4 : in  STD_LOGIC_VECTOR (3 downto 0);
           sw : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           digOut1 : in  STD_LOGIC_VECTOR (3 downto 0);
           digOut2 : in  STD_LOGIC_VECTOR (3 downto 0);
           digOut3 : in  STD_LOGIC_VECTOR (3 downto 0);
           digOut4 : in  STD_LOGIC_VECTOR (3 downto 0);
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end comparador;

architecture Behavioral of comparador is

begin

process (digito1, digito2, digito3, digito4, sw, BTN3, digOut1, digOut2, digOut3, digOut4)

begin

if (sw = '0' and BTN3 = '1')then
 if (digito1 = digOut1 and digito2 = digOut2 and digito3 = digOut3 and digito4 = digOut4)then
 leds <= "11111111";
 else
 leds <= "00000000";
 end if;
end if;

end process;

end Behavioral;

