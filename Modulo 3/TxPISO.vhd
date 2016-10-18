library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TxPISO is
    Port ( Mensaje : in  STD_LOGIC_VECTOR (7 downto 0);
           Campana : in  STD_LOGIC;
           DivFrec : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Tx : out  STD_LOGIC);
end TxPISO;

architecture Behavioral of TxPISO is

signal idle : STD_LOGIC := '1';
signal inicio : STD_LOGIC := '0';
signal sac : STD_LOGIC := '0';
signal paridad : STD_LOGIC := '0';
signal parada : STD_LOGIC := '0';

signal in_aux : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal cont : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal cont_unos : STD_LOGIC := '0';

begin
process(CLK, DivFrec, idle, Campana, inicio, sac, cont, in_aux, paridad, parada)
begin
	if (rising_edge(CLK) and DivFrec = '1') then
		if (idle = '1') then
			if (Campana = '1') then
				in_aux <= Mensaje;
				idle <= '0';
				inicio <= '1';
			end if;
			Tx <= '1';
		elsif (inicio = '1') then
			Tx <= '0';
			inicio <= '0';
			sac <= '1';
		elsif (sac = '1') then
			if (in_aux(0) = '1') then
				cont_unos <= not(cont_unos);
			end if;
			Tx <= in_aux(0);
			in_aux <= '1'&in_aux(7 downto 1);
			cont <= cont + 1;
			if (cont = "0111") then
				sac <= '0';
				paridad <= '1';
				cont <= "0000";
			end if;
		elsif (paridad = '1') then
			Tx <= cont_unos;
			paridad <= '0';
			parada <= '1';
			cont_unos <= '0';
		elsif (parada = '1') then
			Tx <= '1';
			parada <= '0';
			idle <= '1';
		end if;
	end if;
end process;
end Behavioral;

