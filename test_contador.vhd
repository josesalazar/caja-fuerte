LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY test_contador IS
END test_contador;
 
ARCHITECTURE behavior OF test_contador IS 
 
    COMPONENT contador
    PORT(
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         clk : IN  std_logic;
         digito1 : OUT  std_logic_vector(3 downto 0);
         digito2 : OUT  std_logic_vector(3 downto 0);
         digito3 : OUT  std_logic_vector(3 downto 0);
         digito4 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal clk : std_logic := '0';

   signal digito1 : std_logic_vector(3 downto 0);
   signal digito2 : std_logic_vector(3 downto 0);
   signal digito3 : std_logic_vector(3 downto 0);
   signal digito4 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador PORT MAP (
          BTN0 => BTN0,
          BTN1 => BTN1,
          BTN2 => BTN2,
          clk => clk,
          digito1 => digito1,
          digito2 => digito2,
          digito3 => digito3,
          digito4 => digito4
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 1 ns;
		clk <= '1';
		wait for 1 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
			 BTN2 <= '1';	
      wait for 1 ns;
			 BTN2 <= '0';
		    BTN0 <= '1';
          BTN1 <= '0';
      wait for 130 ns;
		BTN2 <= '1';			 
      wait for 2 ns;
			 BTN2 <= '0';
		    BTN0 <= '0';
          BTN1 <= '1';	
      wait for 100 ns;	
		BTN2 <= '1';			 
      wait for 2 ns;
			 BTN2 <= '0';
		    BTN0 <= '1';
          BTN1 <= '0';	
      wait for 100 ns;	
		BTN2 <= '1';			 
      wait for 2 ns;
			 BTN2 <= '0';
		    BTN0 <= '0';
          BTN1 <= '1';	
      wait for 100 ns;	
		BTN2 <= '1';			 
      wait for 1 ns;
			 BTN2 <= '0';
		    BTN0 <= '0';
          BTN1 <= '1';	
      wait for 100 ns;	

      wait;
   end process;

END;
