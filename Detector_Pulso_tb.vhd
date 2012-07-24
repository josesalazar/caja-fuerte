LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Detector_Pulso_tb IS
END Detector_Pulso_tb;
 
ARCHITECTURE behavior OF Detector_Pulso_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Detector_Pulso
    PORT(
         Clk : IN  std_logic;
         Btn : IN  std_logic;
         Pulso : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Btn : std_logic := '0';

 	--Outputs
   signal Pulso : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Detector_Pulso PORT MAP (
          Clk => Clk,
          Btn => Btn,
          Pulso => Pulso
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	

			Btn <= '1';		
		wait for 100 ns;	
			Btn <= '0';		
		wait for 100 ns;	
			Btn <= '1';	

      -- insert stimulus here 

      wait;
   end process;

END;
