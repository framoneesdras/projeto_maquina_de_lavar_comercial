library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistradorEstado is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        proximo_estado : in STD_LOGIC_VECTOR(2 downto 0);
        estado_atual : out STD_LOGIC_VECTOR(2 downto 0)
    );
end RegistradorEstado;

architecture Comportamental of RegistradorEstado is
    signal estado : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            estado <= (others => '0');
        elsif rising_edge(clk) then
            estado <= proximo_estado;
        end if;
    end process;

    estado_atual <= estado;
end Comportamental;
