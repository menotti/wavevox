library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and1 is
    port(a, b, c:in std_logic; y:out std_logic);
end and1;

architecture logica of and1 is
begin
    y <= not a and not b and c;
end logica;


