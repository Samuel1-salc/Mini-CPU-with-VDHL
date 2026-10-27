library ieee;
use ieee.std_logic_1164.all;

entity tb_hazard is
end entity tb_hazard;

architecture sim of tb_hazard is
    signal SW0, SW1, SW2 : std_logic;
    signal LEDR0, LEDR1, LEDR2 : std_logic;
begin
    uut: entity work.hazard
        port map (
            SW0   => SW0,
            SW1   => SW1,
            SW2   => SW2,
            LEDR0 => LEDR0,
            LEDR1 => LEDR1,
            LEDR2 => LEDR2
        );

    stim: process
    begin
        -- Caso 1: A=1, C=1, B varia 0 -> 1 -> 0
        SW0 <= '1'; SW2 <= '1';
        SW1 <= '0'; wait for 10 ns;
        SW1 <= '1'; wait for 10 ns;
        SW1 <= '0'; wait for 20 ns;

        -- Caso 2: A=1, C=0, B varia 0 -> 1 -> 0
        SW0 <= '1'; SW2 <= '0';
        SW1 <= '0'; wait for 10 ns;
        SW1 <= '1'; wait for 10 ns;
        SW1 <= '0'; wait for 20 ns;

        -- Caso 3: A=0, C=1, B varia 0 -> 1 -> 0
        SW0 <= '0'; SW2 <= '1';
        SW1 <= '0'; wait for 10 ns;
        SW1 <= '1'; wait for 10 ns;
        SW1 <= '0'; wait for 20 ns;

        wait;
    end process;
end architecture sim;