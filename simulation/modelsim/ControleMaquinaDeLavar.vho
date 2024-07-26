-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "07/26/2024 14:13:36"

-- 
-- Device: Altera EP2C15AF256C7 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ControleMaquinaDeLavar IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	iniciar : IN std_logic;
	moeda_entrada : IN std_logic_vector(3 DOWNTO 0);
	saida_led : OUT std_logic_vector(2 DOWNTO 0);
	sinal_motor : OUT std_logic;
	sinal_valvula_agua : OUT std_logic
	);
END ControleMaquinaDeLavar;

-- Design Ports Information
-- saida_led[0]	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- saida_led[1]	=>  Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- saida_led[2]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sinal_motor	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sinal_valvula_agua	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- iniciar	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- moeda_entrada[1]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- moeda_entrada[0]	=>  Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- moeda_entrada[2]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- moeda_entrada[3]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ControleMaquinaDeLavar IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_iniciar : std_logic;
SIGNAL ww_moeda_entrada : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_saida_led : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_sinal_motor : std_logic;
SIGNAL ww_sinal_valvula_agua : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U1|contador_dinheiro[1]~6_combout\ : std_logic;
SIGNAL \U2|contador[3]~38_combout\ : std_logic;
SIGNAL \U2|contador[5]~42_combout\ : std_logic;
SIGNAL \U2|contador[8]~48_combout\ : std_logic;
SIGNAL \U2|contador[18]~68_combout\ : std_logic;
SIGNAL \U2|contador[21]~74_combout\ : std_logic;
SIGNAL \U2|contador[30]~93\ : std_logic;
SIGNAL \U2|contador[31]~94_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \U2|LessThan0~0_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \U1|contador_dinheiro[0]~5\ : std_logic;
SIGNAL \U1|contador_dinheiro[1]~7\ : std_logic;
SIGNAL \U1|contador_dinheiro[2]~8_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \U1|Equal0~0_combout\ : std_logic;
SIGNAL \U1|contador_dinheiro[2]~9\ : std_logic;
SIGNAL \U1|contador_dinheiro[3]~10_combout\ : std_logic;
SIGNAL \U1|contador_dinheiro[0]~4_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \iniciar~combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \sinal_iniciar_temporizador~0_combout\ : std_logic;
SIGNAL \U2|contador[0]~32_combout\ : std_logic;
SIGNAL \U2|contador[0]~33\ : std_logic;
SIGNAL \U2|contador[1]~34_combout\ : std_logic;
SIGNAL \U2|contador[1]~35\ : std_logic;
SIGNAL \U2|contador[2]~36_combout\ : std_logic;
SIGNAL \U2|contador[2]~37\ : std_logic;
SIGNAL \U2|contador[3]~39\ : std_logic;
SIGNAL \U2|contador[4]~40_combout\ : std_logic;
SIGNAL \U2|contador[4]~41\ : std_logic;
SIGNAL \U2|contador[5]~43\ : std_logic;
SIGNAL \U2|contador[6]~45\ : std_logic;
SIGNAL \U2|contador[7]~46_combout\ : std_logic;
SIGNAL \U2|contador[7]~47\ : std_logic;
SIGNAL \U2|contador[8]~49\ : std_logic;
SIGNAL \U2|contador[9]~50_combout\ : std_logic;
SIGNAL \U2|contador[9]~51\ : std_logic;
SIGNAL \U2|contador[10]~53\ : std_logic;
SIGNAL \U2|contador[11]~54_combout\ : std_logic;
SIGNAL \U2|contador[11]~55\ : std_logic;
SIGNAL \U2|contador[12]~57\ : std_logic;
SIGNAL \U2|contador[13]~58_combout\ : std_logic;
SIGNAL \U2|contador[13]~59\ : std_logic;
SIGNAL \U2|contador[14]~60_combout\ : std_logic;
SIGNAL \U2|contador[14]~61\ : std_logic;
SIGNAL \U2|contador[15]~62_combout\ : std_logic;
SIGNAL \U2|contador[15]~63\ : std_logic;
SIGNAL \U2|contador[16]~64_combout\ : std_logic;
SIGNAL \U2|contador[16]~65\ : std_logic;
SIGNAL \U2|contador[17]~66_combout\ : std_logic;
SIGNAL \U2|contador[17]~67\ : std_logic;
SIGNAL \U2|contador[18]~69\ : std_logic;
SIGNAL \U2|contador[19]~70_combout\ : std_logic;
SIGNAL \U2|LessThan0~3_combout\ : std_logic;
SIGNAL \U2|contador[6]~44_combout\ : std_logic;
SIGNAL \U2|LessThan0~4_combout\ : std_logic;
SIGNAL \U2|contador[12]~56_combout\ : std_logic;
SIGNAL \U2|contador[10]~52_combout\ : std_logic;
SIGNAL \U2|LessThan0~5_combout\ : std_logic;
SIGNAL \U2|LessThan0~6_combout\ : std_logic;
SIGNAL \U2|contador[19]~71\ : std_logic;
SIGNAL \U2|contador[20]~72_combout\ : std_logic;
SIGNAL \U2|contador[20]~73\ : std_logic;
SIGNAL \U2|contador[21]~75\ : std_logic;
SIGNAL \U2|contador[22]~76_combout\ : std_logic;
SIGNAL \U2|contador[22]~77\ : std_logic;
SIGNAL \U2|contador[23]~78_combout\ : std_logic;
SIGNAL \U2|contador[23]~79\ : std_logic;
SIGNAL \U2|contador[24]~81\ : std_logic;
SIGNAL \U2|contador[25]~82_combout\ : std_logic;
SIGNAL \U2|contador[25]~83\ : std_logic;
SIGNAL \U2|contador[26]~85\ : std_logic;
SIGNAL \U2|contador[27]~86_combout\ : std_logic;
SIGNAL \U2|contador[27]~87\ : std_logic;
SIGNAL \U2|contador[28]~88_combout\ : std_logic;
SIGNAL \U2|contador[28]~89\ : std_logic;
SIGNAL \U2|contador[29]~90_combout\ : std_logic;
SIGNAL \U2|contador[29]~91\ : std_logic;
SIGNAL \U2|contador[30]~92_combout\ : std_logic;
SIGNAL \U2|contador[24]~80_combout\ : std_logic;
SIGNAL \U2|contador[26]~84_combout\ : std_logic;
SIGNAL \U2|LessThan0~1_combout\ : std_logic;
SIGNAL \U2|LessThan0~2_combout\ : std_logic;
SIGNAL \U2|LessThan0~7_combout\ : std_logic;
SIGNAL \U2|temporizador_concluido~0_combout\ : std_logic;
SIGNAL \U2|temporizador_concluido~1_combout\ : std_logic;
SIGNAL \U2|temporizador_concluido~regout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \status_led[0]~0_combout\ : std_logic;
SIGNAL \status_led[1]~1_combout\ : std_logic;
SIGNAL \status_led[2]~2_combout\ : std_logic;
SIGNAL \ctrl_motor~0_combout\ : std_logic;
SIGNAL \ctrl_valvula_agua~0_combout\ : std_logic;
SIGNAL estado_atual : std_logic_vector(2 DOWNTO 0);
SIGNAL \U1|contador_dinheiro\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U2|contador\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \moeda_entrada~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_status_led[1]~1_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_iniciar <= iniciar;
ww_moeda_entrada <= moeda_entrada;
saida_led <= ww_saida_led;
sinal_motor <= ww_sinal_motor;
sinal_valvula_agua <= ww_sinal_valvula_agua;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);
\ALT_INV_status_led[1]~1_combout\ <= NOT \status_led[1]~1_combout\;

