library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_crossbar is
end entity tb_crossbar;

architecture sim of tb_crossbar is
    signal x1, x2, s : std_logic;
    signal y1, y2 : std_logic;
begin
    uut: entity work.crossbar(com_process)
        port map (
            X1 => x1,
            X2 => x2,
            S => s,
            Y1 => y1,
            Y2 => y2
        );

    stim: process
    begin
        x1 <= '0'; x2 <= '0'; s <= '0'; wait for 10 ns;
        assert y1 = '0' and y2 = '0' report "Erro: Crossbar 000" severity error;

        x1 <= '0'; x2 <= '1'; s <= '0'; wait for 10 ns;
        assert y1 = '0' and y2 = '1' report "Erro: Crossbar 010" severity error;

        x1 <= '1'; x2 <= '0'; s <= '1'; wait for 10 ns;
        assert y1 = '0' and y2 = '1' report "Erro: Crossbar 101" severity error;

        x1 <= '1'; x2 <= '1'; s <= '1'; wait for 10 ns;
        assert y1 = '1' and y2 = '1' report "Erro: Crossbar 111" severity error;

        wait;

    end process;
end architecture sim;


