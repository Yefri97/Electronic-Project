library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador is
    Port ( Entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           Salida : out  STD_LOGIC_VECTOR (7 downto 0));
end Decodificador;

architecture Behavioral of Decodificador is

begin

process(Entrada)
begin
	case (Entrada) is
		when "0000" => Salida <= "00000011";
		when "0001" => Salida <= "10011111";
		when "0010" => Salida <= "00100101";
		when "0011" => Salida <= "00001101";
		when "0100" => Salida <= "10011001";
		when "0101" => Salida <= "01001001";
		when "0110" => Salida <= "01000001";
		when "0111" => Salida <= "00011101";
		when "1000" => Salida <= "00000001";
		when "1001" => Salida <= "00001001";
		when others => Salida <= "11111111";
	end case;
end process;
end Behavioral;

