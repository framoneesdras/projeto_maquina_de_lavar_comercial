library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_MoneyCounter is
end tb_MoneyCounter;

architecture Behavioral of tb_MoneyCounter is

    component MoneyCounter
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            coin_in : in STD_LOGIC_VECTOR(3 downto 0);
            total_money : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal coin_in : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal total_money : STD_LOGIC_VECTOR(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    UUT: MoneyCounter
        Port map (
            clk => clk,
            reset => reset,
            coin_in => coin_in,
            total_money => total_money
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
        
        coin_in <= "0001";  -- Insert 1 unit
        wait for 20 ns;
        coin_in <= "0010";  -- Insert 2 units
        wait for 20 ns;
        coin_in <= "0011";  -- Insert 3 units
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
