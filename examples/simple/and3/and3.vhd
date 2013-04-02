library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and3 is
    port(a,b,c:in std_logic; y:out std_logic);
end and3;

architecture logica of and3 is
begin
    y <= a and b and c;
end logica;


