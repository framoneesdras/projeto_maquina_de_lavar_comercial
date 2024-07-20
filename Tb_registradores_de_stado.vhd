library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_StateRegister is
end tb_StateRegister;

architecture Behavioral of tb_StateRegister is

    component StateRegister
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            next_state : in STD_LOGIC_VECTOR(2 downto 0);
            current_state : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal next_state : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal current_state : STD_LOGIC_VECTOR(2 downto 0);

    constant clk_period : time := 10 ns;

begin

    UUT: StateRegister
        Port map (
            clk => clk,
            reset => reset,
            next_state => next_state,
            current_state => current_state
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
        
        next_state <= "001";
        wait for 20 ns;
        next_state <= "010";
        wait for 20 ns;
        next_state <= "011";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
