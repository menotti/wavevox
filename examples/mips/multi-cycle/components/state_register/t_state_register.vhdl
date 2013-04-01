library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity t_state_register is
	generic (width: integer := 4);
end t_state_register;

architecture behavioral of t_state_register is

	function to_string (signal sl_vector: std_logic_vector) return string is
	use std.textio.all; 
	variable b_vector: bit_vector (sl_vector'range) := to_bitvector(sl_vector);
	variable ln: line;
	begin
		write(ln, b_vector);
		return ln.all;
	end;

	component state_register 
		generic (width: integer := 32);
		port (
			clock: in std_logic;
			write_enable: in std_logic;
			input: in std_logic_vector (width - 1 downto 0);
			output: out std_logic_vector (width - 1 downto 0));
	end component;

	signal input, output: std_logic_vector (width - 1 downto 0);
	signal write_enable: std_logic;
	signal clock: std_logic := '0';

begin

		register1: state_register generic map (width) port map (clock, write_enable, input, 			output);

		clock_gen: process
		begin
			clock <= not clock;
			wait for 10 ns;
		end process;

		process
		begin
			report "Starting test bench";

			report "Storing 0011 into state register";
			input <= "0011";
			wait for 100 ns;

			write_enable <= '1';
			wait for 100 ns;

			report "Data retrieved from register is " & to_string(output);
			assert output = "0011";
			wait;
		end process;
end behavioral;
