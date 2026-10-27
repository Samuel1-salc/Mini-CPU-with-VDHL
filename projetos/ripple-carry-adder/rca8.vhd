library IEEE;
use IEEE.std_logic_1164.all;

entity RCA8 is
    port(
        A    : in std_logic_vector(7 downto 0);
        B    : in std_logic_vector(7 downto 0);
        Cin  : in std_logic;
        S    : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end RCA8;

architecture RTL of RCA8 is

    signal C1, C2, C3, C4, C5, C6, C7 : std_logic;

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
            Cout => C4
        );

    FA4: entity work.FULL_ADDER
        port map(
            A    => A(4),
            B    => B(4),
            Cin  => C4,
            S    => S(4),
            Cout => C5
        );

    FA5: entity work.FULL_ADDER
        port map(
            A    => A(5),
            B    => B(5),
            Cin  => C5,
            S    => S(5),
            Cout => C6
        );

    FA6: entity work.FULL_ADDER
        port map(
            A    => A(6),
            B    => B(6),
            Cin  => C6,
            S    => S(6),
            Cout => C7
        );

    FA7: entity work.FULL_ADDER
        port map(
            A    => A(7),
            B    => B(7),
            Cin  => C7,
            S    => S(7),
            Cout => Cout
        );

end RTL;