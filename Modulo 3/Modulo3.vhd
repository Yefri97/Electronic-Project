library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Modulo3 is
    Port ( Rx : in  STD_LOGIC;
           MensajeIn : in  STD_LOGIC_VECTOR (7 downto 0);
           CampanaIn : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           MensajeOut : out  STD_LOGIC_VECTOR (7 downto 0);
           CampanaOut : out  STD_LOGIC;
           Tx : out  STD_LOGIC);
end Modulo3;

architecture Behavioral of Modulo3 is

COMPONENT RxSIPO
	PORT(
		Rx : IN std_logic;
		DivFrec : IN std_logic;
		CLK : IN std_logic;          
		Mensaje : OUT std_logic_vector(7 downto 0);
		Campana : OUT std_logic
		);
END COMPONENT;

COMPONENT TxPISO
	PORT(
		Mensaje : IN std_logic_vector(7 downto 0);
		Campana : IN std_logic;
		DivFrec : IN std_logic;
		CLK : IN std_logic;          
		Tx : OUT std_logic
		);
END COMPONENT;

COMPONENT DivisorFrecuencia
	PORT(
		CLK : IN std_logic;          
		SALIDA : OUT std_logic
		);
END COMPONENT;	

signal df : STD_LOGIC := '0';

begin

Inst_DivisorFrecuencia: DivisorFrecuencia PORT MAP(
	CLK => CLK,
	SALIDA => df
);

Inst_RxSIPO: RxSIPO PORT MAP(
	Rx => Rx,
	DivFrec => df,
	CLK => CLK,
	Mensaje => MensajeOut,
	Campana => CampanaOut
);

Inst_TxPISO: TxPISO PORT MAP(
	Mensaje => MensajeIn,
	Campana => CampanaIn,
	DivFrec => df,
	CLK => CLK,
	Tx => Tx
);

end Behavioral;

