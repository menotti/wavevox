library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.ufscar_memory_helpers.all;

entity memory_block is
	generic (
		address_width: integer := 32;
		predefined_data_set: memory_data_set := (others => (others => '0')));

	port (
		address_to_read, address_to_write: in std_logic_vector (address_width - 1 downto 0);
		data_to_write: in std_logic_vector (data_width - 1 downto 0);
		read, write: in std_logic;
		data_out: out std_logic_vector (data_width - 1 downto 0));
end memory_block;

architecture behavioral of memory_block is

	signal data_set: memory_data_set := predefined_data_set;

begin

	read_data: process (read, address_to_read)
		variable index: integer;
	begin
		if read = '1' then
			index := to_integer(unsigned(address_to_read));
			data_out <= data_set(index);
		end if;
	end process;

	write_data: process (write, address_to_write, data_to_write)
		variable index: integer;
	begin
		if write = '1' then
			index := to_integer(unsigned(address_to_write));
			data_set(index) <= data_to_write;
		end if;
	end process;	

end behavioral;

