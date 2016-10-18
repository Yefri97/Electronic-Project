library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Eco is
    Port ( Rx : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Tx : out  STD_LOGIC);
end Eco;

architecture Behavioral of Eco is

COMPONENT Modulo3
	PORT(
		Rx : IN std_logic;
		MensajeIn : IN std_logic_vector(7 downto 0);
		CampanaIn : IN std_logic;
		CLK : IN std_logic;          
		MensajeOut : OUT std_logic_vector(7 downto 0);
		CampanaOut : OUT std_logic;
		Tx : OUT std_logic
		);
END COMPONENT;

signal Campana : STD_LOGIC := '0';
signal Mensaje : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin
	
	Inst_Modulo3: Modulo3 PORT MAP(
		Rx => Rx,
		MensajeIn => Mensaje,
		CampanaIn => Campana,
		CLK => CLK,
		MensajeOut => Mensaje,
		CampanaOut => Campana,
		Tx => Tx
	);

end Behavioral;

