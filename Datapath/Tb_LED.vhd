library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_DisplayAndLEDs is
end tb_DisplayAndLEDs;

architecture Behavioral of tb_DisplayAndLEDs is

    component DisplayAndLEDs
        Port (
            led_status : in STD_LOGIC_VECTOR(2 downto 0);
            led_output : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    signal led_status : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal led_output : STD_LOGIC_VECTOR(2 downto 0);

begin

    UUT: DisplayAndLEDs
        Port map (
            led_status => led_status,
            led_output => led_output
        );

    stimulus : process
    begin
        led_status <= "000";
        wait for 20 ns;
        led_status <= "001";
        wait for 20 ns;
        led_status <= "010";
        wait for 20 ns;
        led_status <= "011";
        wait for 20 ns;
        led_status <= "100";
        wait for 20 ns;
        led_status <= "101";
        wait for 20 ns;
        led_status <= "110";
        wait for 20 ns;
        led_status <= "111";
        wait for 20 ns;
        
        wait;
    end process;

end Behavioral;
