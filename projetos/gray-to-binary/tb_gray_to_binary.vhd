library ieee;
use ieee.std_logic_1164.all;

entity tb_gray_to_binary is
end entity tb_gray_to_binary;

architecture sim of tb_gray_to_binary is
    signal gray_in : std_logic_vector(3 downto 0);
    signal bin_out : std_logic_vector(3 downto 0);
    begin
    uut: entity work.gray_to_binary
        port map (
            gray_in => gray_in,
            bin_out => bin_out
        ); 

    stim: process
    begin
        gray_in <= "0000"; wait for 10 ns;
        assert bin_out = "0000" report "Erro: Gray 0000" severity error;

        gray_in <= "0001"; wait for 10 ns;
        assert bin_out = "0001" report "Erro: Gray 0001" severity error;

        gray_in <= "0011"; wait for 10 ns;
        assert bin_out = "0010" report "Erro: Gray 0011" severity error;

        wait;

    end process;
end architecture sim;


