library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DivisorFrecuencia is
    Port ( CLK : in  STD_LOGIC;
           SALIDA : out  STD_LOGIC := '0');
end DivisorFrecuencia;

architecture Behavioral of DivisorFrecuencia is

--101000101100 2604

signal tiempo : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
signal flag : STD_LOGIC := '0';

begin
process (CLK, flag, tiempo)
begin
	if(rising_edge(CLK)) then
		SALIDA <= '0';
		if (flag = '0') then
			SALIDA <= '1';
			flag <= '1';
		end if;
		if (flag = '1') then
			tiempo <= tiempo + 1;
			if (tiempo >= "101000101100") then
				flag <= '0';
				tiempo <= "000000000000";
			end if;
		end if;
	end if;
end process;
end Behavioral;
