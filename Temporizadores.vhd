library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Timer is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_timer : in STD_LOGIC;
        timer_done : out STD_LOGIC
    );
end Timer;

architecture Behavioral of Timer is
    signal count : INTEGER := 0;
    constant MAX_COUNT : INTEGER := 50000000; -- Ajuste conforme necessário
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            timer_done <= '0';
        elsif rising_edge(clk) then
            if start_timer = '1' then
                if count < MAX_COUNT then
                    count <= count + 1;
                    timer_done <= '0';
                else
                    count <= 0;
                    timer_done <= '1';
                end if;
            else
                count <= 0;
                timer_done <= '0';
            end if;
        end if;
    end process;
end Behavioral;
