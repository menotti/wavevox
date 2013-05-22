library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bp is
    Port ( 
		X : in  STD_LOGIC;
      Clock : in  STD_LOGIC;
      Z : out  STD_LOGIC
		);
end bp;

architecture Structural of bp is

component dff is
    Port ( 
		D : in  STD_LOGIC;
      Clock : in  STD_LOGIC;
      Q : out  STD_LOGIC;
      notQ : out  STD_LOGIC
		);
end component;

signal s1: STD_LOGIC;

begin

	d1: dff port map(D=>X, Clock=>Clock, Q=>s1); 
	d2: dff port map(D=>s1, Clock=>Clock, Q=>Z); 


end Structural;
