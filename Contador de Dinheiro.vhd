library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MoneyCounter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        coin_in : in STD_LOGIC_VECTOR(3 downto 0);
        total_money : out STD_LOGIC_VECTOR(3 downto 0)
    );
end MoneyCounter;

architecture Behavioral of MoneyCounter is
    signal money_counter : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            money_counter <= (others => '0');
        elsif rising_edge(clk) then
            if coin_in /= "0000" then
                money_counter <= money_counter + coin_in;
            end if;
        end if;
    end process;

    total_money <= money_counter;
end Behavioral;
