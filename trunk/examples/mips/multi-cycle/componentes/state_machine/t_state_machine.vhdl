library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity t_state_machine is

end t_state_machine;

architecture behavioral of t_state_machine is

	component state_machine 
		port (
			clock:in std_logic;
			state1: out std_logic := '0'; 
			state2: out std_logic := '0'; 
			state3: out std_logic := '0'; 
			state4: out std_logic := '0'; 
			state5: out std_logic := '0');
	end component;

	signal clock: std_logic := '0';
	signal states: std_logic_vector (0 to 4);
	constant enabled: std_logic := '1';
	constant disabled: std_logic := '0'; 
	constant period: time := 10 ns;

	procedure assert_that_correct_state_is_enabled(current_state: integer) is
	begin
		for i in 0 to 4 loop
			if i = current_state then
				assert states(i) = '1';
			else
				assert states(i) = '0';
			end if;
		end loop;
	end procedure;

begin

		machine: state_machine port map (clock, states(0), states(1), states(2), states(3), 			states(4));

		clock_process: process
		begin
			wait for period / 2;
			clock <= not clock;
		end process;

		stimulus: process
		begin
			report "Starting test bench";

			for i in 0 to 4 loop
				wait for period;
				report "Verifing states in cycle " & integer'image(i + 1);
				assert_that_correct_state_is_enabled(i);
			end loop;

			wait for period;
			report "Enssuring that after the state 5 the state 1 is enabled again";
			assert_that_correct_state_is_enabled(0);

			wait;
		end process;

end behavioral;
