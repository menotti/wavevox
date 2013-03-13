library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and_gate is
    port(a,b:in std_logic; y:out std_logic);
end and_gate;

architecture logica of and_gate is
begin
    y <= a and b;
end logica;


