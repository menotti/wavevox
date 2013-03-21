library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package ufscar_memory_helpers is

	constant memory_length: integer := 256;
	constant data_width: integer := 32;

	type memory_data_set is array (0 to memory_length - 1) of 
		std_logic_vector (data_width - 1 downto 0);  

end package ufscar_memory_helpers;

