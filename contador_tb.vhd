--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:51:34 02/21/2012
-- Design Name:   
-- Module Name:   C:/Users/ACAJ/Desktop/Alvaro J/safeBox/contador_tb.vhd
-- Project Name:  safeBox
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contador
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
 
ENTITY contador_tb IS
END contador_tb;
 
ARCHITECTURE behavior OF contador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contador
    PORT(
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         clk : IN  std_logic;
         digito : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal digito : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador PORT MAP (
          BTN0 => BTN0,
          BTN1 => BTN1,
          clk => clk,
          digito => digito
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		    BTN0 <= '1';
          BTN1 <= '0';		
		wait for 320 ns;
		    BTN0 <= '0';
          BTN1 <= '1';



      -- insert stimulus here 

      wait;
   end process;

END;
