library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControleValvulaAgua is
    Port (
        ctrl_valvula_agua : in STD_LOGIC;
        sinal_valvula_agua : out STD_LOGIC
    );
end ControleValvulaAgua;

architecture Comportamental of ControleValvulaAgua is
begin
    sinal_valvula_agua <= ctrl_valvula_agua;
end Comportamental;
