library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Temporizador is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        iniciar_temporizador : in STD_LOGIC;
        temporizador_concluido : out STD_LOGIC
    );
end Temporizador;

architecture Comportamental of Temporizador is
    signal contador : INTEGER := 0;
    constant LIMITE_CONTADOR : INTEGER := 1000000; -- Ajuste tempo
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0;
            temporizador_concluido <= '0';
        elsif rising_edge(clk) then
            if iniciar_temporizador = '1' then
                if contador < LIMITE_CONTADOR then
                    contador <= contador + 1;
                    temporizador_concluido <= '0';
                else
                    temporizador_concluido <= '1';
                end if;
            else
                contador <= 0;
                temporizador_concluido <= '0';
            end if;
        end if;
    end process;
end Comportamental;
