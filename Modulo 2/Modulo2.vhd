library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Modulo2 is
    Port ( Clock : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Indicador : out  STD_LOGIC_VECTOR (3 downto 0);
           NumCodificado : out  STD_LOGIC_VECTOR (7 downto 0));
end Modulo2;

architecture Behavioral of Modulo2 is

	COMPONENT Selector
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		C : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		Señal : IN std_logic_vector(3 downto 0);          
		Salida : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Habilitador
	PORT(
		Clock : IN std_logic;          
		Salida : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Decodificador
	PORT(
		Entrada : IN std_logic_vector(3 downto 0);          
		Salida : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

signal sñl : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal numBin : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
	
	Habilitador1: Habilitador PORT MAP(
		Clock => Clock,
		Salida => sñl
	);

	Selector1: Selector PORT MAP(
		A => A,
		B => B,
		C => C,
		D => D,
		Señal => sñl,
		Salida => numBin
	);
	
	Decodificador1: Decodificador PORT MAP(
		Entrada => numBin,
		Salida => NumCodificado
	);
	
	Indicador <= sñl;

end Behavioral;

