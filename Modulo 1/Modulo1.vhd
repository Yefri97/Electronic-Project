library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Modulo1 is
    Port ( Clock : in  STD_LOGIC;
           Pulsacion : in  STD_LOGIC;
           Salida : out  STD_LOGIC);
end Modulo1;

architecture Behavioral of Modulo1 is

signal tiempo : STD_LOGIC_VECTOR (23 downto 0) := "000000000000000000000000";
signal flag : STD_LOGIC := '0';

begin
process (Pulsacion, Clock, flag, tiempo)
begin
	if(rising_edge(Clock)) then
		salida <= '0';
		if (Pulsacion = '1' and flag = '0') then
			salida <= '1';
			flag <= '1';
		end if;
		if (flag = '1') then
			tiempo <= tiempo + 1;
			if (tiempo >= "100110001001011010000000") then
				flag <= '0';
				tiempo <= "000000000000000000000000";
			end if;
		end if;
	end if;
end process;
end Behavioral;

