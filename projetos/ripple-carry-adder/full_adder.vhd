library IEEE;
use IEEE.std_logic_1164.all;

entity crossbar is
    port(
        X1, X2 : in std_logic;
        S : out std_logic;
        Y1, Y2 : out std_logic;
    );
end crossbar;

architecture com_with of crossbar is
begin
    with s select
        y1 <= x1  when '0',
              x2  when '1',
              'X' when others;

    with s select
        y2 <= x2  when '0',
              x1  when '1',
              'X' when others;
end architecture com_with;


architecture com_when of crossbar is
begin
    y1 <= x1 when s = '0' else
          x2 when s = '1' else
          'X';

    y2 <= x2 when s = '0' else
          x1 when s = '1' else
          'X';
end architecture com_when;