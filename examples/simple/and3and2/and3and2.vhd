library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and3and2 is
    port(a,b,c:in std_logic; y:out std_logic);
end and3and2;

architecture structural of and3and2 is
  component and2
    port (a, b: in std_logic; y: out std_logic);
  end component;
  signal s1: std_logic;
begin
   and2inst1: and2 port map (a=>a, b=>b, y=>s1);
   and2inst2: and2 port map (a=>s1, b=>c, y=>y);
end structural;


