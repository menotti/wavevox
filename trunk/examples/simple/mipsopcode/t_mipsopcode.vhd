library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity t_mipsopcode is
end t_mipsopcode;

architecture logica of t_mipsopcode is
  component mipsopcode 
    port(Op5, Op4, Op3, Op2, Op1, Op0:in std_logic; RegDst, OrigDado, MempReg, EscrReg, LerMem, EscrMem, Desvio, OpULA1, OpULA0:out std_logic);
  end component;
  signal Op5, Op4, Op3, Op2, Op1, Op0: std_logic;
  signal RegDst, OrigDado, MempReg, EscrReg, LerMem, EscrMem, Desvio, OpULA1, OpULA0: std_logic;
  begin
    decoder: mipsopcode port map (Op5, Op4, Op3, Op2, Op1, Op0, RegDst, OrigDado, MempReg, EscrReg, LerMem, EscrMem, Desvio, OpULA1, OpULA0);

  estimulo: process
  begin
    -- Formato R
    Op5 <= '0';
    Op4 <= '0';
    Op3 <= '0';
    Op2 <= '0';
    Op1 <= '0';
    Op0 <= '0';
    wait for 100 ns;
    -- Load Word
    Op5 <= '1';
    Op4 <= '0';
    Op3 <= '0';
    Op2 <= '0';
    Op1 <= '1';
    Op0 <= '1';
    wait for 100 ns;
    -- Store Word
    Op5 <= '1';
    Op4 <= '0';
    Op3 <= '1';
    Op2 <= '0';
    Op1 <= '1';
    Op0 <= '1';
    wait for 100 ns;
    -- BEQ
    Op5 <= '0';
    Op4 <= '0';
    Op3 <= '0';
    Op2 <= '1';
    Op1 <= '0';
    Op0 <= '0';
    wait for 100 ns;
    wait; 
  end process;
end logica;

