library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador is
    Port ( Clock : in  STD_LOGIC;
           Clear : in  STD_LOGIC;
           Cont : out  STD_LOGIC_VECTOR (3 downto 0));
end contador;

architecture Behavioral of contador is

	COMPONENT tff
	PORT(
	   Clear : in STD_LOGIC;
		T : IN std_logic;
		Clock : IN std_logic;          
		Q : BUFFER std_logic;
		notQ : OUT std_logic
		);
	END COMPONENT;

	SIGNAL Q0, Q1, Q2: STD_LOGIC;

begin

	t0: tff PORT MAP(
	   Clear => Clear,
		T => '1',
		Clock => Clock,
		Q => Cont(0),
		notQ => Q0
	);
	t1: tff PORT MAP(
	   Clear => Clear,
		T => '1',
		Clock => Q0,
		Q => Cont(1),
		notQ => Q1
	);
	t2: tff PORT MAP(
	   Clear => Clear,
		T => '1',
		Clock => Q1,
		Q => Cont(2),
		notQ => Q2
	);
	t3: tff PORT MAP(
	   Clear => Clear,
		T => '1',
		Clock => Q2,
		Q => Cont(3)
	);

end Behavioral;

