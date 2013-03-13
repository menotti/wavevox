library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity subtractor is
    port(a, b, cin:in std_logic; subtraction, cout:out std_logic);
end subtractor;

architecture structural of subtractor is

component adder
port (a, b, cin: in std_logic; sum, cout: out std_logic);
end of component;

signal notb: std_logic;
notb <= not b;

begin
add: adder port map (a, not b, cin, subtraction, cout);
end structural;


