library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LEDsDisplay is
    Port (
        status_led : in STD_LOGIC_VECTOR(2 downto 0);
        saida_led : out STD_LOGIC_VECTOR(2 downto 0)
    );
end LEDsDisplay;

architecture Comportamental of LEDsDisplay is
begin
    saida_led <= status_led;
end Comportamental;
