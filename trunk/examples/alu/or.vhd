library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or_gate is
    port(a,b:in std_logic; y:out std_logic);
end or_gate;

architecture logica of or_gate is
begin
    y <= a or b;
end logica;


