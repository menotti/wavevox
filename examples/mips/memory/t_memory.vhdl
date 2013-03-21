library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.ufscar_memory_helpers.all;

entity t_memory is
	generic (address_width: integer := 4);
end t_memory;

architecture behavioral of t_memory is

component data_segment 
		generic (address_width: integer := 32);
	
		port (
			address_to_read, address_to_write: 
			in std_logic_vector (address_width - 1 downto 0);
			data_to_write: in std_logic_vector (data_width - 1 downto 0);
			read, write: in std_logic;
			data_out: out std_logic_vector (data_width - 1 downto 0));
	end component;

	component instructions_segment 
		generic (
			address_width: integer := 32;
			instructions: memory_data_set);
	
		port (
			address_to_read: in std_logic_vector (address_width - 1 downto 0);
			instruction_out: out std_logic_vector (data_width - 1 downto 0));
	end component;

	function to_string (signal sl_vector: std_logic_vector) return string is
		use std.textio.all; 
		variable b_vector: bit_vector (sl_vector'range) := to_bitvector(sl_vector);
	variable ln: line;
		begin
			write(ln, b_vector);
			return ln.all;
	end;
	
	signal instructions: memory_data_set :=
		(0 => (0 => '1', others => '0'), others => (others => '0')); 
	signal address_to_read, address_to_write: std_logic_vector (address_width - 1 downto 0);
signal readed_instruction, data_to_write, readed_data: 
		std_logic_vector (data_width - 1 downto 0);
	signal i1: std_logic_vector (data_width - 1 downto 0) := (0 => '1', others => '0');
	signal d1: std_logic_vector (data_width - 1 downto 0) :=
		(0 => '1', 1 => '0', 2 => '1', others => '0');
	signal read, write: std_logic;

	begin

		instructions_segment1: instructions_segment generic map (address_width, instructions)
			port map (address_to_read, readed_instruction);
		data_segment1: data_segment generic map (address_width)
			port map (address_to_read, address_to_write, data_to_write, read, write, 				readed_data);

		process
		begin

			report "Starting test bench";

			address_to_read <= "0000";
			wait for 100 ns;

			report "Readed instruction " & to_string(readed_instruction);
			assert readed_instruction = i1;

			address_to_write <= "1111";
			write <= '1';
			data_to_write <= d1;
			wait for 100 ns;

			report "Writing data " & to_string(data_to_write) &
				"into address " & to_string(address_to_write);

			read <= '1';
			address_to_read <= "1111";
			wait for 100 ns;

			report "Readed data from address " & to_string(address_to_read) &
				" = " & to_string(readed_data);
			assert readed_data = d1;

			wait;
		end process;
end behavioral;

