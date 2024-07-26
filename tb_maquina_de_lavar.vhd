library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_MaquinaDeLavar is
end tb_MaquinaDeLavar;

architecture sim of tb_MaquinaDeLavar is

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal iniciar : STD_LOGIC := '0';
    signal moeda_entrada : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal saida_led : STD_LOGIC_VECTOR(2 downto 0);
    signal sinal_motor : STD_LOGIC;
    signal sinal_valvula_agua : STD_LOGIC;

    component MaquinaDeLavar
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            iniciar : in STD_LOGIC;
            moeda_entrada : in STD_LOGIC_VECTOR(3 downto 0);
            saida_led : out STD_LOGIC_VECTOR(2 downto 0);
            sinal_motor : out STD_LOGIC;
            sinal_valvula_agua : out STD_LOGIC
        );
    end component;

begin

    UUT: MaquinaDeLavar
        Port map (
            clk => clk,
            reset => reset,
            iniciar => iniciar,
            moeda_entrada => moeda_entrada,
            saida_led => saida_led,
            sinal_motor => sinal_motor,
            sinal_valvula_agua => sinal_valvula_agua
        );

    clk_process :process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    stimulus_process: process
    begin
        -- Teste de reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        -- Inserindo moeda
        moeda_entrada <= "1010";
        wait for 10 ns;

        -- Iniciar ciclo de lavagem
        iniciar <= '1';
        wait for 20 ns;
        iniciar <= '0';

        -- Aguardar por múltiplos ciclos de máquina
        wait for 300 ns;

        -- Finalizar a simulação
        wait;
    end process;

end sim;
