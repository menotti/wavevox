
--------------------------------------------------------------------------------
-- Company: UTFPR
-- Engineer: Prof. Ricardo Menotti
--
-- Create Date:   21:12:23 05/07/2008
-- Design Name:   tff
-- Module Name:   C:/menotti/ensino/utfpr/Tecnologia/LogicaDigital/ise/contador/t_tff.vhd
-- Project Name:  contador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tff
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY t_tff IS
END t_tff;

ARCHITECTURE behavior OF t_tff IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT tff
	PORT(
	   Clear : in STD_LOGIC;
		T : IN std_logic;
		Clock : IN std_logic;          
		Q : BUFFER std_logic;
		notQ : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL Clear : STD_LOGIC := '0';
	SIGNAL T :  std_logic := '0';
	SIGNAL Clock :  std_logic := '0';

	--Outputs
	SIGNAL Q :  std_logic;
	SIGNAL notQ :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: tff PORT MAP(
	   Clear => Clear,
		T => T,
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
		wait for 100 ns;
		Clear <= '1';
		wait for 100 ns;
		Clear <= '0';
		wait for 400 ns;
		T <= '1';
		wait for 400 ns;
		wait; -- will wait forever
	END PROCESS;

END;
