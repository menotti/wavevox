library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and4 is
    port(a, b, c:in std_logic; y:out std_logic);
end and4;

architecture logica of and4 is
begin
    y <= a and b and c;
end logica;


