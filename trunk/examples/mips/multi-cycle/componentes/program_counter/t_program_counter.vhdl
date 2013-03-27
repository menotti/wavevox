library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity t_program_counter is
	generic (address_width: integer := 4);
end t_program_counter;

architecture behavioral of t_program_counter is

	component program_counter 
		generic (address_width: integer := 32);
		port (
			clock, enable: in std_logic;
			next_address: out std_logic_vector (address_width - 1 downto 0));
	end component;

	function to_string (signal sl_vector: std_logic_vector) return string is
	use std.textio.all; 
	variable b_vector: bit_vector (sl_vector'range) := to_bitvector(sl_vector);
	variable ln: line;
	begin
		write(ln, b_vector);
		return ln.all;
	end;

	signal clock: std_logic := '0';
	signal enable: std_logic := '0';
	signal address: std_logic_vector (address_width - 1 downto 0);
	constant period: time := 10 ns;

begin

		counter: program_counter generic map (address_width)
			port map (clock, enable, address);

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

			enable <= '1';

			for i in 0 to 16 loop
			if i rem 2 = 0 then
					enable <= not enable;
				end if;

				report to_string(address);
				wait for period;
			end loop;

			wait;
		end process;

end behavioral;
