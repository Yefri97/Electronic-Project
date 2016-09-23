library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Señal : in  STD_LOGIC_VECTOR (3 downto 0);
           Salida : out  STD_LOGIC_VECTOR (3 downto 0));
end Selector;

architecture Behavioral of Selector is

begin

process (Señal, A, B, C, D)
begin
	case Señal is
		when "1000" => Salida <= A;
		when "0100" => Salida <= B;
		when "0010" => Salida <= C;
		when "0001" => Salida <= D;
		when others => Salida <= "0000";
	end case;
end process;
end Behavioral;

