library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_figure15 is
end t_figure15;

architecture logica of t_figure15 is
  component Figure15
    port (a, b, c: in std_logic; y: out std_logic);
  end component;
      signal sa, sb, sc, sy: std_logic;
  begin
    figure15_inst: Figure15 port map (a=>sa, b=>sb, c=>sc, y=>sy);

  estimulo: process
  begin
    sa <= '0';
    sb <= '0';
    sc <= '0';
    wait for 100 ns;
    sa <= '0';
    sb <= '0';
    sc <= '1';
    wait for 100 ns;
    sa <= '0';
    sb <= '1';
    sc <= '0';
    wait for 100 ns;
    sa <= '0';
    sb <= '1';
    sc <= '1';
    wait for 100 ns;
    sa <= '1';
    sb <= '0';
    sc <= '0';
    wait for 100 ns;
    sa <= '1';
    sb <= '0';
    sc <= '1';
    wait for 100 ns;
    sa <= '1';
    sb <= '1';
    sc <= '0';
    wait for 100 ns;
    sa <= '1';
    sb <= '1';
    sc <= '1';
    wait for 100 ns;
    wait; 
  end process;
end logica;

