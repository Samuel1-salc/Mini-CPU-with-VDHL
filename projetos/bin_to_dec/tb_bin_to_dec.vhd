library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_bin_to_decimal is
end entity tb_bin_to_decimal;

architecture sim of tb_bin_to_decimal is
    signal bin : std_logic_vector(3 downto 0);
    signal segments : std_logic_vector(6 downto 0);
    begin
    uut: entity work.bin_to_decimal
        port map (
            bin => bin,
            segments => segments
        );

    stim: process
    begin
        bin <= "0010"; wait for 10 ns;
        assert segments = "0100100" report "Erro: bin 0010" severity error;

        bin <= "0011"; wait for 10 ns;
        assert segments = "0110000" report "Erro: bin 0011" severity error;

        bin <= "0100"; wait for 10 ns;
        assert segments = "0011001" report "Erro: bin 0100" severity error;

        bin <= "1010"; wait for 10 ns;
        assert segments = "0000110" report "Erro: bin 1010" severity error;

        wait;

    end process;
end architecture sim;


