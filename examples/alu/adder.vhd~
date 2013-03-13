library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
    port(a, b, cin:in std_logic; sum, cout:out std_logic);
end adder;

architecture structural of adder is

component and_gate
port(a, b:in std_logic; y:out std_logic);
end component;

component or_gate
port(a, b:in std_logic; y:out std_logic);
end component;

component xor_gate
port(a, b:in std_logic; y:out std_logic);
end component;

signal s1, s2, s3, s4, s5: std_logic;

begin
x1: xor_gate port map (a, b, s1);
x2: xor_gate port map (s1, cin, sum);
a1: and_gate port map (a, b, s2);
a2: and_gate port map (a, cin, s3);
a3: and_gate port map (b, cin, s4);
o1: or_gate port map (s2, s3, s5);
o2: or_gate port map (s4, s5, cout);

end structural;


