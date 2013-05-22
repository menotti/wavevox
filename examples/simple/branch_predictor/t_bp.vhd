LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY t_bp IS
END t_bp;

ARCHITECTURE behavior OF t_bp IS 

	COMPONENT bp
	PORT(
		X : IN std_logic;
		Clock : IN std_logic;          
		Z : OUT std_logic
		);
	END COMPONENT;

	SIGNAL X :  std_logic := '0';
	SIGNAL Clock :  std_logic := '0';
	SIGNAL Z:  std_logic;

BEGIN

	uut: bp PORT MAP(
		X => X,
		Clock => Clock,
		Z => Z
	);

	clock_gen : PROCESS
	BEGIN
	  Clock <= '1' after 100 ns, '0' after 200 ns;
		wait for 200 ns;
	END PROCESS;

	tb : PROCESS
	BEGIN
		wait for 500 ns;
		X <= '1';
		wait for 500 ns;
		X <= '0';
		wait for 500 ns;
		X <= '1';
		wait for 200 ns;
		X <= '0';
		wait for 200 ns;
		wait; -- will wait forever
	END PROCESS;

END;
