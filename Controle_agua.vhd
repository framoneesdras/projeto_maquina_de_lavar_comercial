library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WaterValveControl is
    Port (
        water_valve_ctrl : in STD_LOGIC;
        water_valve_signal : out STD_LOGIC
    );
end WaterValveControl;

architecture Behavioral of WaterValveControl is
begin
    water_valve_signal <= water_valve_ctrl;
end Behavioral;
