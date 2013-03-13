library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xor_gate is
    port(a,b:in std_logic; y:out std_logic);
end xor_gate;

architecture logica of xor_gate is
begin
    y <= a xor b;
end logica;


