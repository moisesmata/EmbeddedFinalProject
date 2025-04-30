-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 21.1 (Release Build #842)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2021 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from AddSub_0002
-- VHDL created on Wed Apr 30 13:59:14 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity AddSub_0002 is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        b : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        s : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end AddSub_0002;

architecture normal of AddSub_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal expFracY_uid7_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid8_fpFusedAddSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal siga_uid9_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal siga_uid9_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal sigb_uid10_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sigb_uid10_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cstAllOWE_uid11_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid12_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid13_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal exp_siga_uid14_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_siga_uid14_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_siga_uid15_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_siga_uid15_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_siga_uid9_uid16_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid19_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid19_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_siga_uid20_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_siga_uid20_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_siga_uid21_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid22_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid23_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_siga_uid24_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_sigb_uid28_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_sigb_uid28_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_sigb_uid29_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_sigb_uid29_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_sigb_uid10_uid30_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid31_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid31_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid33_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_sigb_uid34_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_sigb_uid34_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_sigb_uid35_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_sigb_uid35_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid36_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid37_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_sigb_uid38_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_sigb_uid38_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid43_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid44_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid45_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid45_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid48_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal cWFP1_uid49_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid51_fpFusedAddSubTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftOutConst_uid52_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpBShiftRange_uid53_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpBShiftRange_uid53_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid54_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValue_uid54_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal oFracB_uid56_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracA_uid57_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal padConst_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightPaddedIn_uid60_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal sticky_uid65_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracB_uid67_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (55 downto 0);
    signal zv_uid68_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracAOp_uid69_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBOp_uid70_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (57 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResSub_uid71_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResAdd_uid72_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (58 downto 0);
    signal fracResSubNoSignExt_uid73_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal fracResSubNoSignExt_uid73_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal fracResAddNoSignExt_uid74_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (56 downto 0);
    signal fracResAddNoSignExt_uid74_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal cAmA_uid79_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aMinusA_uid80_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid81_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormSub_uid82_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNormAdd_uid83_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal fracPostNormSubRndRange_uid84_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracRSub_uid85_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (65 downto 0);
    signal fracPostNormAddRndRange_uid86_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracRAdd_uid87_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (65 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_sub_uid88_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_sub_uid89_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_sub_uid89_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_sub_uid90_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_sub_uid90_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_sub_uid91_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_sub_uid91_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_sub_uid92_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_sub_uid92_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_sub_uid93_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_sub_uid94_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_sub_uid95_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_sub_uid95_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_sub_uid96_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (66 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (66 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (66 downto 0);
    signal expFracRSubPostRound_uid97_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky0_add_uid98_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky1_add_uid99_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal sticky1_add_uid99_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_add_uid100_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_add_uid100_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_add_uid101_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_add_uid101_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_add_uid102_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_add_uid102_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_add_uid103_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_add_uid105_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_add_uid105_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_add_uid106_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (66 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (66 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (66 downto 0);
    signal expFracRAddPostRound_uid107_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal wEP2AllOwE_uid108_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rndExp_uid109_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExp_uid109_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rOvf_uid110_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid110_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signedExp_uid111_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal signedExp_uid111_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal rUdf_uid112_fpFusedAddSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExcSub_uid113_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcSub_uid113_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcSub_uid114_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expRPreExcSub_uid114_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExcAdd_uid116_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcAdd_uid116_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcAdd_uid117_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expRPreExcAdd_uid117_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal regInputs_uid119_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid119_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid120_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRZeroAdd_uid121_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroSub_uid122_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid123_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInf_uid124_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInfOrZero_uid125_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInfOrZero_uid125_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addIsAlsoInf_uid126_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid127_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInfAdd_uid128_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfAddFull_uid129_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfAddFull_uid129_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSub_uid130_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSubFull_uid131_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSubFull_uid131_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infMinf_uid132_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaNA_uid133_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invEffSub_uid134_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal infPinfForSub_uid135_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaNS_uid136_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExcSub_uid137_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal concExcAdd_uid138_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREncSub_uid139_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal excREncAdd_uid140_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPreExcAddition_uid141_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExcAddition_uid141_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcAddition_uid142_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExcAddition_uid142_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcSubtraction_uid144_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExcSubtraction_uid144_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal oneFracRPostExc2_uid145_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExcAdd_uid148_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExcAdd_uid148_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExcAdd_uid152_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExcAdd_uid152_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invXGTEy_uid153_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigA_uid154_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroSwap_uid155_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigB_uid157_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aMa_uid160_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAMA_uid161_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaNA_uid162_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid163_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid163_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSum_uid164_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fracRPostExcSub_uid168_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExcSub_uid168_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExcSub_uid172_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExcSub_uid172_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal positiveExc_uid173_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invPositiveExc_uid174_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signInputsZeroForSub_uid175_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid177_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigY_uid178_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yGTxYPos_uid180_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigX_uid181_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xGTyXNeg_uid182_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub0_uid183_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub0_uid183_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaNS_uid184_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub_uid185_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExcSub_uid185_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RDiff_uid186_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal eq0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid268_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid271_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid274_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid280_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid283_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid286_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid289_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid295_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid298_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid301_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid307_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid310_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid313_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid316_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid319_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid322_fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng16_uid325_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (90 downto 0);
    signal rightShiftStage0Idx1_uid327_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx2Rng32_uid328_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (74 downto 0);
    signal rightShiftStage0Idx2_uid330_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx3Rng48_uid331_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage0Idx3Pad48_uid332_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid333_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx1Rng4_uid336_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (102 downto 0);
    signal rightShiftStage1Idx1_uid338_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx2Rng8_uid339_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (98 downto 0);
    signal rightShiftStage1Idx2_uid341_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx3Rng12_uid342_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (94 downto 0);
    signal rightShiftStage1Idx3Pad12_uid343_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid344_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx1Rng1_uid347_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage2Idx1_uid349_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx2Rng2_uid350_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (104 downto 0);
    signal rightShiftStage2Idx2_uid352_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx3Rng3_uid353_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (103 downto 0);
    signal rightShiftStage2Idx3_uid355_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal eq0_uid361_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid364_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid367_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid370_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid373_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid376_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid379_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid382_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid385_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid393_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid396_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid399_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid404_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid407_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid410_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid415_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid418_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid421_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid429_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid432_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid435_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid440_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid443_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid446_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid451_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid454_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid457_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (54 downto 0);
    signal redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist1_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist10_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist11_and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist13_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist17_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist19_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist23_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_signRPostExcSub_uid185_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_signRPostExcSub0_uid183_fpFusedAddSubTest_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_signRPostExc_uid163_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_invXGTEy_uid153_fpFusedAddSubTest_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist29_expRPreExcAddition_uid142_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist30_excRNaNS_uid136_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_excRNaNA_uid133_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist33_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist34_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist35_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist36_aMinusA_uid80_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist41_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist42_effSub_uid45_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_effSub_uid45_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_sigB_uid44_fpFusedAddSubTest_b_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_sigB_uid44_fpFusedAddSubTest_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_sigA_uid43_fpFusedAddSubTest_b_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_sigA_uid43_fpFusedAddSubTest_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excR_sigb_uid38_fpFusedAddSubTest_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_InvExpXIsZero_uid37_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_excN_sigb_uid35_fpFusedAddSubTest_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_excI_sigb_uid34_fpFusedAddSubTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist59_excR_siga_uid24_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_excI_siga_uid20_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_expXIsMax_uid17_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_xGTEy_uid8_fpFusedAddSubTest_n_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_xIn_a_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist68_xIn_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_inputreg_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_inputreg_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_inputreg_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_inputreg_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_inputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_reset0 : std_logic;
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_i : signal is true;
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_q : signal is true;
    signal redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_reset0 : std_logic;
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i : signal is true;
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_eq : std_logic;
    attribute preserve of redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_eq : signal is true;
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_q : signal is true;
    signal redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist68_xIn_b_1(DELAY,544)
    redist68_xIn_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => b, xout => redist68_xIn_b_1_q, clk => clk, aclr => areset );

    -- redist67_xIn_a_1(DELAY,543)
    redist67_xIn_a_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => a, xout => redist67_xIn_a_1_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpFusedAddSubTest(BITSELECT,6)@0
    expFracY_uid7_fpFusedAddSubTest_b <= b(62 downto 0);

    -- expFracX_uid6_fpFusedAddSubTest(BITSELECT,5)@0
    expFracX_uid6_fpFusedAddSubTest_b <= a(62 downto 0);

    -- xGTEy_uid8_fpFusedAddSubTest(COMPARE,7)@0 + 1
    xGTEy_uid8_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpFusedAddSubTest_b);
    xGTEy_uid8_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpFusedAddSubTest_b);
    xGTEy_uid8_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xGTEy_uid8_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    xGTEy_uid8_fpFusedAddSubTest_n(0) <= not (xGTEy_uid8_fpFusedAddSubTest_o(64));

    -- sigb_uid10_fpFusedAddSubTest(MUX,9)@1 + 1
    sigb_uid10_fpFusedAddSubTest_s <= xGTEy_uid8_fpFusedAddSubTest_n;
    sigb_uid10_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sigb_uid10_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sigb_uid10_fpFusedAddSubTest_s) IS
                WHEN "0" => sigb_uid10_fpFusedAddSubTest_q <= redist67_xIn_a_1_q;
                WHEN "1" => sigb_uid10_fpFusedAddSubTest_q <= redist68_xIn_b_1_q;
                WHEN OTHERS => sigb_uid10_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- sigB_uid44_fpFusedAddSubTest(BITSELECT,43)@2
    sigB_uid44_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sigb_uid10_fpFusedAddSubTest_q(63 downto 63));

    -- redist44_sigB_uid44_fpFusedAddSubTest_b_13(DELAY,520)
    redist44_sigB_uid44_fpFusedAddSubTest_b_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid44_fpFusedAddSubTest_b, xout => redist44_sigB_uid44_fpFusedAddSubTest_b_13_q, clk => clk, aclr => areset );

    -- redist45_sigB_uid44_fpFusedAddSubTest_b_14(DELAY,521)
    redist45_sigB_uid44_fpFusedAddSubTest_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist44_sigB_uid44_fpFusedAddSubTest_b_13_q, xout => redist45_sigB_uid44_fpFusedAddSubTest_b_14_q, clk => clk, aclr => areset );

    -- siga_uid9_fpFusedAddSubTest(MUX,8)@1 + 1
    siga_uid9_fpFusedAddSubTest_s <= xGTEy_uid8_fpFusedAddSubTest_n;
    siga_uid9_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            siga_uid9_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (siga_uid9_fpFusedAddSubTest_s) IS
                WHEN "0" => siga_uid9_fpFusedAddSubTest_q <= redist68_xIn_b_1_q;
                WHEN "1" => siga_uid9_fpFusedAddSubTest_q <= redist67_xIn_a_1_q;
                WHEN OTHERS => siga_uid9_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- sigA_uid43_fpFusedAddSubTest(BITSELECT,42)@2
    sigA_uid43_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(siga_uid9_fpFusedAddSubTest_q(63 downto 63));

    -- redist46_sigA_uid43_fpFusedAddSubTest_b_13(DELAY,522)
    redist46_sigA_uid43_fpFusedAddSubTest_b_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid43_fpFusedAddSubTest_b, xout => redist46_sigA_uid43_fpFusedAddSubTest_b_13_q, clk => clk, aclr => areset );

    -- redist47_sigA_uid43_fpFusedAddSubTest_b_14(DELAY,523)
    redist47_sigA_uid43_fpFusedAddSubTest_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist46_sigA_uid43_fpFusedAddSubTest_b_13_q, xout => redist47_sigA_uid43_fpFusedAddSubTest_b_14_q, clk => clk, aclr => areset );

    -- cAmA_uid79_fpFusedAddSubTest(CONSTANT,78)
    cAmA_uid79_fpFusedAddSubTest_q <= "111001";

    -- zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,188)
    zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00000000000000000000000000000000";

    -- zv_uid68_fpFusedAddSubTest(CONSTANT,67)
    zv_uid68_fpFusedAddSubTest_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid353_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,352)@6
    rightShiftStage2Idx3Rng3_uid353_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 3);

    -- rightShiftStage2Idx3_uid355_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,354)@6
    rightShiftStage2Idx3_uid355_alignmentShifter_uid59_fpFusedAddSubTest_q <= zv_uid68_fpFusedAddSubTest_q & rightShiftStage2Idx3Rng3_uid353_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,214)
    zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00";

    -- rightShiftStage2Idx2Rng2_uid350_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,349)@6
    rightShiftStage2Idx2Rng2_uid350_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 2);

    -- rightShiftStage2Idx2_uid352_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,351)@6
    rightShiftStage2Idx2_uid352_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage2Idx2Rng2_uid350_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage2Idx1Rng1_uid347_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,346)@6
    rightShiftStage2Idx1Rng1_uid347_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 1);

    -- rightShiftStage2Idx1_uid349_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,348)@6
    rightShiftStage2Idx1_uid349_alignmentShifter_uid59_fpFusedAddSubTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid347_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage1Idx3Pad12_uid343_alignmentShifter_uid59_fpFusedAddSubTest(CONSTANT,342)
    rightShiftStage1Idx3Pad12_uid343_alignmentShifter_uid59_fpFusedAddSubTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid342_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,341)@5
    rightShiftStage1Idx3Rng12_uid342_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 12);

    -- rightShiftStage1Idx3_uid344_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,343)@5
    rightShiftStage1Idx3_uid344_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx3Pad12_uid343_alignmentShifter_uid59_fpFusedAddSubTest_q & rightShiftStage1Idx3Rng12_uid342_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,202)
    zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid339_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,338)@5
    rightShiftStage1Idx2Rng8_uid339_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 8);

    -- rightShiftStage1Idx2_uid341_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,340)@5
    rightShiftStage1Idx2_uid341_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage1Idx2Rng8_uid339_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,208)
    zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid336_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,335)@5
    rightShiftStage1Idx1Rng4_uid336_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 4);

    -- rightShiftStage1Idx1_uid338_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,337)@5
    rightShiftStage1Idx1_uid338_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage1Idx1Rng4_uid336_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage0Idx3Pad48_uid332_alignmentShifter_uid59_fpFusedAddSubTest(CONSTANT,331)
    rightShiftStage0Idx3Pad48_uid332_alignmentShifter_uid59_fpFusedAddSubTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid331_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,330)@4
    rightShiftStage0Idx3Rng48_uid331_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(106 downto 48);

    -- rightShiftStage0Idx3_uid333_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,332)@4
    rightShiftStage0Idx3_uid333_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx3Pad48_uid332_alignmentShifter_uid59_fpFusedAddSubTest_q & rightShiftStage0Idx3Rng48_uid331_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage0Idx2Rng32_uid328_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,327)@4
    rightShiftStage0Idx2Rng32_uid328_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(106 downto 32);

    -- rightShiftStage0Idx2_uid330_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,329)@4
    rightShiftStage0Idx2_uid330_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage0Idx2Rng32_uid328_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,196)
    zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid325_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,324)@4
    rightShiftStage0Idx1Rng16_uid325_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(106 downto 16);

    -- rightShiftStage0Idx1_uid327_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,326)@4
    rightShiftStage0Idx1_uid327_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage0Idx1Rng16_uid325_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- cstAllZWE_uid13_fpFusedAddSubTest(CONSTANT,12)
    cstAllZWE_uid13_fpFusedAddSubTest_q <= "00000000000";

    -- exp_sigb_uid28_fpFusedAddSubTest(BITSELECT,27)@2
    exp_sigb_uid28_fpFusedAddSubTest_in <= sigb_uid10_fpFusedAddSubTest_q(62 downto 0);
    exp_sigb_uid28_fpFusedAddSubTest_b <= exp_sigb_uid28_fpFusedAddSubTest_in(62 downto 52);

    -- excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,29)@2 + 1
    excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= "1" WHEN exp_sigb_uid28_fpFusedAddSubTest_b = cstAllZWE_uid13_fpFusedAddSubTest_q ELSE "0";
    excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist54_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2(DELAY,530)
    redist54_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, xout => redist54_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid37_fpFusedAddSubTest(LOGICAL,36)@4
    InvExpXIsZero_uid37_fpFusedAddSubTest_q <= not (redist54_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q);

    -- frac_sigb_uid29_fpFusedAddSubTest(BITSELECT,28)@2
    frac_sigb_uid29_fpFusedAddSubTest_in <= sigb_uid10_fpFusedAddSubTest_q(51 downto 0);
    frac_sigb_uid29_fpFusedAddSubTest_b <= frac_sigb_uid29_fpFusedAddSubTest_in(51 downto 0);

    -- redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2(DELAY,534)
    redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_sigb_uid29_fpFusedAddSubTest_b, xout => redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q, clk => clk, aclr => areset );

    -- oFracB_uid56_fpFusedAddSubTest(BITJOIN,55)@4
    oFracB_uid56_fpFusedAddSubTest_q <= InvExpXIsZero_uid37_fpFusedAddSubTest_q & redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q;

    -- padConst_uid59_fpFusedAddSubTest(CONSTANT,58)
    padConst_uid59_fpFusedAddSubTest_q <= "000000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid60_fpFusedAddSubTest(BITJOIN,59)@4
    rightPaddedIn_uid60_fpFusedAddSubTest_q <= oFracB_uid56_fpFusedAddSubTest_q & padConst_uid59_fpFusedAddSubTest_q;

    -- shiftOutConst_uid52_fpFusedAddSubTest(CONSTANT,51)
    shiftOutConst_uid52_fpFusedAddSubTest_q <= "110110";

    -- exp_siga_uid14_fpFusedAddSubTest(BITSELECT,13)@2
    exp_siga_uid14_fpFusedAddSubTest_in <= siga_uid9_fpFusedAddSubTest_q(62 downto 0);
    exp_siga_uid14_fpFusedAddSubTest_b <= exp_siga_uid14_fpFusedAddSubTest_in(62 downto 52);

    -- expAmExpB_uid48_fpFusedAddSubTest(SUB,47)@2 + 1
    expAmExpB_uid48_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & exp_siga_uid14_fpFusedAddSubTest_b);
    expAmExpB_uid48_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0" & exp_sigb_uid28_fpFusedAddSubTest_b);
    expAmExpB_uid48_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmExpB_uid48_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmExpB_uid48_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_a) - UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expAmExpB_uid48_fpFusedAddSubTest_q <= expAmExpB_uid48_fpFusedAddSubTest_o(11 downto 0);

    -- expAmExpBShiftRange_uid53_fpFusedAddSubTest(BITSELECT,52)@3
    expAmExpBShiftRange_uid53_fpFusedAddSubTest_in <= expAmExpB_uid48_fpFusedAddSubTest_q(5 downto 0);
    expAmExpBShiftRange_uid53_fpFusedAddSubTest_b <= expAmExpBShiftRange_uid53_fpFusedAddSubTest_in(5 downto 0);

    -- redist41_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1(DELAY,517)
    redist41_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expAmExpBShiftRange_uid53_fpFusedAddSubTest_b, xout => redist41_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- cWFP1_uid49_fpFusedAddSubTest(CONSTANT,48)
    cWFP1_uid49_fpFusedAddSubTest_q <= "110101";

    -- shiftedOut_uid51_fpFusedAddSubTest(COMPARE,50)@3 + 1
    shiftedOut_uid51_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("00000000" & cWFP1_uid49_fpFusedAddSubTest_q);
    shiftedOut_uid51_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid48_fpFusedAddSubTest_q);
    shiftedOut_uid51_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid51_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid51_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_a) - UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    shiftedOut_uid51_fpFusedAddSubTest_c(0) <= shiftedOut_uid51_fpFusedAddSubTest_o(13);

    -- shiftValue_uid54_fpFusedAddSubTest(MUX,53)@4
    shiftValue_uid54_fpFusedAddSubTest_s <= shiftedOut_uid51_fpFusedAddSubTest_c;
    shiftValue_uid54_fpFusedAddSubTest_combproc: PROCESS (shiftValue_uid54_fpFusedAddSubTest_s, redist41_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q, shiftOutConst_uid52_fpFusedAddSubTest_q)
    BEGIN
        CASE (shiftValue_uid54_fpFusedAddSubTest_s) IS
            WHEN "0" => shiftValue_uid54_fpFusedAddSubTest_q <= redist41_expAmExpBShiftRange_uid53_fpFusedAddSubTest_b_1_q;
            WHEN "1" => shiftValue_uid54_fpFusedAddSubTest_q <= shiftOutConst_uid52_fpFusedAddSubTest_q;
            WHEN OTHERS => shiftValue_uid54_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select(BITSELECT,463)@4
    rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b <= shiftValue_uid54_fpFusedAddSubTest_q(5 downto 4);
    rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c <= shiftValue_uid54_fpFusedAddSubTest_q(3 downto 2);
    rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d <= shiftValue_uid54_fpFusedAddSubTest_q(1 downto 0);

    -- rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest(MUX,334)@4 + 1
    rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_s <= rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b;
    rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
                WHEN "00" => rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightPaddedIn_uid60_fpFusedAddSubTest_q;
                WHEN "01" => rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx1_uid327_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "10" => rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx2_uid330_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "11" => rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx3_uid333_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN OTHERS => rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist9_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,485)
    redist9_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c, xout => redist9_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest(MUX,345)@5 + 1
    rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_s <= redist9_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c_1_q;
    rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
                WHEN "00" => rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0_uid335_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "01" => rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx1_uid338_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "10" => rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx2_uid341_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "11" => rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx3_uid344_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN OTHERS => rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist10_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2(DELAY,486)
    redist10_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d, xout => redist10_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest(MUX,356)@6 + 1
    rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_s <= redist10_rightShiftStageSel5Dto4_uid334_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d_2_q;
    rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
                WHEN "00" => rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1_uid346_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "01" => rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage2Idx1_uid349_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "10" => rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage2Idx2_uid352_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "11" => rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage2Idx3_uid355_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN OTHERS => rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- stickyBits_uid62_fpFusedAddSubTest_merged_bit_select(BITSELECT,475)@7
    stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b <= rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q(51 downto 0);
    stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c <= rightShiftStage2_uid357_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 52);

    -- redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2(DELAY,476)
    redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 55, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c, xout => redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- cstZeroWF_uid12_fpFusedAddSubTest(CONSTANT,11)
    cstZeroWF_uid12_fpFusedAddSubTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,460)
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= cstZeroWF_uid12_fpFusedAddSubTest_q(5 downto 0);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= cstZeroWF_uid12_fpFusedAddSubTest_q(11 downto 6);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d <= cstZeroWF_uid12_fpFusedAddSubTest_q(17 downto 12);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e <= cstZeroWF_uid12_fpFusedAddSubTest_q(23 downto 18);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f <= cstZeroWF_uid12_fpFusedAddSubTest_q(29 downto 24);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g <= cstZeroWF_uid12_fpFusedAddSubTest_q(35 downto 30);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h <= cstZeroWF_uid12_fpFusedAddSubTest_q(41 downto 36);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i <= cstZeroWF_uid12_fpFusedAddSubTest_q(47 downto 42);
    c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j <= cstZeroWF_uid12_fpFusedAddSubTest_q(51 downto 48);

    -- z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select(BITSELECT,464)@7
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(5 downto 0);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(11 downto 6);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(17 downto 12);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_e <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(23 downto 18);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_f <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(29 downto 24);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_g <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(35 downto 30);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_h <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(41 downto 36);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_i <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(47 downto 42);
    z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_j <= stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b(51 downto 48);

    -- eq8_uid385_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,384)@7
    eq8_uid385_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_j = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j ELSE "0";

    -- eq7_uid382_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,381)@7
    eq7_uid382_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_i = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i ELSE "0";

    -- eq6_uid379_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,378)@7
    eq6_uid379_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_h = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,386)@7 + 1
    and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= eq6_uid379_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq7_uid382_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq8_uid385_cmpStickyWZero_uid64_fpFusedAddSubTest_q;
    and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq5_uid376_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,375)@7
    eq5_uid376_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_g = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g ELSE "0";

    -- eq4_uid373_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,372)@7
    eq4_uid373_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_f = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f ELSE "0";

    -- eq3_uid370_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,369)@7
    eq3_uid370_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_e = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e ELSE "0";

    -- eq2_uid367_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,366)@7
    eq2_uid367_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_d = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d ELSE "0";

    -- eq1_uid364_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,363)@7
    eq1_uid364_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_c = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";

    -- eq0_uid361_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,360)@7
    eq0_uid361_cmpStickyWZero_uid64_fpFusedAddSubTest_q <= "1" WHEN z0_uid359_cmpStickyWZero_uid64_fpFusedAddSubTest_merged_bit_select_b = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,385)@7 + 1
    and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= eq0_uid361_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq1_uid364_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq2_uid367_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq3_uid370_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq4_uid373_cmpStickyWZero_uid64_fpFusedAddSubTest_q and eq5_uid376_cmpStickyWZero_uid64_fpFusedAddSubTest_q;
    and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,387)@8 + 1
    and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= and_lev0_uid386_cmpStickyWZero_uid64_fpFusedAddSubTest_q and and_lev0_uid387_cmpStickyWZero_uid64_fpFusedAddSubTest_q;
    and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- sticky_uid65_fpFusedAddSubTest(LOGICAL,64)@9
    sticky_uid65_fpFusedAddSubTest_q <= not (and_lev1_uid388_cmpStickyWZero_uid64_fpFusedAddSubTest_q);

    -- alignFracB_uid67_fpFusedAddSubTest(BITJOIN,66)@9
    alignFracB_uid67_fpFusedAddSubTest_q <= redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_2_q & sticky_uid65_fpFusedAddSubTest_q;

    -- fracBOp_uid70_fpFusedAddSubTest(BITJOIN,69)@9
    fracBOp_uid70_fpFusedAddSubTest_q <= GND_q & GND_q & alignFracB_uid67_fpFusedAddSubTest_q;

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_notEnable(LOGICAL,559)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_nor(LOGICAL,560)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_nor_q <= not (redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_notEnable_q or redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_q);

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_last(CONSTANT,556)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_last_q <= "010";

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp(LOGICAL,557)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp_b <= STD_LOGIC_VECTOR("0" & redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_q);
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp_q <= "1" WHEN redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_last_q = redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp_b ELSE "0";

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmpReg(REG,558)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmp_q);
        END IF;
    END PROCESS;

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena(REG,561)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_nor_q = "1") THEN
                redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_enaAnd(LOGICAL,562)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_enaAnd_q <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_sticky_ena_q and VCC_q;

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt(COUNTER,554)
    -- low=0, high=3, step=1, init=0
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_i <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_i, 2)));

    -- frac_siga_uid15_fpFusedAddSubTest(BITSELECT,14)@2
    frac_siga_uid15_fpFusedAddSubTest_in <= siga_uid9_fpFusedAddSubTest_q(51 downto 0);
    frac_siga_uid15_fpFusedAddSubTest_b <= frac_siga_uid15_fpFusedAddSubTest_in(51 downto 0);

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_inputreg(DELAY,551)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_siga_uid15_fpFusedAddSubTest_b, xout => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_inputreg_q, clk => clk, aclr => areset );

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_wraddr(REG,555)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_wraddr_q <= "11";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem(DUALMEM,553)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_ia <= STD_LOGIC_VECTOR(redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_inputreg_q);
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_aa <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_wraddr_q;
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_ab <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_rdcnt_q;
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_reset0 <= areset;
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 52,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_aa,
        data_a => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_ab,
        q_b => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_iq
    );
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_q <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_iq(51 downto 0);

    -- redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg(DELAY,552)
    redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_mem_q, xout => redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q, clk => clk, aclr => areset );

    -- oFracA_uid57_fpFusedAddSubTest(BITJOIN,56)@9
    oFracA_uid57_fpFusedAddSubTest_q <= VCC_q & redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q;

    -- fracAOp_uid69_fpFusedAddSubTest(BITJOIN,68)@9
    fracAOp_uid69_fpFusedAddSubTest_q <= oFracA_uid57_fpFusedAddSubTest_q & zv_uid68_fpFusedAddSubTest_q;

    -- fracResSub_uid71_fpFusedAddSubTest(SUB,70)@9
    fracResSub_uid71_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("000" & fracAOp_uid69_fpFusedAddSubTest_q);
    fracResSub_uid71_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0" & fracBOp_uid70_fpFusedAddSubTest_q);
    fracResSub_uid71_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_b));
    fracResSub_uid71_fpFusedAddSubTest_q <= fracResSub_uid71_fpFusedAddSubTest_o(58 downto 0);

    -- fracResSubNoSignExt_uid73_fpFusedAddSubTest(BITSELECT,72)@9
    fracResSubNoSignExt_uid73_fpFusedAddSubTest_in <= fracResSub_uid71_fpFusedAddSubTest_q(56 downto 0);
    fracResSubNoSignExt_uid73_fpFusedAddSubTest_b <= fracResSubNoSignExt_uid73_fpFusedAddSubTest_in(56 downto 0);

    -- redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1(DELAY,515)
    redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSubNoSignExt_uid73_fpFusedAddSubTest_b, xout => redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,189)@10
    rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b <= redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q(56 downto 25);

    -- vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,190)@10
    vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b = zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist23_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_4(DELAY,499)
    redist23_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist23_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,192)@10
    vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in <= redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q(24 downto 0);
    vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b <= vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in(24 downto 0);

    -- mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,191)
    mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1111111";

    -- cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest(BITJOIN,193)@10
    cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q <= vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b & mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest(MUX,195)@10 + 1
    vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b;
                WHEN "1" => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q;
                WHEN OTHERS => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,465)@11
    rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q(31 downto 16);
    rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q(15 downto 0);

    -- vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,198)@11
    vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist21_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_3(DELAY,497)
    redist21_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist21_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest(MUX,201)@11 + 1
    vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b;
                WHEN "1" => vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,466)@12
    rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q(15 downto 8);
    rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q(7 downto 0);

    -- vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,204)@12
    vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist20_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,496)
    redist20_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist20_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest(MUX,207)@12 + 1
    vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b;
                WHEN "1" => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,467)@13
    rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q(7 downto 4);
    rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 0);

    -- vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,210)@13
    vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist19_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1(DELAY,495)
    redist19_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist19_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest(MUX,213)@13
    vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s, rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,468)@13
    rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 2);
    rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 0);

    -- vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,216)@13 + 1
    vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist8_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,484)
    redist8_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c, xout => redist8_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist7_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,483)
    redist7_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, xout => redist7_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest(MUX,219)@14
    vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s, redist7_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, redist8_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist7_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist8_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,221)@14
    rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest_b <= vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 1);

    -- vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,222)@14
    vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest_b = GND_q ELSE "0";

    -- r_uid224_lzCountValSub_uid75_fpFusedAddSubTest(BITJOIN,223)@14
    r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist23_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_4_q & redist21_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_3_q & redist20_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q & redist19_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q & vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q & vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist18_r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,494)
    redist18_r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist18_r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- aMinusA_uid80_fpFusedAddSubTest(LOGICAL,79)@16
    aMinusA_uid80_fpFusedAddSubTest_q <= "1" WHEN redist18_r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q = cAmA_uid79_fpFusedAddSubTest_q ELSE "0";

    -- cstAllOWE_uid11_fpFusedAddSubTest(CONSTANT,10)
    cstAllOWE_uid11_fpFusedAddSubTest_q <= "11111111111";

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_notEnable(LOGICAL,571)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_nor(LOGICAL,572)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_nor_q <= not (redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_notEnable_q or redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_q);

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_last(CONSTANT,568)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_last_q <= "01000";

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp(LOGICAL,569)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_q);
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp_q <= "1" WHEN redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_last_q = redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp_b ELSE "0";

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmpReg(REG,570)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmpReg_q <= STD_LOGIC_VECTOR(redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmp_q);
        END IF;
    END PROCESS;

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena(REG,573)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_nor_q = "1") THEN
                redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_enaAnd(LOGICAL,574)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_enaAnd_q <= redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_sticky_ena_q and VCC_q;

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt(COUNTER,566)
    -- low=0, high=9, step=1, init=0
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i = TO_UNSIGNED(8, 4)) THEN
                redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_eq <= '1';
            ELSE
                redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_eq <= '0';
            END IF;
            IF (redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_eq = '1') THEN
                redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i <= redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i + 7;
            ELSE
                redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i <= redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_i, 4)));

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_inputreg(DELAY,563)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_siga_uid14_fpFusedAddSubTest_b, xout => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_inputreg_q, clk => clk, aclr => areset );

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_wraddr(REG,567)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_wraddr_q <= "1001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_wraddr_q <= STD_LOGIC_VECTOR(redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem(DUALMEM,565)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_ia <= STD_LOGIC_VECTOR(redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_inputreg_q);
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_aa <= redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_wraddr_q;
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_ab <= redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_rdcnt_q;
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_reset0 <= areset;
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 10,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_reset0,
        clock1 => clk,
        address_a => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_aa,
        data_a => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_ab,
        q_b => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_iq
    );
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_q <= redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_iq(10 downto 0);

    -- redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg(DELAY,564)
    redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_mem_q, xout => redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg_q, clk => clk, aclr => areset );

    -- expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,16)@15
    expXIsMax_uid17_fpFusedAddSubTest_q <= "1" WHEN redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg_q = cstAllOWE_uid11_fpFusedAddSubTest_q ELSE "0";

    -- redist61_expXIsMax_uid17_fpFusedAddSubTest_q_1(DELAY,537)
    redist61_expXIsMax_uid17_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid17_fpFusedAddSubTest_q, xout => redist61_expXIsMax_uid17_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid22_fpFusedAddSubTest(LOGICAL,21)@16
    invExpXIsMax_uid22_fpFusedAddSubTest_q <= not (redist61_expXIsMax_uid17_fpFusedAddSubTest_q_1_q);

    -- excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,15)@15 + 1
    excZ_siga_uid9_uid16_fpFusedAddSubTest_qi <= "1" WHEN redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg_q = cstAllZWE_uid13_fpFusedAddSubTest_q ELSE "0";
    excZ_siga_uid9_uid16_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_siga_uid9_uid16_fpFusedAddSubTest_qi, xout => excZ_siga_uid9_uid16_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid23_fpFusedAddSubTest(LOGICAL,22)@16
    InvExpXIsZero_uid23_fpFusedAddSubTest_q <= not (excZ_siga_uid9_uid16_fpFusedAddSubTest_q);

    -- excR_siga_uid24_fpFusedAddSubTest(LOGICAL,23)@16
    excR_siga_uid24_fpFusedAddSubTest_q <= InvExpXIsZero_uid23_fpFusedAddSubTest_q and invExpXIsMax_uid22_fpFusedAddSubTest_q;

    -- positiveExc_uid173_fpFusedAddSubTest(LOGICAL,172)@16
    positiveExc_uid173_fpFusedAddSubTest_q <= excR_siga_uid24_fpFusedAddSubTest_q and aMinusA_uid80_fpFusedAddSubTest_q and redist47_sigA_uid43_fpFusedAddSubTest_b_14_q and redist45_sigB_uid44_fpFusedAddSubTest_b_14_q;

    -- invPositiveExc_uid174_fpFusedAddSubTest(LOGICAL,173)@16
    invPositiveExc_uid174_fpFusedAddSubTest_q <= not (positiveExc_uid173_fpFusedAddSubTest_q);

    -- redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14(DELAY,531)
    redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist54_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_2_q, xout => redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14_q, clk => clk, aclr => areset );

    -- signInputsZeroForSub_uid175_fpFusedAddSubTest(LOGICAL,174)@16
    signInputsZeroForSub_uid175_fpFusedAddSubTest_q <= excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14_q and redist47_sigA_uid43_fpFusedAddSubTest_b_14_q and redist45_sigB_uid44_fpFusedAddSubTest_b_14_q;

    -- invSignInputsZeroForSub_uid176_fpFusedAddSubTest(LOGICAL,175)@16
    invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q <= not (signInputsZeroForSub_uid175_fpFusedAddSubTest_q);

    -- sigY_uid177_fpFusedAddSubTest(BITSELECT,176)@1
    sigY_uid177_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(redist68_xIn_b_1_q(63 downto 63));

    -- invSigY_uid178_fpFusedAddSubTest(LOGICAL,177)@1
    invSigY_uid178_fpFusedAddSubTest_q <= not (sigY_uid177_fpFusedAddSubTest_b);

    -- invXGTEy_uid153_fpFusedAddSubTest(LOGICAL,152)@1
    invXGTEy_uid153_fpFusedAddSubTest_q <= not (xGTEy_uid8_fpFusedAddSubTest_n);

    -- yGTxYPos_uid180_fpFusedAddSubTest(LOGICAL,179)@1
    yGTxYPos_uid180_fpFusedAddSubTest_q <= invXGTEy_uid153_fpFusedAddSubTest_q and invSigY_uid178_fpFusedAddSubTest_q;

    -- sigX_uid181_fpFusedAddSubTest(BITSELECT,180)@1
    sigX_uid181_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(redist67_xIn_a_1_q(63 downto 63));

    -- xGTyXNeg_uid182_fpFusedAddSubTest(LOGICAL,181)@1
    xGTyXNeg_uid182_fpFusedAddSubTest_q <= xGTEy_uid8_fpFusedAddSubTest_n and sigX_uid181_fpFusedAddSubTest_b;

    -- signRPostExcSub0_uid183_fpFusedAddSubTest(LOGICAL,182)@1 + 1
    signRPostExcSub0_uid183_fpFusedAddSubTest_qi <= xGTyXNeg_uid182_fpFusedAddSubTest_q or yGTxYPos_uid180_fpFusedAddSubTest_q;
    signRPostExcSub0_uid183_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub0_uid183_fpFusedAddSubTest_qi, xout => signRPostExcSub0_uid183_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist25_signRPostExcSub0_uid183_fpFusedAddSubTest_q_15(DELAY,501)
    redist25_signRPostExcSub0_uid183_fpFusedAddSubTest_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub0_uid183_fpFusedAddSubTest_q, xout => redist25_signRPostExcSub0_uid183_fpFusedAddSubTest_q_15_q, clk => clk, aclr => areset );

    -- z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select(BITSELECT,462)@4
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(5 downto 0);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(11 downto 6);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(17 downto 12);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_e <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(23 downto 18);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_f <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(29 downto 24);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_g <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(35 downto 30);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_h <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(41 downto 36);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_i <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(47 downto 42);
    z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_j <= redist58_frac_sigb_uid29_fpFusedAddSubTest_b_2_q(51 downto 48);

    -- eq8_uid319_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,318)@4
    eq8_uid319_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_j = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j ELSE "0";

    -- eq7_uid316_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,315)@4
    eq7_uid316_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_i = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i ELSE "0";

    -- eq6_uid313_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,312)@4
    eq6_uid313_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_h = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,320)@4 + 1
    and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_qi <= eq6_uid313_fracXIsZero_uid32_fpFusedAddSubTest_q and eq7_uid316_fracXIsZero_uid32_fpFusedAddSubTest_q and eq8_uid319_fracXIsZero_uid32_fpFusedAddSubTest_q;
    and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq5_uid310_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,309)@4
    eq5_uid310_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_g = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g ELSE "0";

    -- eq4_uid307_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,306)@4
    eq4_uid307_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_f = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f ELSE "0";

    -- eq3_uid304_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,303)@4
    eq3_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_e = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e ELSE "0";

    -- eq2_uid301_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,300)@4
    eq2_uid301_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_d = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d ELSE "0";

    -- eq1_uid298_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,297)@4
    eq1_uid298_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_c = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";

    -- eq0_uid295_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,294)@4
    eq0_uid295_fracXIsZero_uid32_fpFusedAddSubTest_q <= "1" WHEN z0_uid293_fracXIsZero_uid32_fpFusedAddSubTest_merged_bit_select_b = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,319)@4 + 1
    and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_qi <= eq0_uid295_fracXIsZero_uid32_fpFusedAddSubTest_q and eq1_uid298_fracXIsZero_uid32_fpFusedAddSubTest_q and eq2_uid301_fracXIsZero_uid32_fpFusedAddSubTest_q and eq3_uid304_fracXIsZero_uid32_fpFusedAddSubTest_q and eq4_uid307_fracXIsZero_uid32_fpFusedAddSubTest_q and eq5_uid310_fracXIsZero_uid32_fpFusedAddSubTest_q;
    and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid322_fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,321)@5
    and_lev1_uid322_fracXIsZero_uid32_fpFusedAddSubTest_q <= and_lev0_uid320_fracXIsZero_uid32_fpFusedAddSubTest_q and and_lev0_uid321_fracXIsZero_uid32_fpFusedAddSubTest_q;

    -- fracXIsNotZero_uid33_fpFusedAddSubTest(LOGICAL,32)@5
    fracXIsNotZero_uid33_fpFusedAddSubTest_q <= not (and_lev1_uid322_fracXIsZero_uid32_fpFusedAddSubTest_q);

    -- expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,30)@2 + 1
    expXIsMax_uid31_fpFusedAddSubTest_qi <= "1" WHEN exp_sigb_uid28_fpFusedAddSubTest_b = cstAllOWE_uid11_fpFusedAddSubTest_q ELSE "0";
    expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid31_fpFusedAddSubTest_qi, xout => expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3(DELAY,529)
    redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid31_fpFusedAddSubTest_q, xout => redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- excN_sigb_uid35_fpFusedAddSubTest(LOGICAL,34)@5 + 1
    excN_sigb_uid35_fpFusedAddSubTest_qi <= redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3_q and fracXIsNotZero_uid33_fpFusedAddSubTest_q;
    excN_sigb_uid35_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_sigb_uid35_fpFusedAddSubTest_qi, xout => excN_sigb_uid35_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist50_excN_sigb_uid35_fpFusedAddSubTest_q_11(DELAY,526)
    redist50_excN_sigb_uid35_fpFusedAddSubTest_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_sigb_uid35_fpFusedAddSubTest_q, xout => redist50_excN_sigb_uid35_fpFusedAddSubTest_q_11_q, clk => clk, aclr => areset );

    -- z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select(BITSELECT,461)@9
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(5 downto 0);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(11 downto 6);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(17 downto 12);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(23 downto 18);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(29 downto 24);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(35 downto 30);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(41 downto 36);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(47 downto 42);
    z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j <= redist64_frac_siga_uid15_fpFusedAddSubTest_b_7_outputreg_q(51 downto 48);

    -- eq8_uid289_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,288)@9
    eq8_uid289_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_j ELSE "0";

    -- eq7_uid286_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,285)@9
    eq7_uid286_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_i ELSE "0";

    -- eq6_uid283_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,282)@9
    eq6_uid283_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,290)@9 + 1
    and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_qi <= eq6_uid283_fracXIsZero_uid18_fpFusedAddSubTest_q and eq7_uid286_fracXIsZero_uid18_fpFusedAddSubTest_q and eq8_uid289_fracXIsZero_uid18_fpFusedAddSubTest_q;
    and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- eq5_uid280_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,279)@9
    eq5_uid280_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_g ELSE "0";

    -- eq4_uid277_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,276)@9
    eq4_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_f ELSE "0";

    -- eq3_uid274_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,273)@9
    eq3_uid274_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_e ELSE "0";

    -- eq2_uid271_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,270)@9
    eq2_uid271_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_d ELSE "0";

    -- eq1_uid268_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,267)@9
    eq1_uid268_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_c ELSE "0";

    -- eq0_uid265_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,264)@9
    eq0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_q <= "1" WHEN z0_uid263_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b = c0_uid264_fracXIsZero_uid18_fpFusedAddSubTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,289)@9 + 1
    and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_qi <= eq0_uid265_fracXIsZero_uid18_fpFusedAddSubTest_q and eq1_uid268_fracXIsZero_uid18_fpFusedAddSubTest_q and eq2_uid271_fracXIsZero_uid18_fpFusedAddSubTest_q and eq3_uid274_fracXIsZero_uid18_fpFusedAddSubTest_q and eq4_uid277_fracXIsZero_uid18_fpFusedAddSubTest_q and eq5_uid280_fracXIsZero_uid18_fpFusedAddSubTest_q;
    and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,291)@10 + 1
    and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_qi <= and_lev0_uid290_fracXIsZero_uid18_fpFusedAddSubTest_q and and_lev0_uid291_fracXIsZero_uid18_fpFusedAddSubTest_q;
    and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist11_and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q_5(DELAY,487)
    redist11_and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q, xout => redist11_and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid19_fpFusedAddSubTest(LOGICAL,18)@15 + 1
    fracXIsNotZero_uid19_fpFusedAddSubTest_qi <= not (redist11_and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q_5_q);
    fracXIsNotZero_uid19_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsNotZero_uid19_fpFusedAddSubTest_qi, xout => fracXIsNotZero_uid19_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excN_siga_uid21_fpFusedAddSubTest(LOGICAL,20)@16
    excN_siga_uid21_fpFusedAddSubTest_q <= redist61_expXIsMax_uid17_fpFusedAddSubTest_q_1_q and fracXIsNotZero_uid19_fpFusedAddSubTest_q;

    -- effSub_uid45_fpFusedAddSubTest(LOGICAL,44)@15 + 1
    effSub_uid45_fpFusedAddSubTest_qi <= redist46_sigA_uid43_fpFusedAddSubTest_b_13_q xor redist44_sigB_uid44_fpFusedAddSubTest_b_13_q;
    effSub_uid45_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid45_fpFusedAddSubTest_qi, xout => effSub_uid45_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invEffSub_uid134_fpFusedAddSubTest(LOGICAL,133)@16
    invEffSub_uid134_fpFusedAddSubTest_q <= not (effSub_uid45_fpFusedAddSubTest_q);

    -- excI_sigb_uid34_fpFusedAddSubTest(LOGICAL,33)@5 + 1
    excI_sigb_uid34_fpFusedAddSubTest_qi <= redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3_q and and_lev1_uid322_fracXIsZero_uid32_fpFusedAddSubTest_q;
    excI_sigb_uid34_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_sigb_uid34_fpFusedAddSubTest_qi, xout => excI_sigb_uid34_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11(DELAY,527)
    redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_sigb_uid34_fpFusedAddSubTest_q, xout => redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11_q, clk => clk, aclr => areset );

    -- excI_siga_uid20_fpFusedAddSubTest(LOGICAL,19)@15 + 1
    excI_siga_uid20_fpFusedAddSubTest_qi <= expXIsMax_uid17_fpFusedAddSubTest_q and redist11_and_lev1_uid292_fracXIsZero_uid18_fpFusedAddSubTest_q_5_q;
    excI_siga_uid20_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_siga_uid20_fpFusedAddSubTest_qi, xout => excI_siga_uid20_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- infPinfForSub_uid135_fpFusedAddSubTest(LOGICAL,134)@16
    infPinfForSub_uid135_fpFusedAddSubTest_q <= excI_siga_uid20_fpFusedAddSubTest_q and redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11_q and invEffSub_uid134_fpFusedAddSubTest_q;

    -- excRNaNS_uid136_fpFusedAddSubTest(LOGICAL,135)@16
    excRNaNS_uid136_fpFusedAddSubTest_q <= infPinfForSub_uid135_fpFusedAddSubTest_q or excN_siga_uid21_fpFusedAddSubTest_q or redist50_excN_sigb_uid35_fpFusedAddSubTest_q_11_q;

    -- invExcRNaNS_uid184_fpFusedAddSubTest(LOGICAL,183)@16
    invExcRNaNS_uid184_fpFusedAddSubTest_q <= not (excRNaNS_uid136_fpFusedAddSubTest_q);

    -- signRPostExcSub_uid185_fpFusedAddSubTest(LOGICAL,184)@16 + 1
    signRPostExcSub_uid185_fpFusedAddSubTest_qi <= invExcRNaNS_uid184_fpFusedAddSubTest_q and redist25_signRPostExcSub0_uid183_fpFusedAddSubTest_q_15_q and invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q and invPositiveExc_uid174_fpFusedAddSubTest_q;
    signRPostExcSub_uid185_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub_uid185_fpFusedAddSubTest_qi, xout => signRPostExcSub_uid185_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist24_signRPostExcSub_uid185_fpFusedAddSubTest_q_4(DELAY,500)
    redist24_signRPostExcSub_uid185_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub_uid185_fpFusedAddSubTest_q, xout => redist24_signRPostExcSub_uid185_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- cRBit_sub_uid94_fpFusedAddSubTest(CONSTANT,93)
    cRBit_sub_uid94_fpFusedAddSubTest_q <= "01000";

    -- leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,455)@15
    leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest_in(53 downto 0);

    -- leftShiftStage2Idx3_uid457_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,456)@15
    leftShiftStage2Idx3_uid457_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx3Rng3_uid456_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zv_uid68_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,452)@15
    leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest_in(54 downto 0);

    -- leftShiftStage2Idx2_uid454_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,453)@15
    leftShiftStage2Idx2_uid454_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx2Rng2_uid453_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,449)@15
    leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest_in(55 downto 0);

    -- leftShiftStage2Idx1_uid451_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,450)@15
    leftShiftStage2Idx1_uid451_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx1Rng1_uid450_fracPostNormAdd_uid78_fpFusedAddSubTest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,444)@15
    leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest_in(44 downto 0);

    -- leftShiftStage1Idx3_uid446_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,445)@15
    leftShiftStage1Idx3_uid446_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx3Rng12_uid445_fracPostNormAdd_uid78_fpFusedAddSubTest_b & rightShiftStage1Idx3Pad12_uid343_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,441)@15
    leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest_in(48 downto 0);

    -- leftShiftStage1Idx2_uid443_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,442)@15
    leftShiftStage1Idx2_uid443_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx2Rng8_uid442_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,438)@15
    leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest_in(52 downto 0);

    -- leftShiftStage1Idx1_uid440_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,439)@15
    leftShiftStage1Idx1_uid440_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx1Rng4_uid439_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,433)@14
    leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest_in(8 downto 0);

    -- leftShiftStage0Idx3_uid435_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,434)@14
    leftShiftStage0Idx3_uid435_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx3Rng48_uid434_fracPostNormAdd_uid78_fpFusedAddSubTest_b & rightShiftStage0Idx3Pad48_uid332_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- fracResAdd_uid72_fpFusedAddSubTest(ADD,71)@9
    fracResAdd_uid72_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("000" & fracAOp_uid69_fpFusedAddSubTest_q);
    fracResAdd_uid72_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0" & fracBOp_uid70_fpFusedAddSubTest_q);
    fracResAdd_uid72_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_b));
    fracResAdd_uid72_fpFusedAddSubTest_q <= fracResAdd_uid72_fpFusedAddSubTest_o(58 downto 0);

    -- fracResAddNoSignExt_uid74_fpFusedAddSubTest(BITSELECT,73)@9
    fracResAddNoSignExt_uid74_fpFusedAddSubTest_in <= fracResAdd_uid72_fpFusedAddSubTest_q(56 downto 0);
    fracResAddNoSignExt_uid74_fpFusedAddSubTest_b <= fracResAddNoSignExt_uid74_fpFusedAddSubTest_in(56 downto 0);

    -- redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1(DELAY,513)
    redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAddNoSignExt_uid74_fpFusedAddSubTest_b, xout => redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,229)@10
    vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_in <= redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q(24 downto 0);
    vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b <= vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_in(24 downto 0);

    -- redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_inputreg(DELAY,545)
    redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_inputreg : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b, xout => redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_inputreg_q, clk => clk, aclr => areset );

    -- redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4(DELAY,492)
    redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4 : dspba_delay
    GENERIC MAP ( width => 25, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_inputreg_q, xout => redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid432_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,431)@14
    leftShiftStage0Idx2_uid432_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= redist16_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_4_q & zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,427)@14
    leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest_in(40 downto 0);

    -- leftShiftStage0Idx1_uid429_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,428)@14
    leftShiftStage0Idx1_uid429_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx1Rng16_uid428_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_inputreg(DELAY,547)
    redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_inputreg : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q, xout => redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_inputreg_q, clk => clk, aclr => areset );

    -- redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5(DELAY,514)
    redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5 : dspba_delay
    GENERIC MAP ( width => 57, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_inputreg_q, xout => redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_q, clk => clk, aclr => areset );

    -- redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg(DELAY,548)
    redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_q, xout => redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg_q, clk => clk, aclr => areset );

    -- rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,226)@10
    rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b <= redist37_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q(56 downto 25);

    -- vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,227)@10
    vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b = zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist17_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_4(DELAY,493)
    redist17_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist17_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest(BITJOIN,230)@10
    cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest_q <= vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b & mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,232)@10 + 1
    vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b;
                WHEN "1" => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest_q;
                WHEN OTHERS => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,470)@11
    rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q(31 downto 16);
    rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q(15 downto 0);

    -- vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,235)@11
    vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist15_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3(DELAY,491)
    redist15_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist15_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,238)@11 + 1
    vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b;
                WHEN "1" => vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,471)@12
    rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q(15 downto 8);
    rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q(7 downto 0);

    -- vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,241)@12
    vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist14_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_2(DELAY,490)
    redist14_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist14_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,244)@12 + 1
    vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
                WHEN "0" => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b;
                WHEN "1" => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,472)@13
    rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q(7 downto 4);
    rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 0);

    -- vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,247)@13
    vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist13_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1(DELAY,489)
    redist13_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist13_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,250)@13
    vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s, rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,473)@13
    rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 2);
    rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 0);

    -- vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,253)@13 + 1
    vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist4_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,480)
    redist4_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c, xout => redist4_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist3_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,479)
    redist3_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, xout => redist3_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,256)@14
    vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s, redist3_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, redist4_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist3_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist4_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,258)@14
    rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest_b <= vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 1);

    -- vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,259)@14
    vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest_b = GND_q ELSE "0";

    -- r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest(BITJOIN,260)@14
    r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist17_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_4_q & redist15_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_3_q & redist14_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q & redist13_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q & vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q & vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest_q;

    -- leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select(BITSELECT,474)@14
    leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b <= r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q(5 downto 4);
    leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c <= r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 2);
    leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d <= r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 0);

    -- leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,436)@14 + 1
    leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b;
    leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= redist38_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_5_outputreg_q;
                WHEN "01" => leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx1_uid429_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx2_uid432_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx3_uid435_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist1_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,477)
    redist1_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c, xout => redist1_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,447)@15
    leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= redist1_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_s, leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage1Idx1_uid440_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage1Idx2_uid443_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage1Idx3_uid446_fracPostNormAdd_uid78_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0_uid437_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "01" => leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx1_uid440_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx2_uid443_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx3_uid446_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_1(DELAY,478)
    redist2_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d, xout => redist2_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,458)@15 + 1
    leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= redist2_leftShiftStageSel5Dto4_uid436_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d_1_q;
    leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1_uid448_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "01" => leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx1_uid451_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx2_uid454_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx3_uid457_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- LSB_add_uid102_fpFusedAddSubTest(BITSELECT,101)@16
    LSB_add_uid102_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q(4 downto 0));
    LSB_add_uid102_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(LSB_add_uid102_fpFusedAddSubTest_in(4 downto 4));

    -- Guard_add_uid101_fpFusedAddSubTest(BITSELECT,100)@16
    Guard_add_uid101_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q(3 downto 0));
    Guard_add_uid101_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Guard_add_uid101_fpFusedAddSubTest_in(3 downto 3));

    -- Round_add_uid100_fpFusedAddSubTest(BITSELECT,99)@16
    Round_add_uid100_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q(2 downto 0));
    Round_add_uid100_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Round_add_uid100_fpFusedAddSubTest_in(2 downto 2));

    -- sticky1_add_uid99_fpFusedAddSubTest(BITSELECT,98)@16
    sticky1_add_uid99_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q(1 downto 0));
    sticky1_add_uid99_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sticky1_add_uid99_fpFusedAddSubTest_in(1 downto 1));

    -- sticky0_add_uid98_fpFusedAddSubTest(BITSELECT,97)@16
    sticky0_add_uid98_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q(0 downto 0));
    sticky0_add_uid98_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_in(0 downto 0));

    -- rndBitCond_add_uid103_fpFusedAddSubTest(BITJOIN,102)@16
    rndBitCond_add_uid103_fpFusedAddSubTest_q <= LSB_add_uid102_fpFusedAddSubTest_b & Guard_add_uid101_fpFusedAddSubTest_b & Round_add_uid100_fpFusedAddSubTest_b & sticky1_add_uid99_fpFusedAddSubTest_b & sticky0_add_uid98_fpFusedAddSubTest_b;

    -- rBi_add_uid105_fpFusedAddSubTest(LOGICAL,104)@16 + 1
    rBi_add_uid105_fpFusedAddSubTest_qi <= "1" WHEN rndBitCond_add_uid103_fpFusedAddSubTest_q = cRBit_sub_uid94_fpFusedAddSubTest_q ELSE "0";
    rBi_add_uid105_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_add_uid105_fpFusedAddSubTest_qi, xout => rBi_add_uid105_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- roundBit_add_uid106_fpFusedAddSubTest(LOGICAL,105)@17
    roundBit_add_uid106_fpFusedAddSubTest_q <= not (rBi_add_uid105_fpFusedAddSubTest_q);

    -- redist12_r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q_2(DELAY,488)
    redist12_r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist12_r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- expInc_uid81_fpFusedAddSubTest(ADD,80)@15 + 1
    expInc_uid81_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & redist65_exp_siga_uid14_fpFusedAddSubTest_b_13_outputreg_q);
    expInc_uid81_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
    expInc_uid81_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expInc_uid81_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expInc_uid81_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid81_fpFusedAddSubTest_a) + UNSIGNED(expInc_uid81_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expInc_uid81_fpFusedAddSubTest_q <= expInc_uid81_fpFusedAddSubTest_o(11 downto 0);

    -- expPostNormAdd_uid83_fpFusedAddSubTest(SUB,82)@16 + 1
    expPostNormAdd_uid83_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_q);
    expPostNormAdd_uid83_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0000000" & redist12_r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q);
    expPostNormAdd_uid83_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_a) - UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expPostNormAdd_uid83_fpFusedAddSubTest_q <= expPostNormAdd_uid83_fpFusedAddSubTest_o(12 downto 0);

    -- fracPostNormAddRndRange_uid86_fpFusedAddSubTest(BITSELECT,85)@16
    fracPostNormAddRndRange_uid86_fpFusedAddSubTest_in <= leftShiftStage2_uid459_fracPostNormAdd_uid78_fpFusedAddSubTest_q(55 downto 0);
    fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b <= fracPostNormAddRndRange_uid86_fpFusedAddSubTest_in(55 downto 3);

    -- redist34_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1(DELAY,510)
    redist34_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b, xout => redist34_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- expFracRAdd_uid87_fpFusedAddSubTest(BITJOIN,86)@17
    expFracRAdd_uid87_fpFusedAddSubTest_q <= expPostNormAdd_uid83_fpFusedAddSubTest_q & redist34_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1_q;

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest(ADD,106)@17 + 1
    expFracRAddPostRound_uid107_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expFracRAdd_uid87_fpFusedAddSubTest_q);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_add_uid106_fpFusedAddSubTest_q);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRAddPostRound_uid107_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expFracRAddPostRound_uid107_fpFusedAddSubTest_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_o(66 downto 0);

    -- expRPreExcAdd_uid117_fpFusedAddSubTest(BITSELECT,116)@18
    expRPreExcAdd_uid117_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_q(63 downto 0);
    expRPreExcAdd_uid117_fpFusedAddSubTest_b <= expRPreExcAdd_uid117_fpFusedAddSubTest_in(63 downto 53);

    -- leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,419)@15
    leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest_in(53 downto 0);

    -- leftShiftStage2Idx3_uid421_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,420)@15
    leftShiftStage2Idx3_uid421_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx3Rng3_uid420_fracPostNormSub_uid76_fpFusedAddSubTest_b & zv_uid68_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,416)@15
    leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest_in(54 downto 0);

    -- leftShiftStage2Idx2_uid418_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,417)@15
    leftShiftStage2Idx2_uid418_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx2Rng2_uid417_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,413)@15
    leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest_in(55 downto 0);

    -- leftShiftStage2Idx1_uid415_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,414)@15
    leftShiftStage2Idx1_uid415_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx1Rng1_uid414_fracPostNormSub_uid76_fpFusedAddSubTest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,408)@15
    leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest_in(44 downto 0);

    -- leftShiftStage1Idx3_uid410_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,409)@15
    leftShiftStage1Idx3_uid410_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx3Rng12_uid409_fracPostNormSub_uid76_fpFusedAddSubTest_b & rightShiftStage1Idx3Pad12_uid343_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,405)@15
    leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest_in(48 downto 0);

    -- leftShiftStage1Idx2_uid407_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,406)@15
    leftShiftStage1Idx2_uid407_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx2Rng8_uid406_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,402)@15
    leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest_in(52 downto 0);

    -- leftShiftStage1Idx1_uid404_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,403)@15
    leftShiftStage1Idx1_uid404_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx1Rng4_uid403_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,397)@14
    leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest_in <= redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest_in(8 downto 0);

    -- leftShiftStage0Idx3_uid399_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,398)@14
    leftShiftStage0Idx3_uid399_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx3Rng48_uid398_fracPostNormSub_uid76_fpFusedAddSubTest_b & rightShiftStage0Idx3Pad48_uid332_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_inputreg(DELAY,546)
    redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_inputreg : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b, xout => redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_inputreg_q, clk => clk, aclr => areset );

    -- redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4(DELAY,498)
    redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4 : dspba_delay
    GENERIC MAP ( width => 25, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_inputreg_q, xout => redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid396_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,395)@14
    leftShiftStage0Idx2_uid396_fracPostNormSub_uid76_fpFusedAddSubTest_q <= redist22_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_4_q & zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,391)@14
    leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest_in <= redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest_in(40 downto 0);

    -- leftShiftStage0Idx1_uid393_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,392)@14
    leftShiftStage0Idx1_uid393_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx1Rng16_uid392_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_inputreg(DELAY,549)
    redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_inputreg : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q, xout => redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_inputreg_q, clk => clk, aclr => areset );

    -- redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5(DELAY,516)
    redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5 : dspba_delay
    GENERIC MAP ( width => 57, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_inputreg_q, xout => redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_q, clk => clk, aclr => areset );

    -- redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg(DELAY,550)
    redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_q, xout => redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg_q, clk => clk, aclr => areset );

    -- leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select(BITSELECT,469)@14
    leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b <= r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q(5 downto 4);
    leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c <= r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 2);
    leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d <= r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 0);

    -- leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,400)@14 + 1
    leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b;
    leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q <= redist40_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_5_outputreg_q;
                WHEN "01" => leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx1_uid393_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx2_uid396_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx3_uid399_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,481)
    redist5_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c, xout => redist5_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,411)@15
    leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_s <= redist5_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_s, leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage1Idx1_uid404_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage1Idx2_uid407_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage1Idx3_uid410_fracPostNormSub_uid76_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0_uid401_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "01" => leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx1_uid404_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx2_uid407_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx3_uid410_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_1(DELAY,482)
    redist6_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d, xout => redist6_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,422)@15 + 1
    leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_s <= redist6_leftShiftStageSel5Dto4_uid400_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d_1_q;
    leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
                WHEN "00" => leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1_uid412_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "01" => leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx1_uid415_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "10" => leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx2_uid418_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN "11" => leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx3_uid421_fracPostNormSub_uid76_fpFusedAddSubTest_q;
                WHEN OTHERS => leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- LSB_sub_uid92_fpFusedAddSubTest(BITSELECT,91)@16
    LSB_sub_uid92_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q(4 downto 0));
    LSB_sub_uid92_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(LSB_sub_uid92_fpFusedAddSubTest_in(4 downto 4));

    -- Guard_sub_uid91_fpFusedAddSubTest(BITSELECT,90)@16
    Guard_sub_uid91_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q(3 downto 0));
    Guard_sub_uid91_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Guard_sub_uid91_fpFusedAddSubTest_in(3 downto 3));

    -- Round_sub_uid90_fpFusedAddSubTest(BITSELECT,89)@16
    Round_sub_uid90_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q(2 downto 0));
    Round_sub_uid90_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Round_sub_uid90_fpFusedAddSubTest_in(2 downto 2));

    -- Sticky1_sub_uid89_fpFusedAddSubTest(BITSELECT,88)@16
    Sticky1_sub_uid89_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q(1 downto 0));
    Sticky1_sub_uid89_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Sticky1_sub_uid89_fpFusedAddSubTest_in(1 downto 1));

    -- Sticky0_sub_uid88_fpFusedAddSubTest(BITSELECT,87)@16
    Sticky0_sub_uid88_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q(0 downto 0));
    Sticky0_sub_uid88_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_in(0 downto 0));

    -- rndBitCond_sub_uid93_fpFusedAddSubTest(BITJOIN,92)@16
    rndBitCond_sub_uid93_fpFusedAddSubTest_q <= LSB_sub_uid92_fpFusedAddSubTest_b & Guard_sub_uid91_fpFusedAddSubTest_b & Round_sub_uid90_fpFusedAddSubTest_b & Sticky1_sub_uid89_fpFusedAddSubTest_b & Sticky0_sub_uid88_fpFusedAddSubTest_b;

    -- rBi_sub_uid95_fpFusedAddSubTest(LOGICAL,94)@16 + 1
    rBi_sub_uid95_fpFusedAddSubTest_qi <= "1" WHEN rndBitCond_sub_uid93_fpFusedAddSubTest_q = cRBit_sub_uid94_fpFusedAddSubTest_q ELSE "0";
    rBi_sub_uid95_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_sub_uid95_fpFusedAddSubTest_qi, xout => rBi_sub_uid95_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- roundBit_sub_uid96_fpFusedAddSubTest(LOGICAL,95)@17
    roundBit_sub_uid96_fpFusedAddSubTest_q <= not (rBi_sub_uid95_fpFusedAddSubTest_q);

    -- expPostNormSub_uid82_fpFusedAddSubTest(SUB,81)@16 + 1
    expPostNormSub_uid82_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_q);
    expPostNormSub_uid82_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0000000" & redist18_r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q);
    expPostNormSub_uid82_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_a) - UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expPostNormSub_uid82_fpFusedAddSubTest_q <= expPostNormSub_uid82_fpFusedAddSubTest_o(12 downto 0);

    -- fracPostNormSubRndRange_uid84_fpFusedAddSubTest(BITSELECT,83)@16
    fracPostNormSubRndRange_uid84_fpFusedAddSubTest_in <= leftShiftStage2_uid423_fracPostNormSub_uid76_fpFusedAddSubTest_q(55 downto 0);
    fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b <= fracPostNormSubRndRange_uid84_fpFusedAddSubTest_in(55 downto 3);

    -- redist35_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1(DELAY,511)
    redist35_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b, xout => redist35_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- expFracRSub_uid85_fpFusedAddSubTest(BITJOIN,84)@17
    expFracRSub_uid85_fpFusedAddSubTest_q <= expPostNormSub_uid82_fpFusedAddSubTest_q & redist35_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1_q;

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest(ADD,96)@17 + 1
    expFracRSubPostRound_uid97_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expFracRSub_uid85_fpFusedAddSubTest_q);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_sub_uid96_fpFusedAddSubTest_q);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRSubPostRound_uid97_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expFracRSubPostRound_uid97_fpFusedAddSubTest_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_o(66 downto 0);

    -- expRPreExcSub_uid114_fpFusedAddSubTest(BITSELECT,113)@18
    expRPreExcSub_uid114_fpFusedAddSubTest_in <= expFracRSubPostRound_uid97_fpFusedAddSubTest_q(63 downto 0);
    expRPreExcSub_uid114_fpFusedAddSubTest_b <= expRPreExcSub_uid114_fpFusedAddSubTest_in(63 downto 53);

    -- redist42_effSub_uid45_fpFusedAddSubTest_q_3(DELAY,518)
    redist42_effSub_uid45_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid45_fpFusedAddSubTest_q, xout => redist42_effSub_uid45_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- expRPreExcSubtraction_uid144_fpFusedAddSubTest(MUX,143)@18 + 1
    expRPreExcSubtraction_uid144_fpFusedAddSubTest_s <= redist42_effSub_uid45_fpFusedAddSubTest_q_3_q;
    expRPreExcSubtraction_uid144_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPreExcSubtraction_uid144_fpFusedAddSubTest_s) IS
                WHEN "0" => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= expRPreExcSub_uid114_fpFusedAddSubTest_b;
                WHEN "1" => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= expRPreExcAdd_uid117_fpFusedAddSubTest_b;
                WHEN OTHERS => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist28_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_2(DELAY,504)
    redist28_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcSubtraction_uid144_fpFusedAddSubTest_q, xout => redist28_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist30_excRNaNS_uid136_fpFusedAddSubTest_q_4(DELAY,506)
    redist30_excRNaNS_uid136_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNS_uid136_fpFusedAddSubTest_q, xout => redist30_excRNaNS_uid136_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid108_fpFusedAddSubTest(CONSTANT,107)
    wEP2AllOwE_uid108_fpFusedAddSubTest_q <= "0011111111111";

    -- rndExp_uid109_fpFusedAddSubTest(BITSELECT,108)@18
    rndExp_uid109_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_q(65 downto 0);
    rndExp_uid109_fpFusedAddSubTest_b <= rndExp_uid109_fpFusedAddSubTest_in(65 downto 53);

    -- rOvf_uid110_fpFusedAddSubTest(LOGICAL,109)@18 + 1
    rOvf_uid110_fpFusedAddSubTest_qi <= "1" WHEN rndExp_uid109_fpFusedAddSubTest_b = wEP2AllOwE_uid108_fpFusedAddSubTest_q ELSE "0";
    rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rOvf_uid110_fpFusedAddSubTest_qi, xout => rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid36_fpFusedAddSubTest(LOGICAL,35)@5
    invExpXIsMax_uid36_fpFusedAddSubTest_q <= not (redist53_expXIsMax_uid31_fpFusedAddSubTest_q_3_q);

    -- redist49_InvExpXIsZero_uid37_fpFusedAddSubTest_q_1(DELAY,525)
    redist49_InvExpXIsZero_uid37_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid37_fpFusedAddSubTest_q, xout => redist49_InvExpXIsZero_uid37_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- excR_sigb_uid38_fpFusedAddSubTest(LOGICAL,37)@5 + 1
    excR_sigb_uid38_fpFusedAddSubTest_qi <= redist49_InvExpXIsZero_uid37_fpFusedAddSubTest_q_1_q and invExpXIsMax_uid36_fpFusedAddSubTest_q;
    excR_sigb_uid38_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_sigb_uid38_fpFusedAddSubTest_qi, xout => excR_sigb_uid38_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist48_excR_sigb_uid38_fpFusedAddSubTest_q_13(DELAY,524)
    redist48_excR_sigb_uid38_fpFusedAddSubTest_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_sigb_uid38_fpFusedAddSubTest_q, xout => redist48_excR_sigb_uid38_fpFusedAddSubTest_q_13_q, clk => clk, aclr => areset );

    -- redist59_excR_siga_uid24_fpFusedAddSubTest_q_2(DELAY,535)
    redist59_excR_siga_uid24_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_siga_uid24_fpFusedAddSubTest_q, xout => redist59_excR_siga_uid24_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- regInputs_uid119_fpFusedAddSubTest(LOGICAL,118)@18 + 1
    regInputs_uid119_fpFusedAddSubTest_qi <= redist59_excR_siga_uid24_fpFusedAddSubTest_q_2_q and redist48_excR_sigb_uid38_fpFusedAddSubTest_q_13_q;
    regInputs_uid119_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid119_fpFusedAddSubTest_qi, xout => regInputs_uid119_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- regInAndOvf_uid123_fpFusedAddSubTest(LOGICAL,122)@19
    regInAndOvf_uid123_fpFusedAddSubTest_q <= regInputs_uid119_fpFusedAddSubTest_q and rOvf_uid110_fpFusedAddSubTest_q;

    -- redist56_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_16(DELAY,532)
    redist56_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14_q, xout => redist56_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_16_q, clk => clk, aclr => areset );

    -- redist57_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_17(DELAY,533)
    redist57_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist56_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_16_q, xout => redist57_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_17_q, clk => clk, aclr => areset );

    -- redist62_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3(DELAY,538)
    redist62_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_siga_uid9_uid16_fpFusedAddSubTest_q, xout => redist62_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- redist63_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4(DELAY,539)
    redist63_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist62_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q, xout => redist63_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist52_excI_sigb_uid34_fpFusedAddSubTest_q_14(DELAY,528)
    redist52_excI_sigb_uid34_fpFusedAddSubTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11_q, xout => redist52_excI_sigb_uid34_fpFusedAddSubTest_q_14_q, clk => clk, aclr => areset );

    -- redist60_excI_siga_uid20_fpFusedAddSubTest_q_4(DELAY,536)
    redist60_excI_siga_uid20_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_siga_uid20_fpFusedAddSubTest_q, xout => redist60_excI_siga_uid20_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- redist43_effSub_uid45_fpFusedAddSubTest_q_4(DELAY,519)
    redist43_effSub_uid45_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist42_effSub_uid45_fpFusedAddSubTest_q_3_q, xout => redist43_effSub_uid45_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid127_fpFusedAddSubTest(BITJOIN,126)@19
    excRInfVInC_uid127_fpFusedAddSubTest_q <= regInAndOvf_uid123_fpFusedAddSubTest_q & redist57_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_17_q & redist63_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q & redist52_excI_sigb_uid34_fpFusedAddSubTest_q_14_q & redist60_excI_siga_uid20_fpFusedAddSubTest_q_4_q & redist43_effSub_uid45_fpFusedAddSubTest_q_4_q;

    -- excRInfSub_uid130_fpFusedAddSubTest(LOOKUP,129)@19
    excRInfSub_uid130_fpFusedAddSubTest_combproc: PROCESS (excRInfVInC_uid127_fpFusedAddSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid127_fpFusedAddSubTest_q) IS
            WHEN "000000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "000111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
            WHEN "001000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "001001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "001010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "001011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "001100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
            WHEN "001101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
            WHEN "001110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "001111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "010000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "010001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "010010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
            WHEN "010011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
            WHEN "010100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "010101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "010110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "010111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "011111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "1";
            WHEN "100010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "100111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "101111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "110111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111000" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111001" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111010" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111011" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111100" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111101" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111110" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN "111111" => excRInfSub_uid130_fpFusedAddSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInfSub_uid130_fpFusedAddSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- oneIsInfOrZero_uid125_fpFusedAddSubTest(LOGICAL,124)@18 + 1
    oneIsInfOrZero_uid125_fpFusedAddSubTest_qi <= redist59_excR_siga_uid24_fpFusedAddSubTest_q_2_q or redist48_excR_sigb_uid38_fpFusedAddSubTest_q_13_q or redist62_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_3_q or redist56_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_16_q;
    oneIsInfOrZero_uid125_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInfOrZero_uid125_fpFusedAddSubTest_qi, xout => oneIsInfOrZero_uid125_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- oneIsInf_uid124_fpFusedAddSubTest(LOGICAL,123)@19
    oneIsInf_uid124_fpFusedAddSubTest_q <= redist60_excI_siga_uid20_fpFusedAddSubTest_q_4_q or redist52_excI_sigb_uid34_fpFusedAddSubTest_q_14_q;

    -- addIsAlsoInf_uid126_fpFusedAddSubTest(LOGICAL,125)@19
    addIsAlsoInf_uid126_fpFusedAddSubTest_q <= oneIsInf_uid124_fpFusedAddSubTest_q and oneIsInfOrZero_uid125_fpFusedAddSubTest_q;

    -- excRInfSubFull_uid131_fpFusedAddSubTest(LOGICAL,130)@19 + 1
    excRInfSubFull_uid131_fpFusedAddSubTest_qi <= addIsAlsoInf_uid126_fpFusedAddSubTest_q or excRInfSub_uid130_fpFusedAddSubTest_q;
    excRInfSubFull_uid131_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInfSubFull_uid131_fpFusedAddSubTest_qi, xout => excRInfSubFull_uid131_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist36_aMinusA_uid80_fpFusedAddSubTest_q_3(DELAY,512)
    redist36_aMinusA_uid80_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid80_fpFusedAddSubTest_q, xout => redist36_aMinusA_uid80_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- signedExp_uid111_fpFusedAddSubTest(BITSELECT,110)@18
    signedExp_uid111_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_q(65 downto 0));
    signedExp_uid111_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(signedExp_uid111_fpFusedAddSubTest_in(65 downto 53));

    -- rUdf_uid112_fpFusedAddSubTest(COMPARE,111)@18 + 1
    rUdf_uid112_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & GND_q));
    rUdf_uid112_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => signedExp_uid111_fpFusedAddSubTest_b(12)) & signedExp_uid111_fpFusedAddSubTest_b));
    rUdf_uid112_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rUdf_uid112_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rUdf_uid112_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(SIGNED(rUdf_uid112_fpFusedAddSubTest_a) - SIGNED(rUdf_uid112_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    rUdf_uid112_fpFusedAddSubTest_n(0) <= not (rUdf_uid112_fpFusedAddSubTest_o(14));

    -- excRZeroVInC_uid120_fpFusedAddSubTest(BITJOIN,119)@19
    excRZeroVInC_uid120_fpFusedAddSubTest_q <= redist43_effSub_uid45_fpFusedAddSubTest_q_4_q & redist36_aMinusA_uid80_fpFusedAddSubTest_q_3_q & rUdf_uid112_fpFusedAddSubTest_n & regInputs_uid119_fpFusedAddSubTest_q & redist57_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_17_q & redist63_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_4_q;

    -- excRZeroSub_uid122_fpFusedAddSubTest(LOOKUP,121)@19 + 1
    excRZeroSub_uid122_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid120_fpFusedAddSubTest_q) IS
                WHEN "000000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "000100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "000111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "001101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "001111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "010101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "010111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "1";
                WHEN "011101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "011111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "100111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "101111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "110111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111000" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111001" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111010" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111011" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111100" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111101" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111110" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN "111111" => excRZeroSub_uid122_fpFusedAddSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZeroSub_uid122_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- concExcSub_uid137_fpFusedAddSubTest(BITJOIN,136)@20
    concExcSub_uid137_fpFusedAddSubTest_q <= redist30_excRNaNS_uid136_fpFusedAddSubTest_q_4_q & excRInfSubFull_uid131_fpFusedAddSubTest_q & excRZeroSub_uid122_fpFusedAddSubTest_q;

    -- excREncSub_uid139_fpFusedAddSubTest(LOOKUP,138)@20
    excREncSub_uid139_fpFusedAddSubTest_combproc: PROCESS (concExcSub_uid137_fpFusedAddSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExcSub_uid137_fpFusedAddSubTest_q) IS
            WHEN "000" => excREncSub_uid139_fpFusedAddSubTest_q <= "01";
            WHEN "001" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
            WHEN "010" => excREncSub_uid139_fpFusedAddSubTest_q <= "10";
            WHEN "011" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
            WHEN "100" => excREncSub_uid139_fpFusedAddSubTest_q <= "11";
            WHEN "101" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
            WHEN "110" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
            WHEN "111" => excREncSub_uid139_fpFusedAddSubTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREncSub_uid139_fpFusedAddSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExcSub_uid172_fpFusedAddSubTest(MUX,171)@20
    expRPostExcSub_uid172_fpFusedAddSubTest_s <= excREncSub_uid139_fpFusedAddSubTest_q;
    expRPostExcSub_uid172_fpFusedAddSubTest_combproc: PROCESS (expRPostExcSub_uid172_fpFusedAddSubTest_s, cstAllZWE_uid13_fpFusedAddSubTest_q, redist28_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_2_q, cstAllOWE_uid11_fpFusedAddSubTest_q)
    BEGIN
        CASE (expRPostExcSub_uid172_fpFusedAddSubTest_s) IS
            WHEN "00" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q;
            WHEN "01" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= redist28_expRPreExcSubtraction_uid144_fpFusedAddSubTest_q_2_q;
            WHEN "10" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN "11" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN OTHERS => expRPostExcSub_uid172_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid145_fpFusedAddSubTest(CONSTANT,144)
    oneFracRPostExc2_uid145_fpFusedAddSubTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExcAdd_uid116_fpFusedAddSubTest(BITSELECT,115)@18
    fracRPreExcAdd_uid116_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_q(52 downto 0);
    fracRPreExcAdd_uid116_fpFusedAddSubTest_b <= fracRPreExcAdd_uid116_fpFusedAddSubTest_in(52 downto 1);

    -- redist32_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1(DELAY,508)
    redist32_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcAdd_uid116_fpFusedAddSubTest_b, xout => redist32_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPreExcSub_uid113_fpFusedAddSubTest(BITSELECT,112)@18
    fracRPreExcSub_uid113_fpFusedAddSubTest_in <= expFracRSubPostRound_uid97_fpFusedAddSubTest_q(52 downto 0);
    fracRPreExcSub_uid113_fpFusedAddSubTest_b <= fracRPreExcSub_uid113_fpFusedAddSubTest_in(52 downto 1);

    -- redist33_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1(DELAY,509)
    redist33_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcSub_uid113_fpFusedAddSubTest_b, xout => redist33_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPreExcSubtraction_uid143_fpFusedAddSubTest(MUX,142)@19 + 1
    fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s <= redist43_effSub_uid45_fpFusedAddSubTest_q_4_q;
    fracRPreExcSubtraction_uid143_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s) IS
                WHEN "0" => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= redist33_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q;
                WHEN "1" => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= redist32_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q;
                WHEN OTHERS => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExcSub_uid168_fpFusedAddSubTest(MUX,167)@20
    fracRPostExcSub_uid168_fpFusedAddSubTest_s <= excREncSub_uid139_fpFusedAddSubTest_q;
    fracRPostExcSub_uid168_fpFusedAddSubTest_combproc: PROCESS (fracRPostExcSub_uid168_fpFusedAddSubTest_s, cstZeroWF_uid12_fpFusedAddSubTest_q, fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q, oneFracRPostExc2_uid145_fpFusedAddSubTest_q)
    BEGIN
        CASE (fracRPostExcSub_uid168_fpFusedAddSubTest_s) IS
            WHEN "00" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "01" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q;
            WHEN "10" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "11" => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= oneFracRPostExc2_uid145_fpFusedAddSubTest_q;
            WHEN OTHERS => fracRPostExcSub_uid168_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RDiff_uid186_fpFusedAddSubTest(BITJOIN,185)@20
    RDiff_uid186_fpFusedAddSubTest_q <= redist24_signRPostExcSub_uid185_fpFusedAddSubTest_q_4_q & expRPostExcSub_uid172_fpFusedAddSubTest_q & fracRPostExcSub_uid168_fpFusedAddSubTest_q;

    -- redist27_invXGTEy_uid153_fpFusedAddSubTest_q_15(DELAY,503)
    redist27_invXGTEy_uid153_fpFusedAddSubTest_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => invXGTEy_uid153_fpFusedAddSubTest_q, xout => redist27_invXGTEy_uid153_fpFusedAddSubTest_q_15_q, clk => clk, aclr => areset );

    -- invSigA_uid154_fpFusedAddSubTest(LOGICAL,153)@16
    invSigA_uid154_fpFusedAddSubTest_q <= not (redist47_sigA_uid43_fpFusedAddSubTest_b_14_q);

    -- signInputsZeroSwap_uid155_fpFusedAddSubTest(LOGICAL,154)@16
    signInputsZeroSwap_uid155_fpFusedAddSubTest_q <= excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14_q and invSigA_uid154_fpFusedAddSubTest_q and redist45_sigB_uid44_fpFusedAddSubTest_b_14_q and redist27_invXGTEy_uid153_fpFusedAddSubTest_q_15_q;

    -- invSignInputsZeroSwap_uid156_fpFusedAddSubTest(LOGICAL,155)@16
    invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q <= not (signInputsZeroSwap_uid155_fpFusedAddSubTest_q);

    -- redist66_xGTEy_uid8_fpFusedAddSubTest_n_16(DELAY,542)
    redist66_xGTEy_uid8_fpFusedAddSubTest_n_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_n, xout => redist66_xGTEy_uid8_fpFusedAddSubTest_n_16_q, clk => clk, aclr => areset );

    -- invSigB_uid157_fpFusedAddSubTest(LOGICAL,156)@16
    invSigB_uid157_fpFusedAddSubTest_q <= not (redist45_sigB_uid44_fpFusedAddSubTest_b_14_q);

    -- signInputsZeroNoSwap_uid158_fpFusedAddSubTest(LOGICAL,157)@16
    signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q <= excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist55_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_14_q and redist47_sigA_uid43_fpFusedAddSubTest_b_14_q and invSigB_uid157_fpFusedAddSubTest_q and redist66_xGTEy_uid8_fpFusedAddSubTest_n_16_q;

    -- invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest(LOGICAL,158)@16
    invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q <= not (signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q);

    -- aMa_uid160_fpFusedAddSubTest(LOGICAL,159)@16
    aMa_uid160_fpFusedAddSubTest_q <= aMinusA_uid80_fpFusedAddSubTest_q and effSub_uid45_fpFusedAddSubTest_q;

    -- invAMA_uid161_fpFusedAddSubTest(LOGICAL,160)@16
    invAMA_uid161_fpFusedAddSubTest_q <= not (aMa_uid160_fpFusedAddSubTest_q);

    -- infMinf_uid132_fpFusedAddSubTest(LOGICAL,131)@16
    infMinf_uid132_fpFusedAddSubTest_q <= excI_siga_uid20_fpFusedAddSubTest_q and redist51_excI_sigb_uid34_fpFusedAddSubTest_q_11_q and effSub_uid45_fpFusedAddSubTest_q;

    -- excRNaNA_uid133_fpFusedAddSubTest(LOGICAL,132)@16
    excRNaNA_uid133_fpFusedAddSubTest_q <= infMinf_uid132_fpFusedAddSubTest_q or excN_siga_uid21_fpFusedAddSubTest_q or redist50_excN_sigb_uid35_fpFusedAddSubTest_q_11_q;

    -- invExcRNaNA_uid162_fpFusedAddSubTest(LOGICAL,161)@16
    invExcRNaNA_uid162_fpFusedAddSubTest_q <= not (excRNaNA_uid133_fpFusedAddSubTest_q);

    -- signRPostExc_uid163_fpFusedAddSubTest(LOGICAL,162)@16 + 1
    signRPostExc_uid163_fpFusedAddSubTest_qi <= invExcRNaNA_uid162_fpFusedAddSubTest_q and redist47_sigA_uid43_fpFusedAddSubTest_b_14_q and invAMA_uid161_fpFusedAddSubTest_q and invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q and invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q;
    signRPostExc_uid163_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid163_fpFusedAddSubTest_qi, xout => signRPostExc_uid163_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist26_signRPostExc_uid163_fpFusedAddSubTest_q_4(DELAY,502)
    redist26_signRPostExc_uid163_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid163_fpFusedAddSubTest_q, xout => redist26_signRPostExc_uid163_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- expRPreExcAddition_uid142_fpFusedAddSubTest(MUX,141)@18 + 1
    expRPreExcAddition_uid142_fpFusedAddSubTest_s <= redist42_effSub_uid45_fpFusedAddSubTest_q_3_q;
    expRPreExcAddition_uid142_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPreExcAddition_uid142_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPreExcAddition_uid142_fpFusedAddSubTest_s) IS
                WHEN "0" => expRPreExcAddition_uid142_fpFusedAddSubTest_q <= expRPreExcAdd_uid117_fpFusedAddSubTest_b;
                WHEN "1" => expRPreExcAddition_uid142_fpFusedAddSubTest_q <= expRPreExcSub_uid114_fpFusedAddSubTest_b;
                WHEN OTHERS => expRPreExcAddition_uid142_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist29_expRPreExcAddition_uid142_fpFusedAddSubTest_q_2(DELAY,505)
    redist29_expRPreExcAddition_uid142_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcAddition_uid142_fpFusedAddSubTest_q, xout => redist29_expRPreExcAddition_uid142_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist31_excRNaNA_uid133_fpFusedAddSubTest_q_4(DELAY,507)
    redist31_excRNaNA_uid133_fpFusedAddSubTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNA_uid133_fpFusedAddSubTest_q, xout => redist31_excRNaNA_uid133_fpFusedAddSubTest_q_4_q, clk => clk, aclr => areset );

    -- excRInfAdd_uid128_fpFusedAddSubTest(LOOKUP,127)@19
    excRInfAdd_uid128_fpFusedAddSubTest_combproc: PROCESS (excRInfVInC_uid127_fpFusedAddSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid127_fpFusedAddSubTest_q) IS
            WHEN "000000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "000001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "000010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "000011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "000100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "000101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "000110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
            WHEN "000111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "001000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "001001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "001010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "001011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "001100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
            WHEN "001101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
            WHEN "001110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "001111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "010000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "010001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "010010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
            WHEN "010011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
            WHEN "010100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "010101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "010110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "010111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "011111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "1";
            WHEN "100001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "100111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "101111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "110111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111000" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111001" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111010" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111011" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111100" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111101" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111110" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN "111111" => excRInfAdd_uid128_fpFusedAddSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInfAdd_uid128_fpFusedAddSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- excRInfAddFull_uid129_fpFusedAddSubTest(LOGICAL,128)@19 + 1
    excRInfAddFull_uid129_fpFusedAddSubTest_qi <= addIsAlsoInf_uid126_fpFusedAddSubTest_q or excRInfAdd_uid128_fpFusedAddSubTest_q;
    excRInfAddFull_uid129_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInfAddFull_uid129_fpFusedAddSubTest_qi, xout => excRInfAddFull_uid129_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- excRZeroAdd_uid121_fpFusedAddSubTest(LOOKUP,120)@19 + 1
    excRZeroAdd_uid121_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid120_fpFusedAddSubTest_q) IS
                WHEN "000000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "000100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "000111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "001111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "010111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "011111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "100111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "101101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "101111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "110101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "110111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111000" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111001" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111010" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111011" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111100" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "1";
                WHEN "111101" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111110" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN "111111" => excRZeroAdd_uid121_fpFusedAddSubTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZeroAdd_uid121_fpFusedAddSubTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- concExcAdd_uid138_fpFusedAddSubTest(BITJOIN,137)@20
    concExcAdd_uid138_fpFusedAddSubTest_q <= redist31_excRNaNA_uid133_fpFusedAddSubTest_q_4_q & excRInfAddFull_uid129_fpFusedAddSubTest_q & excRZeroAdd_uid121_fpFusedAddSubTest_q;

    -- excREncAdd_uid140_fpFusedAddSubTest(LOOKUP,139)@20
    excREncAdd_uid140_fpFusedAddSubTest_combproc: PROCESS (concExcAdd_uid138_fpFusedAddSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExcAdd_uid138_fpFusedAddSubTest_q) IS
            WHEN "000" => excREncAdd_uid140_fpFusedAddSubTest_q <= "01";
            WHEN "001" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
            WHEN "010" => excREncAdd_uid140_fpFusedAddSubTest_q <= "10";
            WHEN "011" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
            WHEN "100" => excREncAdd_uid140_fpFusedAddSubTest_q <= "11";
            WHEN "101" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
            WHEN "110" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
            WHEN "111" => excREncAdd_uid140_fpFusedAddSubTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREncAdd_uid140_fpFusedAddSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExcAdd_uid152_fpFusedAddSubTest(MUX,151)@20
    expRPostExcAdd_uid152_fpFusedAddSubTest_s <= excREncAdd_uid140_fpFusedAddSubTest_q;
    expRPostExcAdd_uid152_fpFusedAddSubTest_combproc: PROCESS (expRPostExcAdd_uid152_fpFusedAddSubTest_s, cstAllZWE_uid13_fpFusedAddSubTest_q, redist29_expRPreExcAddition_uid142_fpFusedAddSubTest_q_2_q, cstAllOWE_uid11_fpFusedAddSubTest_q)
    BEGIN
        CASE (expRPostExcAdd_uid152_fpFusedAddSubTest_s) IS
            WHEN "00" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q;
            WHEN "01" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= redist29_expRPreExcAddition_uid142_fpFusedAddSubTest_q_2_q;
            WHEN "10" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN "11" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN OTHERS => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExcAddition_uid141_fpFusedAddSubTest(MUX,140)@19 + 1
    fracRPreExcAddition_uid141_fpFusedAddSubTest_s <= redist43_effSub_uid45_fpFusedAddSubTest_q_4_q;
    fracRPreExcAddition_uid141_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExcAddition_uid141_fpFusedAddSubTest_s) IS
                WHEN "0" => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= redist32_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q;
                WHEN "1" => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= redist33_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q;
                WHEN OTHERS => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExcAdd_uid148_fpFusedAddSubTest(MUX,147)@20
    fracRPostExcAdd_uid148_fpFusedAddSubTest_s <= excREncAdd_uid140_fpFusedAddSubTest_q;
    fracRPostExcAdd_uid148_fpFusedAddSubTest_combproc: PROCESS (fracRPostExcAdd_uid148_fpFusedAddSubTest_s, cstZeroWF_uid12_fpFusedAddSubTest_q, fracRPreExcAddition_uid141_fpFusedAddSubTest_q, oneFracRPostExc2_uid145_fpFusedAddSubTest_q)
    BEGIN
        CASE (fracRPostExcAdd_uid148_fpFusedAddSubTest_s) IS
            WHEN "00" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "01" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= fracRPreExcAddition_uid141_fpFusedAddSubTest_q;
            WHEN "10" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= cstZeroWF_uid12_fpFusedAddSubTest_q;
            WHEN "11" => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= oneFracRPostExc2_uid145_fpFusedAddSubTest_q;
            WHEN OTHERS => fracRPostExcAdd_uid148_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSum_uid164_fpFusedAddSubTest(BITJOIN,163)@20
    RSum_uid164_fpFusedAddSubTest_q <= redist26_signRPostExc_uid163_fpFusedAddSubTest_q_4_q & expRPostExcAdd_uid152_fpFusedAddSubTest_q & fracRPostExcAdd_uid148_fpFusedAddSubTest_q;

    -- xOut(GPOUT,4)@20
    q <= RSum_uid164_fpFusedAddSubTest_q;
    s <= RDiff_uid186_fpFusedAddSubTest_q;

END normal;
