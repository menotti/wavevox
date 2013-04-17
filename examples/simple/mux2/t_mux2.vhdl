library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_mux2 is
end t_mux2;

architecture logica of t_mux2 is
  component mux2
	port (x0, x1: in std_logic;
		sel: in std_logic;
		output: out std_logic);
  end component;
      signal sx0, sx1, ssel, soutput: std_logic;
  begin
    mux2_inst: mux2 port map (sx0, sx1, ssel, soutput);

  estimulo: process
  begin
    sx0 <= '0';
    sx1 <= '0';
    ssel <= '0';
    wait for 100 ns;
    sx0 <= '0';
    sx1 <= '0';
    ssel <= '1';
    wait for 100 ns;
    sx0 <= '0';
    sx1 <= '1';
    ssel <= '0';
    wait for 100 ns;
    sx0 <= '0';
    sx1 <= '1';
    ssel <= '1';
    wait for 100 ns;
    sx0 <= '1';
    sx1 <= '0';
    ssel <= '0';
    wait for 100 ns;
    sx0 <= '1';
    sx1 <= '0';
    ssel <= '1';
    wait for 100 ns;
    sx0 <= '1';
    sx1 <= '1';
    ssel <= '0';
    wait for 100 ns;
    sx0 <= '1';
    sx1 <= '1';
    ssel <= '1';
    wait for 100 ns;
    wait; 
  end process;
end logica;

