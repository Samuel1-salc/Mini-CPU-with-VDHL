library IEEE;
use IEEE.std_logic_1164.all;

entity TB_CARRYLOOK is
end TB_CARRYLOOK;

architecture COMPORTAMENTAL of TB_CARRYLOOK is

    component CARRYLOOK is
        port(
            A, B : in std_logic_vector(3 downto 0);
            Cin  : in std_logic;
            Cout : out std_logic;
            S    : out std_logic_vector(3 downto 0)
        );
    end component;

    signal sig_A    : std_logic_vector(3 downto 0);
    signal sig_B    : std_logic_vector(3 downto 0);
    signal sig_Cin  : std_logic;
    signal sig_Cout : std_logic;
    signal sig_S    : std_logic_vector(3 downto 0);

begin

    U1: CARRYLOOK
        port map (
            A    => sig_A,
            B    => sig_B,
            Cin  => sig_Cin,
            Cout => sig_Cout,
            S    => sig_S
        );

    process
    begin

        -- Soma 1: 3 + 1 = 4
        sig_A   <= "0011"; -- 3
        sig_B   <= "0001"; -- 1
        sig_Cin <= '0';

        wait for 10 ns;

        -- Soma 2: 5 + 2 = 7
        sig_A   <= "0101"; -- 5
        sig_B   <= "0010"; -- 2
        sig_Cin <= '0';

        wait for 10 ns;

        -- Soma 3: 15 + 1 = 16
        sig_A   <= "1111"; -- 15
        sig_B   <= "0001"; -- 1
        sig_Cin <= '0';

        wait for 10 ns;

        wait;

    end process;

end COMPORTAMENTAL;