library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_circuit is
end t_circuit;

architecture logica of t_circuit is
  component circuit
    port (a, b, c: in std_logic; y: out std_logic);
  end component;
      signal a, b, c, y: std_logic;
  begin
    circ: circuit port map (a, b, c, y);

  estimulo: process
  begin
    a <= '0';
    b <= '0';
    c <= '0';
    wait for 100 ns;
    a <= '0';
    b <= '0';
    c <= '1';
    wait for 100 ns;
    a <= '0';
    b <= '1';
    c <= '0';
    wait for 100 ns;
    a <= '0';
    b <= '1';
    c <= '1';
    wait for 100 ns;
    a <= '1';
    b <= '0';
    c <= '0';
    wait for 100 ns;
    a <= '1';
    b <= '0';
    c <= '1';
    wait for 100 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    wait for 100 ns;
    a <= '1';
    b <= '1';
    c <= '1';
    wait for 100 ns;
    wait; 
  end process;
end logica;

