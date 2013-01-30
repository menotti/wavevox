library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_or2 is
end t_or2;

architecture logica of t_or2 is
  component or2
    port (a, b: in std_logic; y: out std_logic);
  end component;
      signal sa, sb, sy: std_logic;
  begin
    or2_inst: or2 port map (a=>sa, b=>sb, y=>sy);

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

