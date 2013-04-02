library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor is
	port (clock, turn_off: in std_logic;
		current_instruction, data_in_last_modified_register: 
		out std_logic_vector (31 downto 0));
end processor;

architecture behavioral of processor is

	component program_counter 
		generic (address_width: integer := 32);
		port (
			clock, enable: in std_logic;
			next_address: out std_logic_vector (address_width - 1 downto 0));
	end component;

	component state_register 
		generic (width: integer := 32);
		port (
			clock: in std_logic;
			write_enable: in std_logic;
			input: in std_logic_vector (width - 1 downto 0);
			output: out std_logic_vector (width - 1 downto 0));
	end component;

	component instructions_memory 
		generic (
			length: integer := 256;
			address_width: integer := 32;
			data_width: integer := 32);

		port (
			address_to_read: in std_logic_vector (address_width - 1 downto 0);
			instruction_out: out std_logic_vector (data_width - 1 downto 0));
	end component;

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

	component register_bank
		generic (width: integer := 32);

		port (
			register_to_read1, register_to_read2, register_to_write: 
			in std_logic_vector (4 downto 0);
		write: in std_logic;
		data_to_write: in std_logic_vector (width - 1 downto 0);
		data_out1, data_out2: out std_logic_vector (width - 1 downto 0));
	end component;

	component data_memory 
		generic (
			length: integer := 256;
			address_width: integer := 32;
			data_width: integer := 32);

		port (
			address_to_read, address_to_write: 
			in std_logic_vector (address_width - 1 downto 0);
			data_to_write: in std_logic_vector (data_width - 1 downto 0);
			read, write: in std_logic;
			data_out: out std_logic_vector (data_width - 1 downto 0));
	end component;

	component alu_x
		generic (width: integer := 32);

		port (
			a, b: in std_logic_vector (width - 1 downto 0);
		operation: in std_logic_vector (2 downto 0);
		result: out std_logic_vector (width - 1 downto 0));
	end component;

	signal clk: std_logic;

	-- control signals for state elements.
	signal enable_program_counter, enable_instruction_register, enable_alu_input_registers, 		enable_alu_output_register, enable_data_memory_register: std_logic;

	-- Signals related to the instruction fetch state.
	signal address_of_next_instruction, instruction, data_from_instruction_register: 
			std_logic_vector (31 downto 0);

	-- Signals related to the banck of registers.
	signal destination_register, register1, register2: std_logic_vector (4 downto 0);
	signal data_from_register1, data_from_register2, data_to_write_in_register: 
		std_logic_vector (31 downto 0); 
	signal write_register, source_memory: std_logic;

	-- Signals related to the ALU.
	signal alu_operand1, alu_operand2, alu_result, data_from_alu_input_a, 		data_from_alu_output_register: std_logic_vector (31 downto 0);
	signal source_alu: std_logic;
	signal alu_operation: std_logic_vector (2 downto 0); 

	-- Signals related to the memory access.
	signal address_to_read, address_to_write: std_logic_vector (31 downto 0);
	signal data_from_memory, data_from_memory_register, offset: std_logic_vector (31 downto 0);
	signal read_memory, write_memory: std_logic;

begin

		alu_operand1 <= data_from_alu_input_a when source_alu = '1' else offset;
		data_to_write_in_register <= data_from_memory_register when source_memory = '1' else data_from_alu_output_register; 
		address_to_read <= data_from_alu_output_register;
		address_to_write <= data_from_alu_output_register;

		current_instruction <= instruction;
		data_in_last_modified_register <= data_to_write_in_register;

		pc: program_counter port map (clk, enable_program_counter, address_of_next_instruction);

		memory_of_instructions: instructions_memory port map (address_of_next_instruction, 			instruction);

		instruction_register: state_register port map (clk, enable_instruction_register, 			instruction, data_from_instruction_register); 

		state_machine: mealy_machine port map (clk, data_from_instruction_register, 			enable_program_counter, enable_instruction_register, enable_alu_input_registers, 			enable_alu_output_register, enable_data_memory_register, destination_register, 			register1, register2, write_register, source_memory, source_alu, alu_operation, 			read_memory, write_memory, offset); 

		bank_of_registers: register_bank port map (register1, register2, destination_register, 			write_register, data_to_write_in_register, data_from_register1, data_from_register2);  

		alu_input_register_a: state_register port map (clk, enable_alu_input_registers, 			data_from_register1, data_from_alu_input_a);

		alu_input_register_b: state_register port map (clk, enable_alu_input_registers, 			data_from_register2, alu_operand2);

		alu: alu_x port map (alu_operand1, alu_operand2, alu_operation, alu_result);

		alu_output_register: state_register port map (clk, enable_alu_output_register, 			alu_result, data_from_alu_output_register);

		memory_of_data : data_memory port map (address_to_read, address_to_write, 			data_from_alu_input_a, read_memory, write_memory, data_from_memory);     

		data_memory_register: state_register port map (clk, enable_data_memory_register, 			data_from_memory, data_from_memory_register);

		process (clock, turn_off)
		begin
			if turn_off /= '1' then
				clk <= clock;
			end if; 
		end process;
 
end behavioral;

