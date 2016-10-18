LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Eco_TB IS
END Eco_TB;
 
ARCHITECTURE behavior OF Eco_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Eco
    PORT(
         Rx : IN  std_logic;
         CLK : IN  std_logic;
         Tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rx : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Tx : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Eco PORT MAP (
          Rx => Rx,
          CLK => CLK,
          Tx => Tx
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
      --wait for 2604 ns;
		
      Rx <= '1';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;
		
		Rx <= '1';
		wait for 2604000 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '0';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;

		Rx <= '1';
		wait for 52080 ns;
      wait;
   end process;

END;
