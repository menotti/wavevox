library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_register is
	generic (width: integer := 32);
	port (
		input: in std_logic_vector (width - 1 downto 0);
		write_enable: in std_logic;
		output: out std_logic_vector (width - 1 downto 0));
end state_register;

architecture behavioral of state_register is

	signal stored_data: std_logic_vector (width - 1 downto 0);

begin

	read: process (input)
	begin
		stored_data <= input;
	end process;

	write: process (write_enable)
	begin
		if write_enable = '1' then
			output <= stored_data;
		end if;
	end process;

end behavioral;

