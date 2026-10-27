LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_shift is
END tb_shift;

ARCHITECTURE behavior OF tb_shift IS 

    COMPONENT shift
    PORT(
         W : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --
   signal W : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

    --Outputs
   signal y : std_logic_vector(3 downto 0);
  
BEGIN
    uut: shift PORT MAP (
            W => W,
            S => S,
            y => y
        );


    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        wait for 100 ns;	
        
        W <= "0001"; S <= "00"; wait for 10 ns;
        W <= "0001"; S <= "01"; wait for 10 ns;
        W <= "0001"; S <= "10"; wait for 10 ns;
        W <= "0001"; S <= "11"; wait for 10 ns;
    
        W <= "0010"; S <= "00"; wait for 10 ns;
        W <= "0010"; S <= "01"; wait for 10 ns;
        W <= "0010"; S <= "10"; wait for 10 ns;
        W <= "0010"; S <= "11"; wait for 10 ns;
    
        W <= "0100"; S <= "00"; wait for 10 ns;
        W <= "0100"; S <= "01"; wait for 10 ns;
        W <= "0100"; S <= "10"; wait for 10 ns;
        W <= "0100"; S <= "11"; wait for 10 ns;
    
        W <= "1000"; S <= "00"; wait for 10 ns;
        W <= "1000"; S <= "01"; wait for 10 ns;
        W <= "1000"; S <= "10"; wait for 10 ns;
        W <= "1000"; S <= "11"; wait for 10 ns;

        wait;
    end process;
END;