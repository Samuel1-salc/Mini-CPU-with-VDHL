library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
    generic (
        four : positive := 4;
        two  : positive := 2
    );
    port (
        s : in  std_logic_vector(two-1 downto 0);
        W : in  std_logic_vector(four-1 downto 0);
        y : out std_logic_vector(four-1 downto 0);
        f : out std_logic
    );
end entity demux;

architecture RTL of demux is
    signal fios : std_logic_vector(four-1 downto 0);
begin
    decoder1 : entity work.decoder(com_with)
        generic map (
            four => four,
            two  => two
        )
        port map (
            s => s,
            y => fios
        );

    mux1 : entity work.mux(com_with)
        generic map (
            four => four,
            two  => two
        )
        port map (
            s => s,
            W => W,
            y => fios,
            f => f
        );

    y <= fios;
end architecture RTL;