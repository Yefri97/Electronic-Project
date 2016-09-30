LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DivisorFrecuencia_TB IS
END DivisorFrecuencia_TB;
 
ARCHITECTURE behavior OF DivisorFrecuencia_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DivisorFrecuencia
    PORT(
         CLK : IN  std_logic;
         SALIDA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal SALIDA : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DivisorFrecuencia PORT MAP (
          CLK => CLK,
          SALIDA => SALIDA
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
      wait for 100 ns;	

      wait;
   end process;

END;
