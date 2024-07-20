library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_Timer is
end tb_Timer;

architecture Behavioral of tb_Timer is

    component Timer
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            start_timer : in STD_LOGIC;
            timer_done : out STD_LOGIC
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start_timer : STD_LOGIC := '0';
    signal timer_done : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin

    UUT: Timer
        Port map (
            clk => clk,
            reset => reset,
            start_timer => start_timer,
            timer_done => timer_done
        );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stimulus : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        start_timer <= '1';
        wait for 200 ns;  -- Adjust this time based on your MAX_COUNT in the Timer component
        start_timer <= '0';
        
        wait;
    end process;

end Behavioral;
