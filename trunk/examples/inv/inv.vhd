library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity inv is
    port(a:in std_logic; y:out std_logic);
end inv;

architecture logica of inv is
begin
    y <= not a;
end logica;


