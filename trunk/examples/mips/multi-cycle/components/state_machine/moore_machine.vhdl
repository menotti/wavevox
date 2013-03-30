library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity moore_machine is 
	port (
		clock: in std_logic;
		instruction: in std_logic_vector (31 downto 0);
		enable_program_counter, enable_instruction_register, enable_register_a_and_b,
			enable_alu_register, enable_data_memory_register: out std_logic;
		destination_register, register1, register2: out std_logic_vector (4 downto 0);
		write_register: out std_logic;
		alu_operation: out std_logic_vector (2 downto 0);
		read_memory, write_memory: out std_logic;
		offset: out std_logic_vector (31 downto 0));
end moore_machine;

architecture behavioral of moore_machine is
	-- enumeration type to describe the supported states.
	type state is (s0, s1, s2, s3, s4, s5, s6, s7, uninitialized);
	signal current_state: state := uninitialized;
	-- Bellow the operations supported by the simplified version of the processor.
	constant lw: std_logic_vector (5 downto 0) := "100011";
	constant sw: std_logic_vector (5 downto 0) := "101011";
	constant r: std_logic_vector (5 downto 0) := "000000";
	signal opcode: std_logic_vector (5 downto 0);

	function extend_to_32(input: std_logic_vector (15 downto 0)) return std_logic_vector is 
	variable s: signed (31 downto 0);
	begin
		s := resize(signed(input), s'length);
		return std_logic_vector(s);  
	end;

begin
	-- Extracts the opcode from the instruction.
	opcode <= instruction(31 downto 26);

	next_state: process(clock)
	begin
		if rising_edge(clock) then
			case current_state is

				when uninitialized =>
					current_state <= s0;

				when s0 =>
					current_state <= s1;

				when s1 =>
					if opcode = lw or opcode = sw then
						current_state <= s2;
					elsif opcode = r then
						current_state <= s6;
					end if; 

				when s2 =>
					if opcode = lw then
						current_state <= s3;
					elsif opcode = sw then
						current_state <= s4; 
					end if;

				when s3 =>
					current_state <= s5;

				when s4 => -- store memory conclusion
					current_state <= s0;

				when s5 =>
					current_state <= s0;

				when s6 =>
					current_state <= s7;

				when s7 =>
					current_state <= s0;  
			end case;
		end if;
	end process;

	control_signals: process(current_state)
	begin
		case current_state is
			when uninitialized =>
				-- ignore

			when s0 =>
				-- instruction fetch
				enable_program_counter <= '0';
				enable_instruction_register <= '1';

			when s1 =>
				-- instruction decode and source register fetch
				enable_instruction_register <= '0';
				enable_register_a_and_b <= '1';

				if opcode = lw then
					-- Extracts the base register.
					register1 <= instruction (20 downto 16);
					register2 <= "XXXXX";
				elsif opcode = sw then
					-- Extracts the value of origin register.
					register1 <= instruction(25 downto 21);
					-- Extracts the base register.
					register2 <= instruction(20 downto 16);
				elsif opcode = r then
					-- Extracts the "left hand side" register.
					register1 <= instruction(20 downto 16);
					-- Extracts the "right hand side" register.
					register2 <= instruction(15 downto 11);
				end if;

			when s2 =>
				-- memory address computation
				enable_register_a_and_b <= '0';
				enable_alu_register <= '1';
				-- Extracts the offset.
				offset <= extend_to_32(instruction(15 downto 0));
				alu_operation <= "010";

			when s3 =>
				-- load memory access
				enable_alu_register <= '0';
				offset <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
				alu_operation <= "XXX";
				enable_data_memory_register <= '1';
				read_memory <= '1';

			when s4 =>
				-- store memory access
				enable_alu_register <= '0';
				offset <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
				alu_operation <= "XXX";
				write_memory <= '1';
				enable_program_counter <= '1';

			when s5 =>
				-- load memory conclusion
				enable_data_memory_register <= '0';
				-- Extracts the destination register.
				destination_register <= instruction(25 downto 21);
				write_register <= '1';
				enable_program_counter <= '1';

			when s6 =>
				-- aritmetic and logic operation execution
				enable_register_a_and_b <= '0';
				enable_alu_register <= '1';
				-- Extracts the interesting values from the function field.
				alu_operation <= instruction(2 downto 0);

			when s7 =>
				-- aritmetic and logic operation conclusion
				enable_alu_register <= '0';
				alu_operation <= "XXX";
				-- Extracts the destination register.
				destination_register <= instruction(25 downto 21);
				enable_program_counter <= '1';

		end case;
	end process;

end behavioral;

