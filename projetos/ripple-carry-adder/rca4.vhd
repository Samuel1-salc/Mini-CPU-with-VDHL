library IEEE;
use IEEE.std_logic_1164.all;

entity RCA4 is
    port(
        A    : in std_logic_vector(3 downto 0);
        B    : in std_logic_vector(3 downto 0);
        Cin  : in std_logic;
        S    : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end RCA4;

architecture RTL of RCA4 is

    signal C1, C2, C3 : std_logic;

begin

    FA0: entity work.FULL_ADDER
        port map(
            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            S    => S(0),
            Cout => C1
        );

    FA1: entity work.FULL_ADDER
        port map(
            A    => A(1),
            B    => B(1),
            Cin  => C1,
            S    => S(1),
            Cout => C2
        );

    FA2: entity work.FULL_ADDER
        port map(
            A    => A(2),
            B    => B(2),
            Cin  => C2,
            S    => S(2),
            Cout => C3
        );

    FA3: entity work.FULL_ADDER
        port map(
            A    => A(3),
            B    => B(3),
            Cin  => C3,
            S    => S(3),
            Cout => Cout
        );

end RTL;