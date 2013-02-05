library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity circuit is
    port(a, b, c:in std_logic; y:out std_logic);
end circuit;

architecture structural of circuit is
component and1
port(a, b, c:in std_logic; y:out std_logic);
end component;

component and2
port(a, b, c:in std_logic; y:out std_logic);
end component;

component and3
port(a, b, c:in std_logic; y:out std_logic);
end component;

component and4
port(a, b, c:in std_logic; y:out std_logic);
end component;

component or1
port(a, b, c, d:in std_logic; y:out std_logic);
end component;

signal s1, s2, s3, s4: std_logic;

begin
a1: and1 port map (a, b, c, s1);
a2: and2 port map (a, b, c, s2);
a3: and3 port map (a, b, c, s3);
a4: and4 port map (a, b, c, s4);
o1: or1 port map (s1, s2, s3, s4, y);

end structural;


