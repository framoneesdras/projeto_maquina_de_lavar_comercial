library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ContadorDinheiro is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        moeda_entrada : in STD_LOGIC_VECTOR(3 downto 0);
        dinheiro_total : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ContadorDinheiro;

architecture Comportamental of ContadorDinheiro is
    signal contador_dinheiro : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador_dinheiro <= (others => '0');
        elsif rising_edge(clk) then
            if moeda_entrada /= "0000" then
                contador_dinheiro <= std_logic_vector(unsigned(contador_dinheiro) + unsigned(moeda_entrada));
            end if;
        end if;
    end process;

    dinheiro_total <= contador_dinheiro;
end Comportamental;
