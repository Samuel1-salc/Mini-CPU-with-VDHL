library IEEE;
use IEEE.std_logic_1164.all;

entity TB_RCA4 is
end TB_RCA4;

architecture COMPORTAMENTAL of TB_RCA4 is

    signal sig_A    : std_logic_vector(3 downto 0);
    signal sig_B    : std_logic_vector(3 downto 0);
    signal sig_Cin  : std_logic;
    signal sig_Cout : std_logic;
    signal sig_S    : std_logic_vector(3 downto 0);

begin

    UUT: entity work.RCA4
        port map(
            A    => sig_A,
            B    => sig_B,
            Cin  => sig_Cin,
            Cout => sig_Cout,
            S    => sig_S
        );

    process
    begin

        -- 3 + 1 = 4
        sig_A   <= "0011";
        sig_B   <= "0001";
        sig_Cin <= '0';

        wait for 10 ns;

        -- 5 + 2 = 7
        sig_A   <= "0101";
        sig_B   <= "0010";
        sig_Cin <= '0';

        wait for 10 ns;

        -- 15 + 1 = 16
        sig_A   <= "1111";
        sig_B   <= "0001";
        sig_Cin <= '0';

        wait for 10 ns;

        wait;

    end process;

end COMPORTAMENTAL;