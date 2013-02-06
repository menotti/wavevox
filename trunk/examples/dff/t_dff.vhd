LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY t_dff IS
END t_dff;

ARCHITECTURE behavior OF t_dff IS 

	COMPONENT dff
	PORT(
		D : IN std_logic;
		Clock : IN std_logic;          
		Q : OUT std_logic;
		notQ : OUT std_logic
		);
	END COMPONENT;

	SIGNAL D :  std_logic := '0';
	SIGNAL Clock :  std_logic := '0';

	SIGNAL Q :  std_logic;
	SIGNAL notQ :  std_logic;

BEGIN

	uut: dff PORT MAP(
		D => D,
		Clock => Clock,
		Q => Q,
		notQ => notQ
	);

	clock_gen : PROCESS
	BEGIN
	  Clock <= '1' after 100 ns, '0' after 200 ns;
		wait for 200 ns;
	END PROCESS;

	tb : PROCESS
	BEGIN
		wait for 500 ns;
		D <= '1';
		wait for 500 ns;
		wait; -- will wait forever
	END PROCESS;

END;
