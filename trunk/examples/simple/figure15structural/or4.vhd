library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or4 is
    port(a, b, c, d:in std_logic; y:out std_logic);
end or4;

architecture logica of or4 is
begin
    y <= a or b or c or d;
end logica;


