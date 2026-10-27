-- filepath: /media/samuel/LinuxData/projetos/VHDL/Quartus-Web-13/projetos/MuxDec_gates/mux4.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
    generic (
        four : positive := 4;
        two  : positive := 2
    );
    port (
        s : in  std_logic_vector(two-1 downto 0);
        W : in  std_logic_vector(four-1 downto 0);
        y : in  std_logic_vector(four-1 downto 0);
        f : out std_logic
    );
end entity mux;

architecture com_with of mux is
    signal fio1, fio2, fio3, fio4 : std_logic;
begin
    gate1 : entity work.and_gate
        port map (
            SW0   => W(0),
            SW1   => y(0),
            LEDR0 => fio1
        );

    gate2 : entity work.and_gate
        port map (
            SW0   => W(1),
            SW1   => y(1),
            LEDR0 => fio2
        );

    gate3 : entity work.and_gate
        port map (
            SW0   => W(2),
            SW1   => y(2),
            LEDR0 => fio3
        );

    gate4 : entity work.and_gate
        port map (
            SW0   => W(3),
            SW1   => y(3),
            LEDR0 => fio4
        );

    f <= fio1 or fio2 or fio3 or fio4;
end architecture com_with;