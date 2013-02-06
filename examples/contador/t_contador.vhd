LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY t_contador IS
END t_contador;

ARCHITECTURE behavior OF t_contador IS 

	COMPONENT contador
	PORT(
		Clock : IN std_logic;
		Clear : IN std_logic;          
		Cont : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL Clock :  std_logic := '0';
	SIGNAL Clear :  std_logic := '0';

	SIGNAL Cont :  std_logic_vector(3 downto 0);

BEGIN

	uut: contador PORT MAP(
		Clock => Clock,
		Clear => Clear,
		Cont => Cont
	);

	clock_gen : PROCESS
	BEGIN
		Clock <= '1' after 100 ns, '0' after 200 ns;
		wait for 200 ns;
	END PROCESS;

	tb : PROCESS
	BEGIN
		wait for 100 ns;
		Clear <= '1';
		wait for 100 ns;
		Clear <= '0';
		wait for 4800 ns;
		wait; -- will wait forever
	END PROCESS;

END;
