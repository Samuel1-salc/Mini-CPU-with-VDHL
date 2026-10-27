library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift is
    Port (
        W : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC_VECTOR (1 downto 0);
        y : out STD_LOGIC_VECTOR (3 downto 0)
    );
end entity shift;
 
architecture mux of shift is
begin
    process (W, S)
    begin
        if (S = "00") then
            y(3) <= W(3);
            y(2) <= W(2);
            y(1) <= W(1);
            y(0) <= W(0);
        elsif (S = "01") then
            y(3) <= w(0);
            y(2) <= w(3);
            y(1) <= w(2);
            y(0) <= w(1);
        elsif (S = "10") then
            y(3) <= w(1);
            y(2) <= w(0);
            y(1) <= w(3);
            y(0) <= w(2);
        elsif (S = "11") then
            y(3) <= w(2);
            y(2) <= w(1);
            y(1) <= w(0);
            y(0) <= w(3);
        end if;
    end process;
end mux;
