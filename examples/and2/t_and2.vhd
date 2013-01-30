library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_and2 is
end t_and2;

architecture logica of t_and2 is
  component and2
    port (a, b: in std_logic; y: out std_logic);
  end component;
      signal sa, sb, sy: std_logic;
  begin
    and2_inst: and2 port map (a=>sa, b=>sb, y=>sy);

  estimulo: process
  begin
    sa <= '0';
    sb <= '0';
    wait for 100 ns;
    sa <= '0';
    sb <= '1';
    wait for 100 ns;
    sa <= '1';
    sb <= '0';
    wait for 100 ns;
    sa <= '1';
    sb <= '1';
    wait for 100 ns;
    wait; 
  end process;
end logica;

