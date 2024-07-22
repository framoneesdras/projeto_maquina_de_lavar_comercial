library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControleMotor is
    Port (
        ctrl_motor : in STD_LOGIC;
        sinal_motor : out STD_LOGIC
    );
end ControleMotor;

architecture Comportamental of ControleMotor is
begin
    sinal_motor <= ctrl_motor;
end Comportamental;
