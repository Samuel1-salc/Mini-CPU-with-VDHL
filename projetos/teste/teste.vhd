library ieee;
use ieee.std_logic_1164.all;

entity funcao_5var is
    port (
        A, B, C, D, E : in  std_logic;
        F             : out std_logic
    );
end entity funcao_5var;

architecture estrutural of funcao_5var is
    signal nA, nB, nC, nD, nE : std_logic;
    signal m0, m2, m5, m8, m13, m15, m18, m21, m24, m29, m31 : std_logic;
begin
    
    nA <= not A;
    nB <= not B;
    nC <= not C;
    nD <= not D;
    nE <= not E;

   
    m0  <= nA and nB and nC and nD and nE;
    m2  <= nA and nB and nC and D  and nE;
    m5  <= nA and nB and C  and nD and E;
    m8  <= nA and B  and nC and nD and nE;
    m13 <= nA and B  and C  and nD and E;
    m15 <= nA and B  and C  and D  and E;
    m18 <= A  and nB and nC and D  and nE;
    m21 <= A  and nB and C  and nD and E;
    m24 <= A  and B  and nC and nD and nE;
    m29 <= A  and B  and C  and nD and E;
    m31 <= A  and B  and C  and D  and E;

    
    F <= m0 or m2 or m5 or m8 or m13 or m15 or m18 or m21 or m24 or m29 or m31;
end architecture estrutural;
