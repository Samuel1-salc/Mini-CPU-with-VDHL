library ieee;
use ieee.std_logic_1164.all;

entity mux16 is
    port (
        W : in  std_logic_vector(15 downto 0);
        s : in  std_logic_vector(3 downto 0);
        f : out std_logic
    );
end entity mux16;

-- Multiplexador 16-1 implementado 
architecture fluxo_de_dados of mux16 is
    -- sinal para a saida do decodificador
    signal y : std_logic_vector(15 downto 0);
begin
    with s select
        y <= "0000000000000001" when "0000",
             "0000000000000010" when "0001",
             "0000000000000100" when "0010",
             "0000000000001000" when "0011",
             "0000000000010000" when "0100",
             "0000000000100000" when "0101",
             "0000000001000000" when "0110",
             "0000000010000000" when "0111",
             "0000000100000000" when "1000",
             "0000001000000000" when "1001",
             "0000010000000000" when "1010",
             "0000100000000000" when "1011",
             "0001000000000000" when "1100",
             "0010000000000000" when "1101",
             "0100000000000000" when "1110",
             "1000000000000000" when "1111",
             "XXXXXXXXXXXXXXXX" when others;

    f <= (W(0)  and y(0))  or
         (W(1)  and y(1))  or
         (W(2)  and y(2))  or
         (W(3)  and y(3))  or
         (W(4)  and y(4))  or
         (W(5)  and y(5))  or
         (W(6)  and y(6))  or
         (W(7)  and y(7))  or
         (W(8)  and y(8))  or
         (W(9)  and y(9))  or
         (W(10) and y(10)) or
         (W(11) and y(11)) or
         (W(12) and y(12)) or
         (W(13) and y(13)) or
         (W(14) and y(14)) or
         (W(15) and y(15));
end architecture fluxo_de_dados;