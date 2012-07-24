  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SafeBox is
    Port ( Btn0 : in  STD_LOGIC;
           Btn1 : in  STD_LOGIC;
           Btn2 : in  STD_LOGIC;
           Btn3 : in  STD_LOGIC;
           Sw : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  AN : out  STD_LOGIC_VECTOR(3 downto 0);
           num_display : out  STD_LOGIC_VECTOR(6 downto 0);
           Leds : out  STD_LOGIC_VECTOR (7 downto 0));
end SafeBox;

architecture Behavioral of SafeBox is

COMPONENT contador
	PORT(
		BTN0 : IN std_logic;
		BTN1 : IN std_logic;
		BTN2 : IN std_logic;
		clk : IN std_logic;          
		digito1 : OUT std_logic_vector(3 downto 0);
		digito2 : OUT std_logic_vector(3 downto 0);
		digito3 : OUT std_logic_vector(3 downto 0);
		digito4 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;



COMPONENT Detector_Pulso
	PORT(
		Clk : IN std_logic;
		Btn : IN std_logic;          
		Pulso : OUT std_logic
		);
	END COMPONENT;



COMPONENT memoria
	PORT(
		BTN3 : IN std_logic;
		sw : IN std_logic;
		digito1 : IN std_logic_vector(3 downto 0);
		digito2 : IN std_logic_vector(3 downto 0);
		digito3 : IN std_logic_vector(3 downto 0);
		digito4 : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		digOut1 : OUT std_logic_vector(3 downto 0);
		digOut2 : OUT std_logic_vector(3 downto 0);
		digOut3 : OUT std_logic_vector(3 downto 0);
		digOut4 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;


	COMPONENT comparador
	PORT(
		digito1 : IN std_logic_vector(3 downto 0);
		digito2 : IN std_logic_vector(3 downto 0);
		digito3 : IN std_logic_vector(3 downto 0);
		digito4 : IN std_logic_vector(3 downto 0);
		sw : IN std_logic;
		BTN3 : IN std_logic;
		digOut1 : IN std_logic_vector(3 downto 0);
		digOut2 : IN std_logic_vector(3 downto 0);
		digOut3 : IN std_logic_vector(3 downto 0);
		digOut4 : IN std_logic_vector(3 downto 0);          
		leds : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;


COMPONENT decodificador
	PORT(
		digito1 : IN std_logic_vector(3 downto 0);
		digito2 : IN std_logic_vector(3 downto 0);
		digito3 : IN std_logic_vector(3 downto 0);
		digito4 : IN std_logic_vector(3 downto 0);          
		Outdigito1 : OUT std_logic_vector(6 downto 0);
		Outdigito2 : OUT std_logic_vector(6 downto 0);
		Outdigito3 : OUT std_logic_vector(6 downto 0);
		Outdigito4 : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;



---COMPONENT refreshDisplay
---	PORT(
---		clk50Mhz : IN std_logic;          
	--	clk60Hz : OUT std_logic
	--	);
--	END COMPONENT;

	
	
COMPONENT multiplexor
	PORT(
		CLK : IN std_logic;
		digito1 : IN std_logic_vector(6 downto 0);
		digito2 : IN std_logic_vector(6 downto 0);
		digito3 : IN std_logic_vector(6 downto 0);
		digito4 : IN std_logic_vector(6 downto 0);          
		AN : OUT std_logic_vector(3 downto 0);
		numdisplay : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;




signal DIGITO_1: std_logic_vector(3 downto 0);
signal DIGITO_2: std_logic_vector(3 downto 0);
signal DIGITO_3: std_logic_vector(3 downto 0);
signal DIGITO_4: std_logic_vector(3 downto 0);
signal PULSO_0: std_logic;
signal PULSO_1: std_logic;
signal PULSO_2: std_logic;
signal PULSO_3: std_logic;
signal DIGMEM1: std_logic_vector(3 downto 0);
signal DIGMEM2: std_logic_vector(3 downto 0);
signal DIGMEM3: std_logic_vector(3 downto 0);
signal DIGMEM4: std_logic_vector(3 downto 0);
signal DISPLAY_1: std_logic_vector(6 downto 0);
signal DISPLAY_2: std_logic_vector(6 downto 0);
signal DISPLAY_3: std_logic_vector(6 downto 0);
signal DISPLAY_4: std_logic_vector(6 downto 0);
signal DIV_FRE: std_logic;

begin


Inst_contador: contador PORT MAP(
		BTN0 => PULSO_0,
		BTN1 => PULSO_1,
		BTN2 => PULSO_2,
		clk => CLK,
		digito1 => DIGITO_1,
		digito2 => DIGITO_2,
		digito3 => DIGITO_3,
		digito4 => DIGITO_4
	);

Inst_Detector_Pulso: Detector_Pulso PORT MAP(
		Clk => CLK,
		Btn => Btn0,
		Pulso => PULSO_0 
	);


Inst_Detector_Pulso1: Detector_Pulso PORT MAP(
		Clk => CLK,
		Btn => Btn1,
		Pulso => PULSO_1
	);
	

Inst_Detector_Pulso2: Detector_Pulso PORT MAP(
		Clk => CLK,
		Btn => Btn2,
		Pulso => PULSO_2
	);	
	

Inst_Detector_Pulso3: Detector_Pulso PORT MAP(
		Clk => CLK,
		Btn => Btn3,
		Pulso => PULSO_3
	);




Inst_memoria: memoria PORT MAP(
		BTN3 => PULSO_3,
		sw => Sw,
		digito1 => DIGITO_1,
		digito2 => DIGITO_2,
		digito3 => DIGITO_3,
		digito4 => DIGITO_4,
		clk => CLK,
		digOut1 => DIGMEM1,
		digOut2 => DIGMEM2,
		digOut3 => DIGMEM3,
		digOut4 => DIGMEM4
	);


Inst_comparador: comparador PORT MAP(
		digito1 => DIGMEM1,
		digito2 => DIGMEM2,
		digito3 => DIGMEM3,
		digito4 => DIGMEM4,
		sw => Sw,
		BTN3 => Btn3,
		digOut1 => DIGITO_1,
		digOut2 => DIGITO_2,
		digOut3 => DIGITO_3,
		digOut4 => DIGITO_4,
		leds => Leds
	);


	Inst_decodificador: decodificador PORT MAP(
		digito1 => DIGITO_1,
		digito2 => DIGITO_2,
		digito3 => DIGITO_3,
		digito4 => DIGITO_4,
		Outdigito1 => DISPLAY_1,
		Outdigito2 => DISPLAY_2,
		Outdigito3 => DISPLAY_3,
		Outdigito4 => DISPLAY_4
	);


---Inst_refreshDisplay: refreshDisplay PORT MAP(
---		clk50Mhz => CLK,
--		clk60Hz => DIV_FRE 
--	);	


	Inst_multiplexor: multiplexor PORT MAP(
		CLK => CLK,
		digito1 => DISPLAY_1,
		digito2 => DISPLAY_2,
		digito3 => DISPLAY_3,
		digito4 => DISPLAY_4,
		AN => AN,
		numdisplay => num_display 
	);




end Behavioral;

