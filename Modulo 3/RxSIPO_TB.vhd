LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RxSIPO_TB IS
END RxSIPO_TB;
 
ARCHITECTURE behavior OF RxSIPO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RxSIPO
    PORT(
         Rx : IN  std_logic;
         DivFrec : IN  std_logic;
         CLK : IN  std_logic;
         Mensaje : OUT  std_logic_vector(7 downto 0);
         Campana : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rx : std_logic := '0';
   signal DivFrec : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Mensaje : std_logic_vector(7 downto 0);
   signal Campana : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RxSIPO PORT MAP (
          Rx => Rx,
          DivFrec => DivFrec,
          CLK => CLK,
          Mensaje => Mensaje,
          Campana => Campana
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
		wait for 10 ns;
		DivFrec <= '1';
		
      Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;
		
		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '0';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;

		Rx <= '1';
		wait for 20 ns;
      wait;
   end process;

END;
