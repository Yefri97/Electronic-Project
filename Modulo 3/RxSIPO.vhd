library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RxSIPO is
    Port ( Rx : in  STD_LOGIC;
           DivFrec : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Mensaje : out  STD_LOGIC_VECTOR (7 downto 0);
           Campana : out  STD_LOGIC);
end RxSIPO;

architecture Behavioral of RxSIPO is

signal idle : STD_LOGIC := '1';
signal rec : STD_LOGIC := '0';
signal paridad : STD_LOGIC := '0';
signal parada : STD_LOGIC := '0';

signal out_aux : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal cont : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal cont_unos : STD_LOGIC := '0';
signal paridad_ok : STD_LOGIC := '1';

begin
process(CLK, DivFrec, idle, Rx, rec, cont, paridad, parada, paridad_ok)
begin
	if(rising_edge(CLK) and DivFrec = '1') then
		Mensaje <= out_aux;
		Campana <= '0';
		if (idle = '1') then
			if (Rx = '0') then
				idle <= '0';
				rec <= '1';
			end if;
		elsif (rec = '1') then
			if (Rx = '1') then
				cont_unos <= not(cont_unos);
			end if;
			out_aux <= Rx&out_aux(7 downto 1);
			cont <= cont + 1;
			if (cont = "0111") then
				paridad <= '1';
				rec <= '0';
				cont <= "0000";
			end if;
		elsif (paridad = '1') then
			if ((cont_unos = '0' and Rx = '0') or (cont_unos = '1' and Rx = '1')) then
				paridad_ok <= '0';  -- Cumplio con condicion bit de paridad
			else
				paridad_ok <= '1';  -- No cumplio condicion bit de paridad
			end if;
			cont_unos <= '0';
			paridad <= '0';
			parada <= '1';
		elsif (parada = '1') then
			if (Rx = '1' and paridad_ok = '0') then
				Campana <= '1';
			end if;
			parada <= '0';
			idle <= '1';
			paridad_ok <= '1';
		end if;
	end if;
end process;
end Behavioral;

