library ieee;
use ieee.std_logic_1164.all;

entity demo_setup is
    port (
        gray_in : in  std_logic_vector(3 downto 0);
        segments : out std_logic_vector(6 downto 0)
    );
end entity demo_setup;

architecture structural of demo_setup is
    signal bin : std_logic_vector(3 downto 0);
begin
    gray_converter: entity work.gray_to_binary
        port map (
            gray_in => gray_in,
            bin_out => bin
        );

    display_decoder: entity work.bin_to_decimal
        port map (
            bin => bin,
            segments => segments
        );
end architecture structural;
