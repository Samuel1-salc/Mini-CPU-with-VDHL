library ieee;
use ieee.std_logic_1164.all;

entity hazard is
    port (
        SW0   : in  std_logic;
        SW1   : in  std_logic;
        SW2   : in  std_logic;
        LEDR0 : out std_logic;
        LEDR1 : out std_logic;
        LEDR2 : out std_logic
    );
end entity;

architecture rtl of hazard is
    signal A_buf : std_logic;
    signal s1    : std_logic;
    signal s2    : std_logic;
begin
    A_buf <= transport SW0 after 1 ns;

    s1 <= transport (A_buf and SW1) after 2 ns;
    s2 <= transport (SW1 and SW2) after 2 ns;

    LEDR0 <= s1;
    LEDR1 <= s2;
    LEDR2 <= transport (s1 or s2) after 1 ns;
end architecture rtl;