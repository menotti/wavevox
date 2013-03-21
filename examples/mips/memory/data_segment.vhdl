library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.ufscar_memory_helpers.all;

entity data_segment is
	generic (address_width: integer := 32);
	
	port (
		address_to_read, address_to_write: in std_logic_vector (address_width - 1 downto 0);
		data_to_write: in std_logic_vector (data_width - 1 downto 0);
		read, write: in std_logic;
		data_out: out std_logic_vector (data_width - 1 downto 0));
end data_segment;

architecture structural of data_segment is

	component memory_block is
		generic (
			address_width: integer := 32;
			predefined_data_set: memory_data_set := (others => (others => '0')));

		port (
			address_to_read, address_to_write: 
			in std_logic_vector (address_width - 1 downto 0);
		data_to_write: in std_logic_vector (data_width - 1 downto 0);
		read, write: in std_logic;
		data_out: out std_logic_vector (data_width - 1 downto 0));
end component;

begin

	memory: memory_block generic map (address_width => address_width)
		port map (address_to_read, address_to_write, data_to_write, read, write, data_out);

end structural;
