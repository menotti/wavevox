library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.ufscar_memory_helpers.all;

entity instructions_segment is
	generic (
		address_width: integer := 32;
		instructions: memory_data_set);
	
	port (
		address_to_read: in std_logic_vector (address_width - 1 downto 0);
		instruction_out: out std_logic_vector (data_width - 1 downto 0));
end instructions_segment;

architecture behavioral of instructions_segment is

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

	signal x0: std_logic_vector (address_width - 1 downto 0);
signal x1: std_logic_vector (data_width - 1 downto 0);
		signal read, x2: std_logic;

begin

	memory: memory_block generic map (address_width, instructions)
		port map (address_to_read, x0, x1, read, x2, instruction_out); 

	process(address_to_read)
	begin
		read <= '1';
	end process;

end behavioral;
