library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_demo_setup is
end entity tb_demo_setup;

architecture sim of tb_demo_setup is
    signal gray_in : std_logic_vector(3 downto 0);
    signal segments : std_logic_vector(6 downto 0);
begin
    uut: entity work.demo_setup
        port map (
            gray_in => gray_in,
            segments => segments
        );

    stim: process
    begin
        gray_in <= "0011"; wait for 10 ns;
        assert segments = "0100100" report "Erro: Gray 0011" severity error;

        gray_in <= "0110"; wait for 10 ns;
        assert segments = "0011001" report "Erro: Gray 0110" severity error;

        gray_in <= "1010"; wait for 10 ns;
        assert segments = "0000110" report "Erro: Gray 1010" severity error;

        gray_in <= "1111"; wait for 10 ns;
        assert segments = "0000110" report "Erro: Gray 1111" severity error;

        wait;

    end process;
end architecture sim;


