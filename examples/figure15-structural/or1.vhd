library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or1 is
    port(a, b, c, d:in std_logic; y:out std_logic);
end or1;

architecture logica of or1 is
begin
    y <= a or b or c or d;
end logica;


