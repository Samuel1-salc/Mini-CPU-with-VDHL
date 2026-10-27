library IEEE;
use IEEE.std_logic_1164 .all;

entity HALF_ADDER is
port(A, B : in std_logic;
     S : out std_logic;
     Cout : out std_logic);
end entity;

architecture RTL of HALF_ADDER is
begin
  process(A,B)
  begin
    S <= A xor B;
    Cout <= A and B;
  end process;
end RTL;