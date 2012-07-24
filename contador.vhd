	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador is
    Port ( BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
			  BTN2 : in STD_LOGIC;
           clk : in  STD_LOGIC;
           digito1 : out  STD_LOGIC_VECTOR (3 downto 0);
			  digito2 : out  STD_LOGIC_VECTOR (3 downto 0);
			  digito3 : out  STD_LOGIC_VECTOR (3 downto 0);
			  digito4 : out  STD_LOGIC_VECTOR (3 downto 0));
end contador;

architecture Behavioral of contador is

signal digtemp1: std_logic_vector (3 downto 0):="0000";
signal digtemp2: std_logic_vector (3 downto 0):="0000";
signal digtemp3: std_logic_vector (3 downto 0):="0000";
signal digtemp4: std_logic_vector (3 downto 0):="0000";
signal count: std_logic_vector (1 downto 0):="00";
 
begin

process (clk, BTN0, BTN1, BTN2)

begin

if(rising_edge (clk))then

if(BTN2 = '1')then
count <= count + 1;
end if;
 
    case (count) is 
      when "00" => 
			if(digtemp1 = "1001" and BTN0 = '1')then
				digtemp1 <= "0000";
				elsif(BTN0 = '1')then
					digtemp1 <= digtemp1 + 1;
			end if;
		
			if(digtemp1 = "0000" and BTN1 = '1')then
				digtemp1 <= "1001";
				elsif(BTN1 = '1')then
					digtemp1 <= digtemp1 - 1;
			end if;
	
      when "01" =>
			if(digtemp2 = "1001" and BTN0 = '1')then
				digtemp2 <= "0000";
				elsif(BTN0 = '1')then
					digtemp2 <= digtemp2 + 1;
			end if;
		
			if(digtemp2 = "0000" and BTN1 = '1')then
				digtemp2 <= "1001";
				elsif(BTN1 = '1')then
					digtemp2 <= digtemp2 - 1;
			end if;
	
      when "10" =>
			if(digtemp3 = "1001" and BTN0 = '1')then
				digtemp3 <= "0000";
				elsif(BTN0 = '1')then
					digtemp3 <= digtemp3 + 1;
			end if;
		
			if(digtemp3 = "0000" and BTN1 = '1')then
				digtemp3 <= "1001";
				elsif(BTN1 = '1')then
					digtemp3 <= digtemp3 - 1;
			end if;
	
      when "11" =>
			if(digtemp4 = "1001" and BTN0 = '1')then
				digtemp4 <= "0000";
				elsif(BTN0 = '1')then
					digtemp4 <= digtemp4 + 1;
			end if;
		
		if(digtemp4 = "0000" and BTN1 = '1')then
			digtemp4 <= "1001";
			elsif(BTN1 = '1')then
				digtemp4 <= digtemp4 - 1;
		end if;
	
    when others =>
		digtemp1 <= "0000";
		digtemp2 <= "0000";
		digtemp3 <= "0000";
		digtemp4 <= "0000";
	end case;
	
	
end if;

end process;

digito1 <= digtemp1;
digito2 <= digtemp2;
digito3 <= digtemp3;
digito4 <= digtemp4;

end Behavioral;