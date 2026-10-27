library IEEE;
use IEEE.std_logic_1164 .all;

entity mainCrossbar is
    generic (
        N : positive := 4
    );
    port(
        x1, x2 : in  std_logic_vector(N-1 downto 0);
        s      : in  std_logic;
        y1, y2 : out std_logic_vector(N-1 downto 0)
    );

end entity;

architecture com_generate of mainCrossbar is
    signal fio1_x1, fio1_x2 : std_logic_vector(N-1 downto 0);
    signal fio2_x1, fio2_x2 : std_logic_vector(N-1 downto 0);
    signal fio3_x1, fio3_x2 : std_logic_vector(N-1 downto 0);
    signal fio4_x1, fio4_x2 : std_logic_vector(N-1 downto 0);
    signal fio5_x1, fio5_x2 : std_logic_vector(N-1 downto 0);
    signal fio6_x1, fio6_x2 : std_logic_vector(N-1 downto 0);
    signal fio7_x1, fio7_x2 : std_logic_vector(N-1 downto 0);
begin
    estagio1 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => x1,
            x2 => x2,
            s  => s,
            y1 => fio1_x1,
            y2 => fio1_x2
        );
    estagio2 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio1_x1,
            x2 => fio1_x2,
            s  => s,
            y1 => fio2_x1,
            y2 => fio2_x2
        );
    estagio3 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio2_x1,
            x2 => fio2_x2,
            s  => s,
            y1 => fio3_x1,
            y2 => fio3_x2
        );
    estagio4 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio3_x1,
            x2 => fio3_x2,
            s  => s,
            y1 => fio4_x1,
            y2 => fio4_x2
        );
    estagio5 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio4_x1,
            x2 => fio4_x2,
            s  => s,
            y1 => fio5_x1,
            y2 => fio5_x2
        );
    estagio6 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio5_x1,
            x2 => fio5_x2,
            s  => s,
            y1 => fio6_x1,
            y2 => fio6_x2
        );

    estagio7 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio6_x1,
            x2 => fio6_x2,
            s  => s,
            y1 => fio7_x1,
            y2 => fio7_x2
        );
    estagio8 : entity work.crossbar(com_generate)
        generic map (
            N => N
        )
        port map (
            x1 => fio7_x1,
            x2 => fio7_x2,
            s  => s,
            y1 => y1,
            y2 => y2
        );
end architecture com_generate;