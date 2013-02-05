library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and2 is
    port(a, b, c:in std_logic; y:out std_logic);
end and2;

architecture logica of and2 is
begin
    y <= not a and b and not c;
end logica;


