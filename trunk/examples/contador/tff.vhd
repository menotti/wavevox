library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tff is
	port (
		Clear : in STD_LOGIC;
		T : in  STD_LOGIC;
		Clock : in  STD_LOGIC;
		Q : buffer  STD_LOGIC;
		notQ : out  STD_LOGIC
	);
end tff;

architecture Behavioral of tff is

begin
	eval: process(Clock, Clear)
	begin
		if Clear = '1' then
			Q <= '0';
		elsif Clock'EVENT and Clock = '1' then
			if T = '1' then
				Q <= not Q;
			end if;
		end if;
	end process;
	notQ <= not Q;
end Behavioral;
