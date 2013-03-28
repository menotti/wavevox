library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_machine is
	port (
		clock: in std_logic;
		-- instruction fetch
		state1: out std_logic := '0';
		-- registers bank reading 
		state2: out std_logic := '0';
		-- aritmetic instruction, memory address computation or branch 
		state3: out std_logic := '0';
		-- memory access or aritmetic instruction conclusion  
		state4: out std_logic := '0';
		-- write back 
		state5: out std_logic := '0');
end state_machine;

architecture behavioral of state_machine is

	type state is (s1, s2, s3, s4, s5, unknown);
	signal current_state: state := unknown;

begin

	process (clock)
	begin
		if rising_edge(clock) then

			case current_state is

				when unknown => 
				current_state <= s1;
				state1 <= '1';

				when s1 => 
				current_state <= s2;
				state2 <= '1';
				state1 <= '0';

				when s2 => 
				current_state <= s3;
				state3 <= '1';
				state2 <= '0';

				when s3 => 
				current_state <= s4;
				state4 <= '1';
				state3 <= '0';

				when s4 => 
				current_state <= s5;
				state5 <= '1';
				state4 <= '0';

				when s5 => 
				current_state <= s1;
				state1 <= '1';
				state5 <= '0';

			end case;

		end if;
	end process;

end behavioral;
