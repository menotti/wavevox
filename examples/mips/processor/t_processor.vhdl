library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity t_processor is
end t_processor;

architecture behavioral of t_processor is

	component processor 
		port (clock, turn_off: in std_logic;
			current_instruction, data_in_destination_register: out std_logic_vector (31 downto 0));
	end component;

	function to_string (signal sl_vector: std_logic_vector) return string is
	use std.textio.all; 
	variable b_vector: bit_vector (sl_vector'range) := to_bitvector(sl_vector);
	variable ln: line;
	begin
		write(ln, b_vector);
		return ln.all;
	end;

	constant period: time := 100 ns;
	constant number_of_instructions: integer := 3;
	signal clock: std_logic := '0';
	signal turn_off: std_logic := '0';
	signal current_instruction: std_logic_vector (31 downto 0);
	signal data_in_destination_register: std_logic_vector (31 downto 0);

begin

		the_processor: processor port map (clock, turn_off, current_instruction, 			data_in_destination_register);

		clock_process: process
		begin
			clock <= '0';
			wait for period /2;
			clock <= '1';
			wait for period / 2;
		end process;

		stimulus: process
		begin
			report "Starting test bench";

			wait for period / 2;

			for i in 1 to number_of_instructions loop
				report "Instruction to be executed = " & to_string(current_instruction);

				if i = number_of_instructions then
					turn_off <= '1';
				end if;

				wait for period;
			end loop;

			report to_string(data_in_destination_register);
			wait;

		end process;

end behavioral;
