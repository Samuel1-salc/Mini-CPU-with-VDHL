library ieee;
use ieee.std_logic_1164.all;

entity gray_to_binary is
    port (
        gray_in : in  std_logic_vector(3 downto 0);
        bin_out : out std_logic_vector(3 downto 0)
    );
end entity gray_to_binary;

architecture rtl of gray_to_binary is
    signal convertBin : std_logic_vector (3 downto 0);
begin
    convertBin(3) <= gray_in(3);
    convertBin(2) <= convertBin(3) xor gray_in(2);
    convertBin(1) <= convertBin(2) xor gray_in(1);
    convertBin(0) <= convertBin(1) xor gray_in(0);
    bin_out <= convertBin;
  
end architecture;