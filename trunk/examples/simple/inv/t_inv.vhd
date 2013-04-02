library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_inv is
end t_inv;

architecture logica of t_inv is
  component inv
    port (a: in std_logic; y: out std_logic);
  end component;
      signal sa, sy: std_logic;
  begin
    inv_inst: inv port map (a=>sa, y=>sy);

  estimulo: process
  begin
    sa <= '0';
    wait for 100 ns;
    sa <= '1';
    wait for 100 ns;
    wait; 
  end process;
end logica;

