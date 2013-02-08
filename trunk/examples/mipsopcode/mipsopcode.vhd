library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mipsopcode is
    port(Op5, Op4, Op3, Op2, Op1, Op0:in std_logic; RegDst, OrigDado, MempReg, EscrReg, LerMem, EscrMem, Desvio, OpULA1, OpULA0:out std_logic);
end mipsopcode;

architecture logica of mipsopcode is

signal NotOp5, NotOp4, NotOp3, NotOp2, NotOp1, NotOp0: std_logic;
signal FormatoR, LW, SW, BEQ: std_logic;

begin
  NotOp5 <= not Op5;
  NotOp4 <= not Op4;
  NotOp3 <= not Op3;
  NotOp2 <= not Op2;
  NotOp1 <= not Op1;
  NotOp0 <= not Op0;

  FormatoR <= NotOp5 and NotOp4 and NotOp3 and NotOp2 and NotOp1 and NotOp0;
  LW <= Op5 and NotOp4 and NotOp3 and NotOp2 and Op1 and Op0;
  SW <= Op5 and NotOp4 and Op3 and NotOp2 and Op1 and Op0;
  BEQ <= NotOp5 and NotOp4 and NotOp3 and Op2 and NotOp1 and NotOp0;
  
  RegDst <= FormatoR;
  OrigDado <= LW or SW;
  MempReg <= LW;
  EscrReg <= FormatoR or LW;
  LerMem <= LW;
  EscrMem <= SW;
  Desvio <= BEQ;
  OpULA1 <= FormatoR;
  OpULA0 <= BEQ;
end logica;


