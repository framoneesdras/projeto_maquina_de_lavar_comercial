library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_WashingMachine is
end tb_WashingMachine;

architecture Behavioral of tb_WashingMachine is
    component WashingMachine
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            start : in STD_LOGIC;
            coin_in : in STD_LOGIC_VECTOR(3 downto 0);
            led_output : out STD_LOGIC_VECTOR(2 downto 0);
            motor_signal : out STD_LOGIC;
            water_valve_signal : out STD_LOGIC
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal coin_in : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal led_output : STD_LOGIC_VECTOR(2 downto 0);
    signal motor_signal : STD_LOGIC;
    signal water_valve_signal : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin
    UUT: WashingMachine
        Port map (
            clk => clk,
            reset => reset,
            start => start,
            coin_in => coin_in,
            led_output => led_output,
            motor_signal => motor_signal,
            water_valve_signal => water_valve_signal
        );

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process clk_process;

    stimulus : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        start <= '1';
        coin_in <= "1010";  -- Insert 10 units
        wait for 100 ns;
        start <= '0';

        -- Wait for machine to go through all cycles
        wait for 1000 ns;

        wait;
    end process stimulus;

end Behavioral;
