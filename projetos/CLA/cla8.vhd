library IEEE;
use IEEE.std_logic_1164.all;

entity CLA8 is

    port(
        A, B : in std_logic_vector(7 downto 0);
        Cin  : in std_logic;
        Cout : out std_logic;
        S    : out std_logic_vector(7 downto 0)
    );

end entity;

architecture RTL of CLA8 is

    signal carry_intermediario : std_logic;

begin

    -- CLA dos 4 bits menos significativos
    CLA_LOW: entity work.CARRYLOOK
        port map(
            A    => A(3 downto 0),
            B    => B(3 downto 0),
            Cin  => Cin,
            Cout => carry_intermediario,
            S    => S(3 downto 0)
        );

    -- CLA dos 4 bits mais significativos
    CLA_HIGH: entity work.CARRYLOOK
        port map(
            A    => A(7 downto 4),
            B    => B(7 downto 4),
            Cin  => carry_intermediario,
            Cout => Cout,
            S    => S(7 downto 4)
        );

end RTL;