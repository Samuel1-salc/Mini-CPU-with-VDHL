library ieee;
use ieee.std_logic_1164.all;

entity tb_demux is
end entity tb_demux;

architecture teste of tb_demux is
    signal s : std_logic_vector(1 downto 0) := "00";
    signal W : std_logic_vector(3 downto 0) := "0000";
    signal y : std_logic_vector(3 downto 0);
    signal f : std_logic;
begin
    dut : entity work.demux(RTL)
        generic map (
            four => 4,
            two  => 2
        )
        port map (
            s => s,
            W => W,
            y => y,
            f => f
        );

    estimulos : process
    begin
        W <= "1010";

        s <= "00";
        wait for 10 ns;
        assert y = "0001" and f = '0'
            report "Erro: W=1010, s=00" severity failure;

        s <= "01";
        wait for 10 ns;
        assert y = "0010" and f = '1'
            report "Erro: W=1010, s=01" severity failure;

        s <= "10";
        wait for 10 ns;
        assert y = "0100" and f = '0'
            report "Erro: W=1010, s=10" severity failure;

        s <= "11";
        wait for 10 ns;
        assert y = "1000" and f = '1'
            report "Erro: W=1010, s=11" severity failure;

        W <= "0101";

        s <= "00";
        wait for 10 ns;
        assert y = "0001" and f = '1'
            report "Erro: W=0101, s=00" severity failure;

        s <= "01";
        wait for 10 ns;
        assert y = "0010" and f = '0'
            report "Erro: W=0101, s=01" severity failure;

        s <= "10";
        wait for 10 ns;
        assert y = "0100" and f = '1'
            report "Erro: W=0101, s=10" severity failure;

        s <= "11";
        wait for 10 ns;
        assert y = "1000" and f = '0'
            report "Erro: W=0101, s=11" severity failure;

        report "SUCESSO: os oito testes passaram."
            severity note;
        wait;
    end process estimulos;
end architecture teste;