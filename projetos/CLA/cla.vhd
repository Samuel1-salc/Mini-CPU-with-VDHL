library IEEE;

  use     IEEE.std_logic_1164 .all;

  entity CARRYLOOK is

    port(A, B : in std_logic_vector (3 downto 0);
          Cin : in std_logic;
          Cout: out std_logic;
            S : out std_logic_vector (3 downto 0));

  end entity;

 architecture RTL of CARRYLOOK is

 signal sig_P : std_logic_vector (3 downto 0);
 signal sig_G : std_logic_vector (3 downto 0);
 signal sig_S : std_logic_vector (3 downto 0);

 signal C1, C2, C3 : std_logic;

 component HALF_ADDER is

   port(A, B : in std_logic;
           S : out std_logic;
        Cout : out std_logic);
 end component;


 begin



 H0: HALF_ADDER port map (A(0),B(0),sig_P(0),sig_G(0));
 H1: HALF_ADDER port map (A(1),B(1),sig_P(1),sig_G(1));
 H2: HALF_ADDER port map (A(2),B(2),sig_P(2),sig_G(2));
 H3: HALF_ADDER port map (A(3),B(3),sig_P(3),sig_G(3));



 C1   <= sig_G(0) or (sig_P(0) and Cin);

 C2   <= sig_G(1) or (sig_P(1) and sig_G(0)) or
          (sig_P(1) and sig_P(0) and Cin);

 C3   <= sig_G(2) or (sig_P(2) and sig_G(1)) or
     (sig_P(2) and sig_P(1) and sig_G(0)) or
     (sig_P(2) and sig_P(1) and sig_P(0) and Cin);

 Cout <= sig_G(3) or (sig_P(3) and sig_G(2)) or
          (sig_P(3) and sig_P(2) and sig_G(1)) or
          (sig_P(3) and sig_P(2) and sig_P(1) and
           sig_G(0)) or (sig_P(3) and sig_P(2) and
           sig_P(1) and sig_P(0) and Cin);

 S(0) <= sig_P(0) xor Cin;

 S(1) <= sig_P(1) xor C1;

 S(2) <= sig_P(2) xor C2;

 S(3) <= sig_P(3) xor C3;

end RTL;