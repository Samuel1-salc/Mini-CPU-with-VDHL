library IEEE;
use IEEE.std_logic_1164 .all;

  entity crossbar is
    generic (
        N : positive := 4
    );
    port(
        x1, x2 : in  std_logic_vector(N-1 downto 0);
        s      : in  std_logic;
        y1, y2 : out std_logic_vector(N-1 downto 0)
    );

  end entity;

architecture com_generate of crossbar is
begin
    gera_bits : for i in 0 to N-1 generate
    begin
        selecao : process (x1, x2, s)
        begin
            case s is
                when '0' =>
                    y1(i) <= x1(i);
                    y2(i) <= x2(i);

                when '1' =>
                    y1(i) <= x2(i);
                    y2(i) <= x1(i);

                when others =>
                    y1(i) <= 'X';
                    y2(i) <= 'X';
            end case;
        end process selecao;
    end generate gera_bits;
end architecture com_generate;



architecture com_with of crossbar is
begin
    with S select
        y1 <= x1  when '0',
              x2  when '1',
              'X' when others;

    with S select
        y2 <= x2  when '0',
              x1  when '1',
              'X' when others;
end architecture com_with;

architecture com_when of crossbar is
begin
    y1 <= x1 when S = '0' else
          x2 when S = '1' else
          'X';

    y2 <= x2 when S = '0' else
          x1 when S = '1' else
          'X';
end architecture com_when;

architecture com_process of crossbar is
begin
    selecao : process (x1, x2, s)
    begin
        case s is
            when '0' =>
                y1 <= x1;
                y2 <= x2;

            when '1' =>
                y1 <= x2;
                y2 <= x1;

            when others =>
                y1 <= 'X';
                y2 <= 'X';
        end case;
    end process selecao;
end architecture com_process;
