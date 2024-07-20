library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MotorControl is
    Port (
        motor_ctrl : in STD_LOGIC;
        motor_signal : out STD_LOGIC
    );
end MotorControl;

architecture Behavioral of MotorControl is
begin
    motor_signal <= motor_ctrl;
end Behavioral;
