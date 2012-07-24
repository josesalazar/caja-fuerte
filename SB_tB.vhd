--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:23:27 02/24/2012
-- Design Name:   
-- Module Name:   C:/Users/ACAJ/Desktop/vhdl/safeBox/safeBox/SB_tB.vhd
-- Project Name:  safeBox
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SafeBox
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SB_tB IS
END SB_tB;
 
ARCHITECTURE behavior OF SB_tB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SafeBox
    PORT(
         Btn0 : IN  std_logic;
         Btn1 : IN  std_logic;
         Btn2 : IN  std_logic;
         Btn3 : IN  std_logic;
         Sw : IN  std_logic;
         CLK : IN  std_logic;
         AN : OUT  std_logic_vector(3 downto 0);
         num_display : OUT  std_logic_vector(6 downto 0);
         Leds : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Btn0 : std_logic := '0';
   signal Btn1 : std_logic := '0';
   signal Btn2 : std_logic := '0';
   signal Btn3 : std_logic := '0';
   signal Sw : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal AN : std_logic_vector(3 downto 0);
   signal num_display : std_logic_vector(6 downto 0);
   signal Leds : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SafeBox PORT MAP (
          Btn0 => Btn0,
          Btn1 => Btn1,
          Btn2 => Btn2,
          Btn3 => Btn3,
          Sw => Sw,
          CLK => CLK,
          AN => AN,
          num_display => num_display,
          Leds => Leds
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   
	   wait for 20 ns;
      Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '1';
      
		wait for 100 ns;
		Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '1';
		 
		wait for 100 ns;
      Btn2 <= '1';
		Btn0 <= '0';
 		Btn1 <= '0';
      
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '1';
 		Btn1 <= '0';
	   
		wait for 100 ns;
      Btn2 <= '1';
		Btn0 <= '0';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '1';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '1';
		
		wait for 100 ns;
      Btn2 <= '1';
		Btn0 <= '0';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '1';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '1';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '1';
		Btn0 <= '0';
 		Btn1 <= '0';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '1';
		
		wait for 100 ns;
      Btn2 <= '0';
		Btn0 <= '0';
 		Btn1 <= '0';





		
      
--		Sw <= '0';
--		Btn3 <= '0'; 


      -- insert stimulus here 

      wait;
   end process;

END;
