library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControleMaquinaDeLavar is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        iniciar : in STD_LOGIC;
        moeda_entrada : in STD_LOGIC_VECTOR(3 downto 0);
        saida_led : out STD_LOGIC_VECTOR(2 downto 0);
        sinal_motor : out STD_LOGIC;
        sinal_valvula_agua : out STD_LOGIC
    );
end ControleMaquinaDeLavar;

architecture Comportamental of ControleMaquinaDeLavar is

    signal dinheiro_total : STD_LOGIC_VECTOR(3 downto 0);
    signal estado_atual : STD_LOGIC_VECTOR(2 downto 0);
    signal proximo_estado : STD_LOGIC_VECTOR(2 downto 0);
    signal temporizador_concluido : STD_LOGIC;
    signal ctrl_motor : STD_LOGIC;
    signal ctrl_valvula_agua : STD_LOGIC;
    signal status_led : STD_LOGIC_VECTOR(2 downto 0);
    signal sinal_iniciar_temporizador : STD_LOGIC;

    constant VALOR_PARA_INICIAR : STD_LOGIC_VECTOR(3 downto 0) := "1010";

    component ContadorDinheiro
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            moeda_entrada : in STD_LOGIC_VECTOR(3 downto 0);
            dinheiro_total : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component RegistradorEstado
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            proximo_estado : in STD_LOGIC_VECTOR(2 downto 0);
            estado_atual : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component Temporizador
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            iniciar_temporizador : in STD_LOGIC;
            temporizador_concluido : out STD_LOGIC
        );
    end component;

    component ControleMotor
        Port (
            ctrl_motor : in STD_LOGIC;
            sinal_motor : out STD_LOGIC
        );
    end component;

    component ControleValvulaAgua
        Port (
            ctrl_valvula_agua : in STD_LOGIC;
            sinal_valvula_agua : out STD_LOGIC
        );
    end component;

    component LEDsDisplay
        Port (
            status_led : in STD_LOGIC_VECTOR(2 downto 0);
            saida_led : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

begin

    U1: ContadorDinheiro
        Port map (
            clk => clk,
            reset => reset,
            moeda_entrada => moeda_entrada,
            dinheiro_total => dinheiro_total
        );

    U2: RegistradorEstado
        Port map (
            clk => clk,
            reset => reset,
            proximo_estado => proximo_estado,
            estado_atual => estado_atual
        );

    U3: Temporizador
        Port map (
            clk => clk,
            reset => reset,
            iniciar_temporizador => sinal_iniciar_temporizador,
            temporizador_concluido => temporizador_concluido
        );

    U4: ControleMotor
        Port map (
            ctrl_motor => ctrl_motor,
            sinal_motor => sinal_motor
        );

    U5: ControleValvulaAgua
        Port map (
            ctrl_valvula_agua => ctrl_valvula_agua,
            sinal_valvula_agua => sinal_valvula_agua
        );

    U6: LEDsDisplay
        Port map (
            status_led => status_led,
            saida_led => saida_led
        );

    process(clk, reset)
    begin
        if reset = '1' then
            estado_atual <= "000";
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;
        end if;
    end process;

    process(estado_atual, iniciar, dinheiro_total, temporizador_concluido)
    begin
        case estado_atual is
            when "000" =>  -- ESPERA
                if iniciar = '1' and dinheiro_total = VALOR_PARA_INICIAR then
                    proximo_estado <= "001";  -- ENCHIMENTO
                else
                    proximo_estado <= "000";
                end if;
            when "001" =>  -- ENCHIMENTO
                if temporizador_concluido = '1' then
                    proximo_estado <= "010";  -- LAVAGEM
                else
                    proximo_estado <= "001";
                end if;
            when "010" =>  -- LAVAGEM
                if temporizador_concluido = '1' then
                    proximo_estado <= "011";  -- ENXAGUE
                else
                    proximo_estado <= "010";
                end if;
            when "011" =>  -- ENXAGUE
                if temporizador_concluido = '1' then
                    proximo_estado <= "100";  -- CENTRIFUGAÇÃO
                else
                    proximo_estado <= "011";
                end if;
            when "100" =>  -- CENTRIFUGAÇÃO
                if temporizador_concluido = '1' then
                    proximo_estado <= "101";  -- FINAL
                else
                    proximo_estado <= "100";
                end if;
            when "101" =>  -- FINAL
                if iniciar = '0' then
                    proximo_estado <= "000";  -- ESPERA
                else
                    proximo_estado <= "101";
                end if;
            when others =>
                proximo_estado <= "000";
        end case;
    end process;

    -- Sinais de controle para o motor e válvula de água
    ctrl_motor <= '1' when (estado_atual = "010" or estado_atual = "100") else '0';
    ctrl_valvula_agua <= '1' when (estado_atual = "001" or estado_atual = "011") else '0';

    -- Status dos LEDs
    status_led <= "001" when estado_atual = "000" else
                  "010" when estado_atual = "001" else
                  "011" when estado_atual = "010" else
                  "100" when estado_atual = "011" else
                  "101" when estado_atual = "100" else
                  "110" when estado_atual = "101" else
                  "000";

    -- Sinal de iniciar temporizador
    sinal_iniciar_temporizador <= '1' when (estado_atual = "001" or estado_atual = "010" or estado_atual = "011" or estado_atual = "100") else '0';

end Comportamental;
