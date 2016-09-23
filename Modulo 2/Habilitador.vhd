library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Habilitador is
    Port ( Clock : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (3 downto 0));
end Habilitador;

architecture Behavioral of Habilitador is

signal tiempo : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
signal cont : STD_LOGIC_VECTOR (1 downto 0) := "00";

begin

process (Clock, tiempo, cont)
begin
	if(rising_edge(Clock)) then
		if (cont = "00") then
			salida <= "1000";
		end if;
		if (cont = "01") then
			salida <= "0100";
		end if;
		if (cont = "10") then
			salida <= "0010";
		end if;
		if (cont = "11") then
			salida <= "0001";
		end if;
		if (tiempo >= "110000110101000000") then
			if (cont < "11") then
				cont <= cont + 1;
			else
				cont <= "00";
			end if;
			tiempo <= "000000000000000000";
		else
			tiempo <= tiempo + 1;
		end if;
	end if;
end process;
end Behavioral;
