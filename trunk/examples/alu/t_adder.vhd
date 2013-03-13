library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_adder is
end t_adder;

architecture logica of t_adder is
  component adder
    port (a, b, cin: in std_logic; sum, cout: out std_logic);
  end component;

      signal a, b, cin, sum, cout: std_logic;

  begin
    add: adder port map (a, b, cin, sum, cout);

  estimulo: process
  begin
    a <= '0';
    b <= '0';
    cin <= '0';
    wait for 100 ns;
    a <= '0';
    b <= '0';
    cin <= '1';
    wait for 100 ns;
    a <= '0';
    b <= '1';
    cin <= '0';
    wait for 100 ns;
    a <= '0';
    b <= '1';
    cin <= '1';
    wait for 100 ns;
    a <= '1';
    b <= '0';
    cin <= '0';
    wait for 100 ns;
    a <= '1';
    b <= '0';
    cin <= '1';
    wait for 100 ns;
    a <= '1';
    b <= '1';
    cin <= '0';
    wait for 100 ns;
    a <= '1';
    b <= '1';
    cin <= '1';
    wait for 100 ns;
    wait; 
  end process;
end logica;

