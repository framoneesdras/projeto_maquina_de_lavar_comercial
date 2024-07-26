library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_MotorControl is
end tb_MotorControl;

architecture Behavioral of tb_MotorControl is

    component MotorControl
        Port (
            motor_ctrl : in STD_LOGIC;
            motor_signal : out STD_LOGIC
        );
    end component;

    signal motor_ctrl : STD_LOGIC := '0';
    signal motor_signal : STD_LOGIC;

begin

    UUT: MotorControl
        Port map (
            motor_ctrl => motor_ctrl,
            motor_signal => motor_signal
        );

    stimulus : process
    begin
        motor_ctrl <= '1';
        wait for 50 ns;
        motor_ctrl <= '0';
        wait for 50 ns;
        motor_ctrl <= '1';
        wait for 50 ns;
        
        wait;
    end process;

end Behavioral;
