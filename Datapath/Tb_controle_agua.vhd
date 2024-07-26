library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_WaterValveControl is
end tb_WaterValveControl;

architecture Behavioral of tb_WaterValveControl is

    component WaterValveControl
        Port (
            water_valve_ctrl : in STD_LOGIC;
            water_valve_signal : out STD_LOGIC
        );
    end component;

    signal water_valve_ctrl : STD_LOGIC := '0';
    signal water_valve_signal : STD_LOGIC;

begin

    UUT: WaterValveControl
        Port map (
            water_valve_ctrl => water_valve_ctrl,
            water_valve_signal => water_valve_signal
        );

    stimulus : process
    begin
        water_valve_ctrl <= '1';
        wait for 50 ns;
        water_valve_ctrl <= '0';
        wait for 50 ns;
        water_valve_ctrl <= '1';
        wait for 50 ns;
        
        wait;
    end process;

end Behavioral;
