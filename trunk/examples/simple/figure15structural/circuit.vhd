library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity circuit is
    port(a, b, c:in std_logic; y:out std_logic);
end circuit;

architecture structural of circuit is

component and3
port(a, b, c:in std_logic; y:out std_logic);
end component;

component or4
port(a, b, c, d:in std_logic; y:out std_logic);
end component;

signal s1, s2, s3, s4: std_logic;
signal nota, notb, notc: std_logic;

begin
a1: and3 port map (nota, notb, c, s1);
a2: and3 port map (nota, b, notc, s2);
a3: and3 port map (a, notb, notc, s3);
a4: and3 port map (a, b, c, s4);
o1: or4 port map (s1, s2, s3, s4, y);

nota <= not a;
notb <= not b;
notc <= not c;

end structural;


