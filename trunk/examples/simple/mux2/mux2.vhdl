library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux2 is
	port (x0, x1: in std_logic;
		sel: in std_logic;
		output: out std_logic);
end mux2;

architecture structural of mux2 is

begin

	output <= x0 when sel = '0' else x1;

end structural;

