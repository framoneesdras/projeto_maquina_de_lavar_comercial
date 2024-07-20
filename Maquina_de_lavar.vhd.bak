library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WashingMachine is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start : in STD_LOGIC;
        coin_in : in STD_LOGIC_VECTOR(3 downto 0);
        led_output : out STD_LOGIC_VECTOR(2 downto 0);
        motor_signal : out STD_LOGIC;
        water_valve_signal : out STD_LOGIC
    );
end WashingMachine;

architecture Behavioral of WashingMachine is

    signal total_money : STD_LOGIC_VECTOR(3 downto 0);
    signal current_state : STD_LOGIC_VECTOR(2 downto 0);
    signal next_state : STD_LOGIC_VECTOR(2 downto 0);
    signal timer_done : STD_LOGIC;
    signal motor_ctrl : STD_LOGIC;
    signal water_valve_ctrl : STD_LOGIC;
    signal led_status : STD_LOGIC_VECTOR(2 downto 0);

    component MoneyCounter
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            coin_in : in STD_LOGIC_VECTOR(3 downto 0);
            total_money : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component StateRegister
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            next_state : in STD_LOGIC_VECTOR(2 downto 0);
            current_state : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component Timer
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            start_timer : in STD_LOGIC;
            timer_done : out STD_LOGIC
        );
    end component;

    component MotorControl
        Port (
            motor_ctrl : in STD_LOGIC;
            motor_signal : out STD_LOGIC
        );
    end component;

    component WaterValveControl
        Port (
            water_valve_ctrl : in STD_LOGIC;
            water_valve_signal : out STD_LOGIC
        );
    end component;

    component DisplayAndLEDs
        Port (
            led_status : in STD_LOGIC_VECTOR(2 downto 0);
            led_output : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- FSM logic
    process(current_state, start, total_money, timer_done)
    begin
        case current_state is
            when "000" =>  -- IDLE
                if start = '1' and total_money = "1010" then
                    next_state <= "001";  -- ENCHIMENTO
                else
                    next_state <= "000";
                end if;
            when "001" =>  -- ENCHIMENTO
                if timer_done = '1' then
                    next_state <= "010";  -- LAVAGEM
                else
                    next_state <= "001";
                end if;
            when "010" =>  -- LAVAGEM
                if timer_done = '1' then
                    next_state <= "011";  -- ENXAGUE
                else
                    next_state <= "010";
                end if;
            when "011" =>  -- ENXAGUE
                if timer_done = '1' then
                    next_state <= "100";  -- CENTRIFUGACAO
                else
                    next_state <= "011";
                end if;
            when "100" =>  -- CENTRIFUGACAO
                if timer_done = '1' then
                    next_state <= "101";  -- FINAL
                else
                    next_state <= "100";
                end if;
            when "101" =>  -- FINAL
                if start = '0' then
                    next_state <= "000";  -- IDLE
                else
                    next_state <= "101";
                end if;
            when others =>
                next_state <= "000";
        end case;
    end process;

    -- Control signals for motor and water valve
    motor_ctrl <= '1' when (current_state = "010" or current_state = "100") else '0';
    water_valve_ctrl <= '1' when (current_state = "001" or current_state = "011") else '0';

    -- LED status
    led_status <= "001" when current_state = "000" else
                  "010" when current_state = "001" else
                  "011" when current_state = "010" else
                  "100" when current_state = "011" else
                  "101" when current_state = "100" else
                  "110" when current_state = "101" else
                  "000";

begin

    U1: MoneyCounter
        Port map (
            clk => clk,
            reset => reset,
            coin_in => coin_in,
            total_money => total_money
        );

    U2: StateRegister
        Port map (
            clk => clk,
            reset => reset,
            next_state => next_state,
            current_state => current_state
        );

    U3: Timer
        Port map (
            clk => clk,
            reset => reset,
            start_timer => (current_state = "001" or current_state = "010" or current_state = "011" or current_state = "100"),
            timer_done => timer_done
        );

    U4: MotorControl
        Port map (
            motor_ctrl => motor_ctrl,
            motor_signal => motor_signal
        );

    U5: WaterValveControl
        Port map (
            water_valve_ctrl => water_valve_ctrl,
            water_valve_signal => water_valve_signal
        );

    U6: DisplayAndLEDs
        Port map (
            led_status => led_status,
            led_output => led_output
        );

end Behavioral;
