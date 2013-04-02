library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity t_mealy_machine is

end t_mealy_machine;

architecture behavioral of t_mealy_machine is

	component mealy_machine 
		port (
			clock: in std_logic;
			instruction: in std_logic_vector (31 downto 0);
			enable_program_counter, enable_instruction_register, enable_alu_input_registers,
				enable_alu_output_register, enable_data_memory_register: out std_logic;
			destination_register, register1, register2: out std_logic_vector (4 downto 0);
			write_register, source_memory: out std_logic;
			source_alu: out std_logic;
			alu_operation: out std_logic_vector (2 downto 0);
			read_memory, write_memory: out std_logic;
			offset: out std_logic_vector (31 downto 0));
	end component;

	constant period: time := 10 ns;
	signal clock: std_logic := '0';
	signal instruction: std_logic_vector (31 downto 0);
	signal state_elements: std_logic_vector (4 downto 0);
	signal destination_register, register1, register2: std_logic_vector (4 downto 0);
	signal write_register, source_memory, source_alu, read_memory, write_memory: std_logic;
	signal alu_operation: std_logic_vector (2 downto 0);
	signal offset: std_logic_vector (31 downto 0);

	function to_string (signal sl_vector: std_logic_vector) return string is
	use std.textio.all; 
	variable b_vector: bit_vector (sl_vector'range) := to_bitvector(sl_vector);
	variable ln: line;
	begin
		write(ln, b_vector);
		return ln.all;
	end;

	procedure assert_that_correct_state_element_is_enabled(index: integer) is
	begin
		for i in 0 to 4 loop
			if i = index then
				assert state_elements(i) = '1';
			else
				assert state_elements(i) /= '1';
			end if;
		end loop;
	end procedure;

begin

	machine: mealy_machine port map (clock, instruction, state_elements(0), state_elements(1), 		state_elements(2), state_elements(3), state_elements(4), destination_register, 		register1, register2, write_register, source_memory, source_alu, alu_operation, read_memory, write_memory, 		offset);  

		clock_process: process
		begin
			clock <= not clock;
			wait for period / 2;
		end process;

		stimulus: process
		begin
			report "Starting test bench";

			report "Verifing a load memory instruction";

			wait for period;
			-- state 0
			assert_that_correct_state_element_is_enabled(1);
			instruction <= "10001100011000010000000000000011";
			wait for period;
			-- state 1 
			assert_that_correct_state_element_is_enabled(2);
			assert register2 = "00001";

			wait for period;
			-- state 2
			assert_that_correct_state_element_is_enabled(3);
			assert offset = "00000000000000000000000000000011";
			assert alu_operation = "010";

			wait for period;
			-- state 3
			assert_that_correct_state_element_is_enabled(4);
			assert read_memory = '1';

			wait for period;
			-- state 4
			assert_that_correct_state_element_is_enabled(0);
			assert write_register = '1';
			assert source_memory = '1';
			assert destination_register = "00011";

			report "Verifing an aritmetic and logic operation";

			wait for period;
			-- state 0
			assert_that_correct_state_element_is_enabled(1);
			instruction <= "00000000010101010000100000000001";
			wait for period;
			-- state 1 
			assert_that_correct_state_element_is_enabled(2);
			assert register1 = "010101";
			assert register2 = "00001";

			wait for period;
			-- state 2 
			assert_that_correct_state_element_is_enabled(3);
			assert alu_operation = "001";
			assert source_alu = '1';

			wait for period;
			-- state 3 
			assert_that_correct_state_element_is_enabled(0);
			assert write_register = '1';
			assert source_memory = '0';
			assert destination_register = "00010";

			report "Verifing a store memory operation";

			wait for period;
			-- state 0
			assert_that_correct_state_element_is_enabled(1);
			instruction <= "10101100011000010000000000000001";

			wait for period;
			-- state 1 
			assert_that_correct_state_element_is_enabled(2);
			assert register1 = "00011";
			assert register2 = "00001";

			wait for period;
			-- state 2 
			assert_that_correct_state_element_is_enabled(3);
			assert offset = "00000000000000000000000000000001";
			assert alu_operation = "010";

			wait for period;
			-- state 3
			assert_that_correct_state_element_is_enabled(0);
			assert write_memory = '1';

			report "Verifing a load memory instruction";

			wait for period;
			-- state 0
			assert_that_correct_state_element_is_enabled(1);
			instruction <= "10001100011000010000000000000011";
			wait for period;
			-- state 1 
			assert_that_correct_state_element_is_enabled(2);
			assert register2 = "00001";

			wait for period;
			-- state 2
			assert_that_correct_state_element_is_enabled(3);
			assert offset = "00000000000000000000000000000011";
			assert alu_operation = "010";

			wait for period;
			-- state 3
			assert_that_correct_state_element_is_enabled(4);
			assert read_memory = '1';

			wait for period;
			-- state 4
			assert_that_correct_state_element_is_enabled(0);
			assert write_register = '1';
			assert source_memory = '1';
			assert destination_register = "00011";

			wait;
		end process;

end behavioral;
