library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DisplayAndLEDs is
    Port (
        led_status : in STD_LOGIC_VECTOR(2 downto 0);
        led_output : out STD_LOGIC_VECTOR(2 downto 0)
    );
end DisplayAndLEDs;

architecture Behavioral of DisplayAndLEDs is
begin
    led_output <= led_status;
end Behavioral;
