library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is
    generic (
        four : positive := 4;
        two  : positive := 2
    );
    port (
        s : in  std_logic_vector(1 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end entity decoder;

architecture com_with of decoder is
begin
    with s select
        y <= "0001" when "00",
             "0010" when "01",
             "0100" when "10",
             "1000" when "11",
             "XXXX" when others;
end architecture com_with;