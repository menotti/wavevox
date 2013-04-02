library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Figure15 is
    port(a,b,c:in std_logic; y:out std_logic);
end Figure15;

architecture logica of Figure15 is
begin
    y <= (not a and not b and c) or (not a and b and not c) or (a and not b and not c) or (a and b and c);   
end logica;