-- Location: LCFF_X7_Y26_N13
\U1|contador_dinheiro[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U1|contador_dinheiro[1]~6_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \U1|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|contador_dinheiro\(1));

-- Location: LCFF_X8_Y24_N23
\U2|contador[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[21]~74_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(21));

-- Location: LCFF_X8_Y24_N17
\U2|contador[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[18]~68_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(18));

-- Location: LCFF_X9_Y24_N17
\U2|contador[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[8]~48_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(8));

-- Location: LCFF_X9_Y23_N31
\U2|contador[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[31]~94_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(31));

-- Location: LCCOMB_X7_Y26_N12
\U1|contador_dinheiro[1]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \U1|contador_dinheiro[1]~6_combout\ = (\U1|contador_dinheiro\(1) & ((\moeda_entrada~combout\(1) & (\U1|contador_dinheiro[0]~5\ & VCC)) # (!\moeda_entrada~combout\(1) & (!\U1|contador_dinheiro[0]~5\)))) # (!\U1|contador_dinheiro\(1) & 
-- ((\moeda_entrada~combout\(1) & (!\U1|contador_dinheiro[0]~5\)) # (!\moeda_entrada~combout\(1) & ((\U1|contador_dinheiro[0]~5\) # (GND)))))
-- \U1|contador_dinheiro[1]~7\ = CARRY((\U1|contador_dinheiro\(1) & (!\moeda_entrada~combout\(1) & !\U1|contador_dinheiro[0]~5\)) # (!\U1|contador_dinheiro\(1) & ((!\U1|contador_dinheiro[0]~5\) # (!\moeda_entrada~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|contador_dinheiro\(1),
	datab => \moeda_entrada~combout\(1),
	datad => VCC,
	cin => \U1|contador_dinheiro[0]~5\,
	combout => \U1|contador_dinheiro[1]~6_combout\,
	cout => \U1|contador_dinheiro[1]~7\);

-- Location: LCFF_X9_Y24_N11
\U2|contador[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[5]~42_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(5));

-- Location: LCFF_X9_Y24_N7
\U2|contador[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[3]~38_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(3));

-- Location: LCCOMB_X9_Y24_N6
\U2|contador[3]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[3]~38_combout\ = (\U2|contador\(3) & (!\U2|contador[2]~37\)) # (!\U2|contador\(3) & ((\U2|contador[2]~37\) # (GND)))
-- \U2|contador[3]~39\ = CARRY((!\U2|contador[2]~37\) # (!\U2|contador\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(3),
	datad => VCC,
	cin => \U2|contador[2]~37\,
	combout => \U2|contador[3]~38_combout\,
	cout => \U2|contador[3]~39\);

-- Location: LCCOMB_X9_Y24_N10
\U2|contador[5]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[5]~42_combout\ = (\U2|contador\(5) & (!\U2|contador[4]~41\)) # (!\U2|contador\(5) & ((\U2|contador[4]~41\) # (GND)))
-- \U2|contador[5]~43\ = CARRY((!\U2|contador[4]~41\) # (!\U2|contador\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(5),
	datad => VCC,
	cin => \U2|contador[4]~41\,
	combout => \U2|contador[5]~42_combout\,
	cout => \U2|contador[5]~43\);

-- Location: LCCOMB_X9_Y24_N16
\U2|contador[8]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[8]~48_combout\ = (\U2|contador\(8) & (\U2|contador[7]~47\ $ (GND))) # (!\U2|contador\(8) & (!\U2|contador[7]~47\ & VCC))
-- \U2|contador[8]~49\ = CARRY((\U2|contador\(8) & !\U2|contador[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(8),
	datad => VCC,
	cin => \U2|contador[7]~47\,
	combout => \U2|contador[8]~48_combout\,
	cout => \U2|contador[8]~49\);

-- Location: LCCOMB_X9_Y23_N4
\U2|contador[18]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[18]~68_combout\ = (\U2|contador\(18) & (\U2|contador[17]~67\ $ (GND))) # (!\U2|contador\(18) & (!\U2|contador[17]~67\ & VCC))
-- \U2|contador[18]~69\ = CARRY((\U2|contador\(18) & !\U2|contador[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(18),
	datad => VCC,
	cin => \U2|contador[17]~67\,
	combout => \U2|contador[18]~68_combout\,
	cout => \U2|contador[18]~69\);

-- Location: LCCOMB_X9_Y23_N10
\U2|contador[21]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[21]~74_combout\ = (\U2|contador\(21) & (!\U2|contador[20]~73\)) # (!\U2|contador\(21) & ((\U2|contador[20]~73\) # (GND)))
-- \U2|contador[21]~75\ = CARRY((!\U2|contador[20]~73\) # (!\U2|contador\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(21),
	datad => VCC,
	cin => \U2|contador[20]~73\,
	combout => \U2|contador[21]~74_combout\,
	cout => \U2|contador[21]~75\);

-- Location: LCCOMB_X9_Y23_N28
\U2|contador[30]~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[30]~92_combout\ = (\U2|contador\(30) & (\U2|contador[29]~91\ $ (GND))) # (!\U2|contador\(30) & (!\U2|contador[29]~91\ & VCC))
-- \U2|contador[30]~93\ = CARRY((\U2|contador\(30) & !\U2|contador[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(30),
	datad => VCC,
	cin => \U2|contador[29]~91\,
	combout => \U2|contador[30]~92_combout\,
	cout => \U2|contador[30]~93\);

-- Location: LCCOMB_X9_Y23_N30
\U2|contador[31]~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[31]~94_combout\ = \U2|contador[30]~93\ $ (\U2|contador\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U2|contador\(31),
	cin => \U2|contador[30]~93\,
	combout => \U2|contador[31]~94_combout\);

-- Location: LCCOMB_X7_Y26_N24
\Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (estado_atual(0) & ((estado_atual(2) & (!estado_atual(1))) # (!estado_atual(2) & ((!\U2|temporizador_concluido~regout\))))) # (!estado_atual(0) & (\U2|temporizador_concluido~regout\ & (estado_atual(2) $ (estado_atual(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_atual(2),
	datab => estado_atual(0),
	datac => estado_atual(1),
	datad => \U2|temporizador_concluido~regout\,
	combout => \Mux2~2_combout\);

-- Location: LCCOMB_X8_Y24_N20
\U2|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~0_combout\ = (!\U2|contador\(20) & (!\U2|contador\(23) & (!\U2|contador\(22) & !\U2|contador\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(20),
	datab => \U2|contador\(23),
	datac => \U2|contador\(22),
	datad => \U2|contador\(21),
	combout => \U2|LessThan0~0_combout\);

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\moeda_entrada[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_moeda_entrada(2),
	combout => \moeda_entrada~combout\(2));

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\moeda_entrada[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_moeda_entrada(1),
	combout => \moeda_entrada~combout\(1));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\moeda_entrada[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_moeda_entrada(0),
	combout => \moeda_entrada~combout\(0));

-- Location: LCCOMB_X7_Y26_N10
\U1|contador_dinheiro[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \U1|contador_dinheiro[0]~4_combout\ = (\U1|contador_dinheiro\(0) & (\moeda_entrada~combout\(0) $ (VCC))) # (!\U1|contador_dinheiro\(0) & (\moeda_entrada~combout\(0) & VCC))
-- \U1|contador_dinheiro[0]~5\ = CARRY((\U1|contador_dinheiro\(0) & \moeda_entrada~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|contador_dinheiro\(0),
	datab => \moeda_entrada~combout\(0),
	datad => VCC,
	combout => \U1|contador_dinheiro[0]~4_combout\,
	cout => \U1|contador_dinheiro[0]~5\);

-- Location: LCCOMB_X7_Y26_N14
\U1|contador_dinheiro[2]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \U1|contador_dinheiro[2]~8_combout\ = ((\moeda_entrada~combout\(2) $ (\U1|contador_dinheiro\(2) $ (!\U1|contador_dinheiro[1]~7\)))) # (GND)
-- \U1|contador_dinheiro[2]~9\ = CARRY((\moeda_entrada~combout\(2) & ((\U1|contador_dinheiro\(2)) # (!\U1|contador_dinheiro[1]~7\))) # (!\moeda_entrada~combout\(2) & (\U1|contador_dinheiro\(2) & !\U1|contador_dinheiro[1]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_entrada~combout\(2),
	datab => \U1|contador_dinheiro\(2),
	datad => VCC,
	cin => \U1|contador_dinheiro[1]~7\,
	combout => \U1|contador_dinheiro[2]~8_combout\,
	cout => \U1|contador_dinheiro[2]~9\);

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\moeda_entrada[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_moeda_entrada(3),
	combout => \moeda_entrada~combout\(3));

-- Location: LCCOMB_X7_Y26_N22
\U1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U1|Equal0~0_combout\ = (\moeda_entrada~combout\(2)) # ((\moeda_entrada~combout\(0)) # ((\moeda_entrada~combout\(1)) # (\moeda_entrada~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_entrada~combout\(2),
	datab => \moeda_entrada~combout\(0),
	datac => \moeda_entrada~combout\(1),
	datad => \moeda_entrada~combout\(3),
	combout => \U1|Equal0~0_combout\);

-- Location: LCFF_X7_Y26_N15
\U1|contador_dinheiro[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U1|contador_dinheiro[2]~8_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \U1|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|contador_dinheiro\(2));

-- Location: LCCOMB_X7_Y26_N16
\U1|contador_dinheiro[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \U1|contador_dinheiro[3]~10_combout\ = \U1|contador_dinheiro\(3) $ (\U1|contador_dinheiro[2]~9\ $ (\moeda_entrada~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|contador_dinheiro\(3),
	datad => \moeda_entrada~combout\(3),
	cin => \U1|contador_dinheiro[2]~9\,
	combout => \U1|contador_dinheiro[3]~10_combout\);

-- Location: LCFF_X7_Y26_N17
\U1|contador_dinheiro[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U1|contador_dinheiro[3]~10_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \U1|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|contador_dinheiro\(3));

-- Location: LCFF_X7_Y26_N11
\U1|contador_dinheiro[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U1|contador_dinheiro[0]~4_combout\,
	aclr => \reset~clkctrl_outclk\,
	ena => \U1|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U1|contador_dinheiro\(0));

-- Location: LCCOMB_X7_Y26_N0
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\U1|contador_dinheiro\(1) & (!\U1|contador_dinheiro\(2) & (\U1|contador_dinheiro\(3) & !\U1|contador_dinheiro\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|contador_dinheiro\(1),
	datab => \U1|contador_dinheiro\(2),
	datac => \U1|contador_dinheiro\(3),
	datad => \U1|contador_dinheiro\(0),
	combout => \Mux2~0_combout\);

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iniciar~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iniciar,
	combout => \iniciar~combout\);

-- Location: LCCOMB_X7_Y26_N6
\Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (estado_atual(1) & ((estado_atual(2)) # (estado_atual(0) $ (!\U2|temporizador_concluido~regout\)))) # (!estado_atual(1) & ((\U2|temporizador_concluido~regout\ & ((estado_atual(0)))) # (!\U2|temporizador_concluido~regout\ & 
-- (estado_atual(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_atual(2),
	datab => estado_atual(0),
	datac => estado_atual(1),
	datad => \U2|temporizador_concluido~regout\,
	combout => \Mux2~1_combout\);

-- Location: LCCOMB_X7_Y26_N26
\Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = (\Mux2~2_combout\ & (((\iniciar~combout\) # (!\Mux2~1_combout\)))) # (!\Mux2~2_combout\ & (\Mux2~0_combout\ & (\iniciar~combout\ & !\Mux2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~2_combout\,
	datab => \Mux2~0_combout\,
	datac => \iniciar~combout\,
	datad => \Mux2~1_combout\,
	combout => \Mux2~3_combout\);

-- Location: LCFF_X7_Y26_N27
\estado_atual[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux2~3_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => estado_atual(0));

-- Location: LCCOMB_X8_Y24_N22
\sinal_iniciar_temporizador~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \sinal_iniciar_temporizador~0_combout\ = estado_atual(2) $ (((!estado_atual(1) & !estado_atual(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_atual(2),
	datab => estado_atual(1),
	datad => estado_atual(0),
	combout => \sinal_iniciar_temporizador~0_combout\);

-- Location: LCCOMB_X9_Y24_N0
\U2|contador[0]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[0]~32_combout\ = \U2|contador\(0) $ (VCC)
-- \U2|contador[0]~33\ = CARRY(\U2|contador\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(0),
	datad => VCC,
	combout => \U2|contador[0]~32_combout\,
	cout => \U2|contador[0]~33\);

-- Location: LCFF_X9_Y24_N1
\U2|contador[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[0]~32_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(0));

-- Location: LCCOMB_X9_Y24_N2
\U2|contador[1]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[1]~34_combout\ = (\U2|contador\(1) & (!\U2|contador[0]~33\)) # (!\U2|contador\(1) & ((\U2|contador[0]~33\) # (GND)))
-- \U2|contador[1]~35\ = CARRY((!\U2|contador[0]~33\) # (!\U2|contador\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(1),
	datad => VCC,
	cin => \U2|contador[0]~33\,
	combout => \U2|contador[1]~34_combout\,
	cout => \U2|contador[1]~35\);

-- Location: LCFF_X9_Y24_N3
\U2|contador[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[1]~34_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(1));

-- Location: LCCOMB_X9_Y24_N4
\U2|contador[2]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[2]~36_combout\ = (\U2|contador\(2) & (\U2|contador[1]~35\ $ (GND))) # (!\U2|contador\(2) & (!\U2|contador[1]~35\ & VCC))
-- \U2|contador[2]~37\ = CARRY((\U2|contador\(2) & !\U2|contador[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(2),
	datad => VCC,
	cin => \U2|contador[1]~35\,
	combout => \U2|contador[2]~36_combout\,
	cout => \U2|contador[2]~37\);

-- Location: LCFF_X9_Y24_N5
\U2|contador[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[2]~36_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(2));

-- Location: LCCOMB_X9_Y24_N8
\U2|contador[4]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[4]~40_combout\ = (\U2|contador\(4) & (\U2|contador[3]~39\ $ (GND))) # (!\U2|contador\(4) & (!\U2|contador[3]~39\ & VCC))
-- \U2|contador[4]~41\ = CARRY((\U2|contador\(4) & !\U2|contador[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(4),
	datad => VCC,
	cin => \U2|contador[3]~39\,
	combout => \U2|contador[4]~40_combout\,
	cout => \U2|contador[4]~41\);

-- Location: LCFF_X9_Y24_N9
\U2|contador[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[4]~40_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(4));

-- Location: LCCOMB_X9_Y24_N12
\U2|contador[6]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[6]~44_combout\ = (\U2|contador\(6) & (\U2|contador[5]~43\ $ (GND))) # (!\U2|contador\(6) & (!\U2|contador[5]~43\ & VCC))
-- \U2|contador[6]~45\ = CARRY((\U2|contador\(6) & !\U2|contador[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(6),
	datad => VCC,
	cin => \U2|contador[5]~43\,
	combout => \U2|contador[6]~44_combout\,
	cout => \U2|contador[6]~45\);

-- Location: LCCOMB_X9_Y24_N14
\U2|contador[7]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[7]~46_combout\ = (\U2|contador\(7) & (!\U2|contador[6]~45\)) # (!\U2|contador\(7) & ((\U2|contador[6]~45\) # (GND)))
-- \U2|contador[7]~47\ = CARRY((!\U2|contador[6]~45\) # (!\U2|contador\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(7),
	datad => VCC,
	cin => \U2|contador[6]~45\,
	combout => \U2|contador[7]~46_combout\,
	cout => \U2|contador[7]~47\);

-- Location: LCFF_X9_Y24_N15
\U2|contador[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[7]~46_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(7));

-- Location: LCCOMB_X9_Y24_N18
\U2|contador[9]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[9]~50_combout\ = (\U2|contador\(9) & (!\U2|contador[8]~49\)) # (!\U2|contador\(9) & ((\U2|contador[8]~49\) # (GND)))
-- \U2|contador[9]~51\ = CARRY((!\U2|contador[8]~49\) # (!\U2|contador\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(9),
	datad => VCC,
	cin => \U2|contador[8]~49\,
	combout => \U2|contador[9]~50_combout\,
	cout => \U2|contador[9]~51\);

-- Location: LCFF_X9_Y24_N19
\U2|contador[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[9]~50_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(9));

-- Location: LCCOMB_X9_Y24_N20
\U2|contador[10]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[10]~52_combout\ = (\U2|contador\(10) & (\U2|contador[9]~51\ $ (GND))) # (!\U2|contador\(10) & (!\U2|contador[9]~51\ & VCC))
-- \U2|contador[10]~53\ = CARRY((\U2|contador\(10) & !\U2|contador[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(10),
	datad => VCC,
	cin => \U2|contador[9]~51\,
	combout => \U2|contador[10]~52_combout\,
	cout => \U2|contador[10]~53\);

-- Location: LCCOMB_X9_Y24_N22
\U2|contador[11]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[11]~54_combout\ = (\U2|contador\(11) & (!\U2|contador[10]~53\)) # (!\U2|contador\(11) & ((\U2|contador[10]~53\) # (GND)))
-- \U2|contador[11]~55\ = CARRY((!\U2|contador[10]~53\) # (!\U2|contador\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(11),
	datad => VCC,
	cin => \U2|contador[10]~53\,
	combout => \U2|contador[11]~54_combout\,
	cout => \U2|contador[11]~55\);

-- Location: LCFF_X9_Y24_N23
\U2|contador[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[11]~54_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(11));

-- Location: LCCOMB_X9_Y24_N24
\U2|contador[12]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[12]~56_combout\ = (\U2|contador\(12) & (\U2|contador[11]~55\ $ (GND))) # (!\U2|contador\(12) & (!\U2|contador[11]~55\ & VCC))
-- \U2|contador[12]~57\ = CARRY((\U2|contador\(12) & !\U2|contador[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(12),
	datad => VCC,
	cin => \U2|contador[11]~55\,
	combout => \U2|contador[12]~56_combout\,
	cout => \U2|contador[12]~57\);

-- Location: LCCOMB_X9_Y24_N26
\U2|contador[13]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[13]~58_combout\ = (\U2|contador\(13) & (!\U2|contador[12]~57\)) # (!\U2|contador\(13) & ((\U2|contador[12]~57\) # (GND)))
-- \U2|contador[13]~59\ = CARRY((!\U2|contador[12]~57\) # (!\U2|contador\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(13),
	datad => VCC,
	cin => \U2|contador[12]~57\,
	combout => \U2|contador[13]~58_combout\,
	cout => \U2|contador[13]~59\);

-- Location: LCFF_X9_Y24_N27
\U2|contador[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[13]~58_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(13));

-- Location: LCCOMB_X9_Y24_N28
\U2|contador[14]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[14]~60_combout\ = (\U2|contador\(14) & (\U2|contador[13]~59\ $ (GND))) # (!\U2|contador\(14) & (!\U2|contador[13]~59\ & VCC))
-- \U2|contador[14]~61\ = CARRY((\U2|contador\(14) & !\U2|contador[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(14),
	datad => VCC,
	cin => \U2|contador[13]~59\,
	combout => \U2|contador[14]~60_combout\,
	cout => \U2|contador[14]~61\);

-- Location: LCFF_X9_Y24_N29
\U2|contador[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[14]~60_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(14));

-- Location: LCCOMB_X9_Y24_N30
\U2|contador[15]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[15]~62_combout\ = (\U2|contador\(15) & (!\U2|contador[14]~61\)) # (!\U2|contador\(15) & ((\U2|contador[14]~61\) # (GND)))
-- \U2|contador[15]~63\ = CARRY((!\U2|contador[14]~61\) # (!\U2|contador\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(15),
	datad => VCC,
	cin => \U2|contador[14]~61\,
	combout => \U2|contador[15]~62_combout\,
	cout => \U2|contador[15]~63\);

-- Location: LCFF_X9_Y24_N31
\U2|contador[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[15]~62_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(15));

-- Location: LCCOMB_X9_Y23_N0
\U2|contador[16]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[16]~64_combout\ = (\U2|contador\(16) & (\U2|contador[15]~63\ $ (GND))) # (!\U2|contador\(16) & (!\U2|contador[15]~63\ & VCC))
-- \U2|contador[16]~65\ = CARRY((\U2|contador\(16) & !\U2|contador[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(16),
	datad => VCC,
	cin => \U2|contador[15]~63\,
	combout => \U2|contador[16]~64_combout\,
	cout => \U2|contador[16]~65\);

-- Location: LCFF_X8_Y24_N29
\U2|contador[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[16]~64_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(16));

-- Location: LCCOMB_X9_Y23_N2
\U2|contador[17]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[17]~66_combout\ = (\U2|contador\(17) & (!\U2|contador[16]~65\)) # (!\U2|contador\(17) & ((\U2|contador[16]~65\) # (GND)))
-- \U2|contador[17]~67\ = CARRY((!\U2|contador[16]~65\) # (!\U2|contador\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(17),
	datad => VCC,
	cin => \U2|contador[16]~65\,
	combout => \U2|contador[17]~66_combout\,
	cout => \U2|contador[17]~67\);

-- Location: LCFF_X8_Y24_N7
\U2|contador[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[17]~66_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(17));

-- Location: LCCOMB_X9_Y23_N6
\U2|contador[19]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[19]~70_combout\ = (\U2|contador\(19) & (!\U2|contador[18]~69\)) # (!\U2|contador\(19) & ((\U2|contador[18]~69\) # (GND)))
-- \U2|contador[19]~71\ = CARRY((!\U2|contador[18]~69\) # (!\U2|contador\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(19),
	datad => VCC,
	cin => \U2|contador[18]~69\,
	combout => \U2|contador[19]~70_combout\,
	cout => \U2|contador[19]~71\);

-- Location: LCFF_X8_Y24_N31
\U2|contador[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[19]~70_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(19));

-- Location: LCCOMB_X8_Y24_N28
\U2|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~3_combout\ = (\U2|contador\(18) & (\U2|contador\(19) & (\U2|contador\(16) & \U2|contador\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(18),
	datab => \U2|contador\(19),
	datac => \U2|contador\(16),
	datad => \U2|contador\(17),
	combout => \U2|LessThan0~3_combout\);

-- Location: LCFF_X9_Y24_N13
\U2|contador[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[6]~44_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(6));

-- Location: LCCOMB_X8_Y24_N24
\U2|LessThan0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~4_combout\ = ((!\U2|contador\(8) & (!\U2|contador\(7) & !\U2|contador\(6)))) # (!\U2|contador\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(8),
	datab => \U2|contador\(9),
	datac => \U2|contador\(7),
	datad => \U2|contador\(6),
	combout => \U2|LessThan0~4_combout\);

-- Location: LCFF_X9_Y24_N25
\U2|contador[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[12]~56_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(12));

-- Location: LCFF_X9_Y24_N21
\U2|contador[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[10]~52_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(10));

-- Location: LCCOMB_X8_Y24_N18
\U2|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~5_combout\ = (!\U2|contador\(13) & (!\U2|contador\(12) & (!\U2|contador\(10) & !\U2|contador\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(13),
	datab => \U2|contador\(12),
	datac => \U2|contador\(10),
	datad => \U2|contador\(11),
	combout => \U2|LessThan0~5_combout\);

-- Location: LCCOMB_X8_Y24_N8
\U2|LessThan0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~6_combout\ = (\U2|contador\(15)) # ((\U2|contador\(14) & ((!\U2|LessThan0~5_combout\) # (!\U2|LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(15),
	datab => \U2|contador\(14),
	datac => \U2|LessThan0~4_combout\,
	datad => \U2|LessThan0~5_combout\,
	combout => \U2|LessThan0~6_combout\);

-- Location: LCCOMB_X9_Y23_N8
\U2|contador[20]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[20]~72_combout\ = (\U2|contador\(20) & (\U2|contador[19]~71\ $ (GND))) # (!\U2|contador\(20) & (!\U2|contador[19]~71\ & VCC))
-- \U2|contador[20]~73\ = CARRY((\U2|contador\(20) & !\U2|contador[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(20),
	datad => VCC,
	cin => \U2|contador[19]~71\,
	combout => \U2|contador[20]~72_combout\,
	cout => \U2|contador[20]~73\);

-- Location: LCFF_X8_Y24_N13
\U2|contador[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[20]~72_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(20));

-- Location: LCCOMB_X9_Y23_N12
\U2|contador[22]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[22]~76_combout\ = (\U2|contador\(22) & (\U2|contador[21]~75\ $ (GND))) # (!\U2|contador\(22) & (!\U2|contador[21]~75\ & VCC))
-- \U2|contador[22]~77\ = CARRY((\U2|contador\(22) & !\U2|contador[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(22),
	datad => VCC,
	cin => \U2|contador[21]~75\,
	combout => \U2|contador[22]~76_combout\,
	cout => \U2|contador[22]~77\);

-- Location: LCFF_X8_Y24_N21
\U2|contador[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[22]~76_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(22));

-- Location: LCCOMB_X9_Y23_N14
\U2|contador[23]~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[23]~78_combout\ = (\U2|contador\(23) & (!\U2|contador[22]~77\)) # (!\U2|contador\(23) & ((\U2|contador[22]~77\) # (GND)))
-- \U2|contador[23]~79\ = CARRY((!\U2|contador[22]~77\) # (!\U2|contador\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(23),
	datad => VCC,
	cin => \U2|contador[22]~77\,
	combout => \U2|contador[23]~78_combout\,
	cout => \U2|contador[23]~79\);

-- Location: LCFF_X8_Y24_N3
\U2|contador[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \U2|contador[23]~78_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	sload => VCC,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(23));

-- Location: LCCOMB_X9_Y23_N16
\U2|contador[24]~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[24]~80_combout\ = (\U2|contador\(24) & (\U2|contador[23]~79\ $ (GND))) # (!\U2|contador\(24) & (!\U2|contador[23]~79\ & VCC))
-- \U2|contador[24]~81\ = CARRY((\U2|contador\(24) & !\U2|contador[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(24),
	datad => VCC,
	cin => \U2|contador[23]~79\,
	combout => \U2|contador[24]~80_combout\,
	cout => \U2|contador[24]~81\);

-- Location: LCCOMB_X9_Y23_N18
\U2|contador[25]~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[25]~82_combout\ = (\U2|contador\(25) & (!\U2|contador[24]~81\)) # (!\U2|contador\(25) & ((\U2|contador[24]~81\) # (GND)))
-- \U2|contador[25]~83\ = CARRY((!\U2|contador[24]~81\) # (!\U2|contador\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(25),
	datad => VCC,
	cin => \U2|contador[24]~81\,
	combout => \U2|contador[25]~82_combout\,
	cout => \U2|contador[25]~83\);

-- Location: LCFF_X9_Y23_N19
\U2|contador[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[25]~82_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(25));

-- Location: LCCOMB_X9_Y23_N20
\U2|contador[26]~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[26]~84_combout\ = (\U2|contador\(26) & (\U2|contador[25]~83\ $ (GND))) # (!\U2|contador\(26) & (!\U2|contador[25]~83\ & VCC))
-- \U2|contador[26]~85\ = CARRY((\U2|contador\(26) & !\U2|contador[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(26),
	datad => VCC,
	cin => \U2|contador[25]~83\,
	combout => \U2|contador[26]~84_combout\,
	cout => \U2|contador[26]~85\);

-- Location: LCCOMB_X9_Y23_N22
\U2|contador[27]~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[27]~86_combout\ = (\U2|contador\(27) & (!\U2|contador[26]~85\)) # (!\U2|contador\(27) & ((\U2|contador[26]~85\) # (GND)))
-- \U2|contador[27]~87\ = CARRY((!\U2|contador[26]~85\) # (!\U2|contador\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(27),
	datad => VCC,
	cin => \U2|contador[26]~85\,
	combout => \U2|contador[27]~86_combout\,
	cout => \U2|contador[27]~87\);

-- Location: LCFF_X9_Y23_N23
\U2|contador[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[27]~86_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(27));

-- Location: LCCOMB_X9_Y23_N24
\U2|contador[28]~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[28]~88_combout\ = (\U2|contador\(28) & (\U2|contador[27]~87\ $ (GND))) # (!\U2|contador\(28) & (!\U2|contador[27]~87\ & VCC))
-- \U2|contador[28]~89\ = CARRY((\U2|contador\(28) & !\U2|contador[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(28),
	datad => VCC,
	cin => \U2|contador[27]~87\,
	combout => \U2|contador[28]~88_combout\,
	cout => \U2|contador[28]~89\);

-- Location: LCFF_X9_Y23_N25
\U2|contador[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[28]~88_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(28));

-- Location: LCCOMB_X9_Y23_N26
\U2|contador[29]~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|contador[29]~90_combout\ = (\U2|contador\(29) & (!\U2|contador[28]~89\)) # (!\U2|contador\(29) & ((\U2|contador[28]~89\) # (GND)))
-- \U2|contador[29]~91\ = CARRY((!\U2|contador[28]~89\) # (!\U2|contador\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U2|contador\(29),
	datad => VCC,
	cin => \U2|contador[28]~89\,
	combout => \U2|contador[29]~90_combout\,
	cout => \U2|contador[29]~91\);

-- Location: LCFF_X9_Y23_N27
\U2|contador[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[29]~90_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(29));

-- Location: LCFF_X9_Y23_N29
\U2|contador[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[30]~92_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(30));

-- Location: LCFF_X9_Y23_N17
\U2|contador[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[24]~80_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(24));

-- Location: LCFF_X9_Y23_N21
\U2|contador[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|contador[26]~84_combout\,
	aclr => \reset~clkctrl_outclk\,
	sclr => \sinal_iniciar_temporizador~0_combout\,
	ena => \U2|temporizador_concluido~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|contador\(26));

-- Location: LCCOMB_X8_Y24_N0
\U2|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~1_combout\ = (!\U2|contador\(27) & (!\U2|contador\(24) & (!\U2|contador\(26) & !\U2|contador\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(27),
	datab => \U2|contador\(24),
	datac => \U2|contador\(26),
	datad => \U2|contador\(25),
	combout => \U2|LessThan0~1_combout\);

-- Location: LCCOMB_X8_Y24_N10
\U2|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~2_combout\ = (!\U2|contador\(29) & (!\U2|contador\(28) & (!\U2|contador\(30) & \U2|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(29),
	datab => \U2|contador\(28),
	datac => \U2|contador\(30),
	datad => \U2|LessThan0~1_combout\,
	combout => \U2|LessThan0~2_combout\);

-- Location: LCCOMB_X8_Y24_N26
\U2|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|LessThan0~7_combout\ = (\U2|LessThan0~0_combout\ & (\U2|LessThan0~2_combout\ & ((!\U2|LessThan0~6_combout\) # (!\U2|LessThan0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|LessThan0~0_combout\,
	datab => \U2|LessThan0~3_combout\,
	datac => \U2|LessThan0~6_combout\,
	datad => \U2|LessThan0~2_combout\,
	combout => \U2|LessThan0~7_combout\);

-- Location: LCCOMB_X8_Y24_N12
\U2|temporizador_concluido~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|temporizador_concluido~0_combout\ = (\U2|contador\(31)) # ((\sinal_iniciar_temporizador~0_combout\) # (\U2|LessThan0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|contador\(31),
	datab => \sinal_iniciar_temporizador~0_combout\,
	datad => \U2|LessThan0~7_combout\,
	combout => \U2|temporizador_concluido~0_combout\);

-- Location: LCCOMB_X8_Y24_N14
\U2|temporizador_concluido~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \U2|temporizador_concluido~1_combout\ = !\U2|temporizador_concluido~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U2|temporizador_concluido~0_combout\,
	combout => \U2|temporizador_concluido~1_combout\);

-- Location: LCFF_X8_Y24_N15
\U2|temporizador_concluido\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \U2|temporizador_concluido~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U2|temporizador_concluido~regout\);

-- Location: LCCOMB_X8_Y24_N4
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!estado_atual(2) & (estado_atual(1) $ (((\U2|temporizador_concluido~regout\ & estado_atual(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_atual(2),
	datab => \U2|temporizador_concluido~regout\,
	datac => estado_atual(1),
	datad => estado_atual(0),
	combout => \Mux1~0_combout\);

-- Location: LCFF_X8_Y24_N5
\estado_atual[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux1~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => estado_atual(1));

-- Location: LCCOMB_X7_Y26_N2
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (estado_atual(2) & (!estado_atual(1) & ((\iniciar~combout\) # (!estado_atual(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iniciar~combout\,
	datab => estado_atual(2),
	datac => estado_atual(1),
	datad => estado_atual(0),
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X7_Y26_N28
\Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux0~0_combout\) # ((\ctrl_valvula_agua~0_combout\ & (estado_atual(1) & \U2|temporizador_concluido~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl_valvula_agua~0_combout\,
	datab => \Mux0~0_combout\,
	datac => estado_atual(1),
	datad => \U2|temporizador_concluido~regout\,
	combout => \Mux0~1_combout\);

-- Location: LCFF_X7_Y26_N29
\estado_atual[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Mux0~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => estado_atual(2));

-- Location: LCCOMB_X8_Y24_N16
\status_led[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \status_led[0]~0_combout\ = (!estado_atual(0) & ((!estado_atual(1)) # (!estado_atual(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_atual(2),
	datab => estado_atual(1),
	datad => estado_atual(0),
	combout => \status_led[0]~0_combout\);

-- Location: LCCOMB_X7_Y26_N20
\status_led[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \status_led[1]~1_combout\ = (estado_atual(1) & ((estado_atual(2)) # (estado_atual(0)))) # (!estado_atual(1) & ((!estado_atual(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => estado_atual(2),
	datac => estado_atual(1),
	datad => estado_atual(0),
	combout => \status_led[1]~1_combout\);

-- Location: LCCOMB_X7_Y26_N18
\status_led[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \status_led[2]~2_combout\ = (estado_atual(2) & (!estado_atual(1))) # (!estado_atual(2) & (estado_atual(1) & estado_atual(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => estado_atual(2),
	datac => estado_atual(1),
	datad => estado_atual(0),
	combout => \status_led[2]~2_combout\);

-- Location: LCCOMB_X8_Y24_N30
\ctrl_motor~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl_motor~0_combout\ = (!estado_atual(0) & (estado_atual(2) $ (estado_atual(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_atual(2),
	datab => estado_atual(1),
	datad => estado_atual(0),
	combout => \ctrl_motor~0_combout\);

-- Location: LCCOMB_X7_Y26_N8
\ctrl_valvula_agua~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl_valvula_agua~0_combout\ = (!estado_atual(2) & estado_atual(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => estado_atual(2),
	datad => estado_atual(0),
	combout => \ctrl_valvula_agua~0_combout\);

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\saida_led[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \status_led[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_saida_led(0));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\saida_led[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_status_led[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_saida_led(1));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\saida_led[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \status_led[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_saida_led(2));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sinal_motor~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ctrl_motor~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sinal_motor);

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sinal_valvula_agua~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ctrl_valvula_agua~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sinal_valvula_agua);
END structure;


