library ieee;
use ieee.std_logic_1164.all;

entity tb_teste is
end entity tb_teste;

architecture sim of tb_teste is
    signal A, B, C, D, E, F : std_logic;
begin
    uut: entity work.funcao_5var
        port map (
            A => A,
            B => B,
            C => C,
            D => D,
            E => E,
            F => F
        );

    stim: process
    begin
        -- 00000
        A <= '0'; B <= '0'; C <= '0'; D <= '0'; E <= '0'; wait for 10 ns;
        -- 00010
        A <= '0'; B <= '0'; C <= '0'; D <= '1'; E <= '0'; wait for 10 ns;
        -- 00101
        A <= '0'; B <= '0'; C <= '1'; D <= '0'; E <= '1'; wait for 10 ns;
        -- 01000
        A <= '0'; B <= '1'; C <= '0'; D <= '0'; E <= '0'; wait for 10 ns;
        -- 01101
        A <= '0'; B <= '1'; C <= '1'; D <= '0'; E <= '1'; wait for 10 ns;
        -- 10010
        A <= '1'; B <= '0'; C <= '0'; D <= '1'; E <= '0'; wait for 10 ns;
        -- 10101
        A <= '1'; B <= '0'; C <= '1'; D <= '0'; E <= '1'; wait for 10 ns;
        -- 11000
        A <= '1'; B <= '1'; C <= '0'; D <= '0'; E <= '0'; wait for 10 ns;
        -- 11101
        A <= '1'; B <= '1'; C <= '1'; D <= '0'; E <= '1'; wait for 10 ns;
        -- 11111
        A <= '1'; B <= '1'; C <= '1'; D <= '1'; E <= '1'; wait for 10 ns;

        wait;
    end process;
end architecture sim;