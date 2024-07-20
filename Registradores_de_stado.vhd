library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity StateRegister is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        next_state : in STD_LOGIC_VECTOR(2 downto 0);
        current_state : out STD_LOGIC_VECTOR(2 downto 0)
    );
end StateRegister;

architecture Behavioral of StateRegister is
    signal state_reg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state_reg <= (others => '0');
        elsif rising_edge(clk) then
            state_reg <= next_state;
        end if;
    end process;

    current_state <= state_reg;
end Behavioral;
