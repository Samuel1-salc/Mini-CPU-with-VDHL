library IEEE;
use IEEE.std_logic_1164.all;

entity TB_RCA8 is
end TB_RCA8;

architecture COMPORTAMENTAL of TB_RCA8 is

    signal sig_A    : std_logic_vector(7 downto 0);
    signal sig_B    : std_logic_vector(7 downto 0);
    signal sig_Cin  : std_logic;
    signal sig_Cout : std_logic;
    signal sig_S    : std_logic_vector(7 downto 0);

begin

    UUT: entity work.RCA8
        port map(
            A    => sig_A,
            B    => sig_B,
            Cin  => sig_Cin,
            Cout => sig_Cout,
            S    => sig_S
        );

    process
    begin

        -- 15 + 1 = 16
        sig_A   <= "00001111";
        sig_B   <= "00000001";
        sig_Cin <= '0';

        wait for 10 ns;

        -- 10 + 5 = 15
        sig_A   <= "00001010";
        sig_B   <= "00000101";
        sig_Cin <= '0';

        wait for 10 ns;

        -- 255 + 1 = 256
        sig_A   <= "11111111";
        sig_B   <= "00000001";
        sig_Cin <= '0';

        wait for 10 ns;

        wait;

    end process;

end COMPORTAMENTAL;