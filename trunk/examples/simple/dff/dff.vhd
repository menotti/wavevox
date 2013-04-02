library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dff is
    Port ( 
		D : in  STD_LOGIC;
      Clock : in  STD_LOGIC;
      Q : out  STD_LOGIC;
      notQ : out  STD_LOGIC
		);
end dff;

architecture Behavioral of dff is

begin

	eval: process(Clock)
	begin
		if Clock'EVENT and Clock='1' then
			Q <= D;
			notQ <= not D;
		end if;
	end process;

end Behavioral;
