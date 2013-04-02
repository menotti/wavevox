library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or2 is
    port(a,b:in std_logic; y:out std_logic);
end or2;

architecture logica of or2 is
begin
    y <= a or b;
end logica;


