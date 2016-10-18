LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TxPISO_TB IS
END TxPISO_TB;
 
ARCHITECTURE behavior OF TxPISO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TxPISO
    PORT(
         Mensaje : IN  std_logic_vector(7 downto 0);
         Campana : IN  std_logic;
         DivFrec : IN  std_logic;
         CLK : IN  std_logic;
         Tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Mensaje : std_logic_vector(7 downto 0) := (others => '0');
   signal Campana : std_logic := '0';
   signal DivFrec : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Tx : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TxPISO PORT MAP (
          Mensaje => Mensaje,
          Campana => Campana,
          DivFrec => DivFrec,
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
		DivFrec <= '1';
		
		Mensaje <= "00010101";
		wait for 100 ns;
		
		Mensaje <= "01000010";
		wait for 100 ns;
		
		Campana <= '1';
		wait for 20 ns;
		Campana <= '0';
      wait for 200 ns;
		
		Mensaje <= "10000101";
		wait for 100 ns;
		
		Campana <= '1';
		wait for 20 ns;
		Campana <= '0';
      wait for 100 ns;
		
		wait;
   end process;

END;
