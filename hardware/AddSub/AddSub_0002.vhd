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
-- VHDL created on Sun May 11 17:37:53 2025


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
    signal excZ_siga_uid9_uid16_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid17_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid19_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
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
    signal fracXIsZero_uid32_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid33_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_sigb_uid34_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_sigb_uid35_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid36_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid37_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_sigb_uid38_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_sigb_uid38_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid43_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid44_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
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
    signal cmpStickyWZero_uid64_fpFusedAddSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpStickyWZero_uid64_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
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
    signal excRInfAddFull_uid129_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfSub_uid130_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
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
    signal rightShiftStage0Idx1Rng16_uid265_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (90 downto 0);
    signal rightShiftStage0Idx1_uid267_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx2Rng32_uid268_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (74 downto 0);
    signal rightShiftStage0Idx2_uid270_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx3Rng48_uid271_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal rightShiftStage0Idx3Pad48_uid272_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid273_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx1Rng4_uid276_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (102 downto 0);
    signal rightShiftStage1Idx1_uid278_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx2Rng8_uid279_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (98 downto 0);
    signal rightShiftStage1Idx2_uid281_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx3Rng12_uid282_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (94 downto 0);
    signal rightShiftStage1Idx3Pad12_uid283_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid284_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx1Rng1_uid287_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage2Idx1_uid289_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx2Rng2_uid290_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (104 downto 0);
    signal rightShiftStage2Idx2_uid292_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx3Rng3_uid293_alignmentShifter_uid59_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (103 downto 0);
    signal rightShiftStage2Idx3_uid295_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (106 downto 0);
    signal leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid303_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid306_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid309_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid314_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid317_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid320_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid325_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid328_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid331_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid339_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid342_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid345_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid350_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid353_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid356_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid361_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid364_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid367_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (54 downto 0);
    signal redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist1_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist9_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist14_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_signRPostExcSub_uid185_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_signRPostExcSub0_uid183_fpFusedAddSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_signRPostExc_uid163_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_invXGTEy_uid153_fpFusedAddSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excRNaNS_uid136_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_excRNaNA_uid133_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist23_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist24_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist25_aMinusA_uid80_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q : STD_LOGIC_VECTOR (56 downto 0);
    signal redist30_effSub_uid45_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_effSub_uid45_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_sigB_uid44_fpFusedAddSubTest_b_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_sigA_uid43_fpFusedAddSubTest_b_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_InvExpXIsZero_uid37_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_excI_sigb_uid34_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_fracXIsZero_uid32_fpFusedAddSubTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_frac_sigb_uid29_fpFusedAddSubTest_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist43_excR_siga_uid24_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_excI_siga_uid20_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_fracXIsZero_uid18_fpFusedAddSubTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist49_exp_siga_uid14_fpFusedAddSubTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist51_xGTEy_uid8_fpFusedAddSubTest_n_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_inputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_outputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_reset0 : std_logic;
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i : signal is true;
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_eq : std_logic;
    attribute preserve of redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_eq : signal is true;
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_q : signal is true;
    signal redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpFusedAddSubTest(BITSELECT,6)@0
    expFracY_uid7_fpFusedAddSubTest_b <= b(62 downto 0);

    -- expFracX_uid6_fpFusedAddSubTest(BITSELECT,5)@0
    expFracX_uid6_fpFusedAddSubTest_b <= a(62 downto 0);

    -- xGTEy_uid8_fpFusedAddSubTest(COMPARE,7)@0
    xGTEy_uid8_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpFusedAddSubTest_b);
    xGTEy_uid8_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpFusedAddSubTest_b);
    xGTEy_uid8_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_a) - UNSIGNED(xGTEy_uid8_fpFusedAddSubTest_b));
    xGTEy_uid8_fpFusedAddSubTest_n(0) <= not (xGTEy_uid8_fpFusedAddSubTest_o(64));

    -- sigb_uid10_fpFusedAddSubTest(MUX,9)@0
    sigb_uid10_fpFusedAddSubTest_s <= xGTEy_uid8_fpFusedAddSubTest_n;
    sigb_uid10_fpFusedAddSubTest_combproc: PROCESS (sigb_uid10_fpFusedAddSubTest_s, a, b)
    BEGIN
        CASE (sigb_uid10_fpFusedAddSubTest_s) IS
            WHEN "0" => sigb_uid10_fpFusedAddSubTest_q <= a;
            WHEN "1" => sigb_uid10_fpFusedAddSubTest_q <= b;
            WHEN OTHERS => sigb_uid10_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid44_fpFusedAddSubTest(BITSELECT,43)@0
    sigB_uid44_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sigb_uid10_fpFusedAddSubTest_q(63 downto 63));

    -- redist32_sigB_uid44_fpFusedAddSubTest_b_7(DELAY,414)
    redist32_sigB_uid44_fpFusedAddSubTest_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid44_fpFusedAddSubTest_b, xout => redist32_sigB_uid44_fpFusedAddSubTest_b_7_q, clk => clk, aclr => areset );

    -- siga_uid9_fpFusedAddSubTest(MUX,8)@0
    siga_uid9_fpFusedAddSubTest_s <= xGTEy_uid8_fpFusedAddSubTest_n;
    siga_uid9_fpFusedAddSubTest_combproc: PROCESS (siga_uid9_fpFusedAddSubTest_s, b, a)
    BEGIN
        CASE (siga_uid9_fpFusedAddSubTest_s) IS
            WHEN "0" => siga_uid9_fpFusedAddSubTest_q <= b;
            WHEN "1" => siga_uid9_fpFusedAddSubTest_q <= a;
            WHEN OTHERS => siga_uid9_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid43_fpFusedAddSubTest(BITSELECT,42)@0
    sigA_uid43_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(siga_uid9_fpFusedAddSubTest_q(63 downto 63));

    -- redist33_sigA_uid43_fpFusedAddSubTest_b_7(DELAY,415)
    redist33_sigA_uid43_fpFusedAddSubTest_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid43_fpFusedAddSubTest_b, xout => redist33_sigA_uid43_fpFusedAddSubTest_b_7_q, clk => clk, aclr => areset );

    -- cAmA_uid79_fpFusedAddSubTest(CONSTANT,78)
    cAmA_uid79_fpFusedAddSubTest_q <= "111001";

    -- zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,188)
    zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00000000000000000000000000000000";

    -- zv_uid68_fpFusedAddSubTest(CONSTANT,67)
    zv_uid68_fpFusedAddSubTest_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid293_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,292)@2
    rightShiftStage2Idx3Rng3_uid293_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 3);

    -- rightShiftStage2Idx3_uid295_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,294)@2
    rightShiftStage2Idx3_uid295_alignmentShifter_uid59_fpFusedAddSubTest_q <= zv_uid68_fpFusedAddSubTest_q & rightShiftStage2Idx3Rng3_uid293_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,214)
    zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00";

    -- rightShiftStage2Idx2Rng2_uid290_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,289)@2
    rightShiftStage2Idx2Rng2_uid290_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 2);

    -- rightShiftStage2Idx2_uid292_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,291)@2
    rightShiftStage2Idx2_uid292_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage2Idx2Rng2_uid290_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage2Idx1Rng1_uid287_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,286)@2
    rightShiftStage2Idx1Rng1_uid287_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 1);

    -- rightShiftStage2Idx1_uid289_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,288)@2
    rightShiftStage2Idx1_uid289_alignmentShifter_uid59_fpFusedAddSubTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid287_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage1Idx3Pad12_uid283_alignmentShifter_uid59_fpFusedAddSubTest(CONSTANT,282)
    rightShiftStage1Idx3Pad12_uid283_alignmentShifter_uid59_fpFusedAddSubTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid282_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,281)@2
    rightShiftStage1Idx3Rng12_uid282_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 12);

    -- rightShiftStage1Idx3_uid284_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,283)@2
    rightShiftStage1Idx3_uid284_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx3Pad12_uid283_alignmentShifter_uid59_fpFusedAddSubTest_q & rightShiftStage1Idx3Rng12_uid282_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,202)
    zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid279_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,278)@2
    rightShiftStage1Idx2Rng8_uid279_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 8);

    -- rightShiftStage1Idx2_uid281_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,280)@2
    rightShiftStage1Idx2_uid281_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage1Idx2Rng8_uid279_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,208)
    zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid276_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,275)@2
    rightShiftStage1Idx1Rng4_uid276_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 4);

    -- rightShiftStage1Idx1_uid278_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,277)@2
    rightShiftStage1Idx1_uid278_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage1Idx1Rng4_uid276_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage0Idx3Pad48_uid272_alignmentShifter_uid59_fpFusedAddSubTest(CONSTANT,271)
    rightShiftStage0Idx3Pad48_uid272_alignmentShifter_uid59_fpFusedAddSubTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid271_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,270)@2
    rightShiftStage0Idx3Rng48_uid271_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(106 downto 48);

    -- rightShiftStage0Idx3_uid273_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,272)@2
    rightShiftStage0Idx3_uid273_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx3Pad48_uid272_alignmentShifter_uid59_fpFusedAddSubTest_q & rightShiftStage0Idx3Rng48_uid271_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- rightShiftStage0Idx2Rng32_uid268_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,267)@2
    rightShiftStage0Idx2Rng32_uid268_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(106 downto 32);

    -- rightShiftStage0Idx2_uid270_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,269)@2
    rightShiftStage0Idx2_uid270_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage0Idx2Rng32_uid268_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,196)
    zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid265_alignmentShifter_uid59_fpFusedAddSubTest(BITSELECT,264)@2
    rightShiftStage0Idx1Rng16_uid265_alignmentShifter_uid59_fpFusedAddSubTest_b <= rightPaddedIn_uid60_fpFusedAddSubTest_q(106 downto 16);

    -- rightShiftStage0Idx1_uid267_alignmentShifter_uid59_fpFusedAddSubTest(BITJOIN,266)@2
    rightShiftStage0Idx1_uid267_alignmentShifter_uid59_fpFusedAddSubTest_q <= zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q & rightShiftStage0Idx1Rng16_uid265_alignmentShifter_uid59_fpFusedAddSubTest_b;

    -- cstAllZWE_uid13_fpFusedAddSubTest(CONSTANT,12)
    cstAllZWE_uid13_fpFusedAddSubTest_q <= "00000000000";

    -- exp_sigb_uid28_fpFusedAddSubTest(BITSELECT,27)@0
    exp_sigb_uid28_fpFusedAddSubTest_in <= sigb_uid10_fpFusedAddSubTest_q(62 downto 0);
    exp_sigb_uid28_fpFusedAddSubTest_b <= exp_sigb_uid28_fpFusedAddSubTest_in(62 downto 52);

    -- redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1(DELAY,424)
    redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_sigb_uid28_fpFusedAddSubTest_b, xout => redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- excZ_sigb_uid10_uid30_fpFusedAddSubTest(LOGICAL,29)@1 + 1
    excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi <= "1" WHEN redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1_q = cstAllZWE_uid13_fpFusedAddSubTest_q ELSE "0";
    excZ_sigb_uid10_uid30_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_sigb_uid10_uid30_fpFusedAddSubTest_qi, xout => excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid37_fpFusedAddSubTest(LOGICAL,36)@2
    InvExpXIsZero_uid37_fpFusedAddSubTest_q <= not (excZ_sigb_uid10_uid30_fpFusedAddSubTest_q);

    -- frac_sigb_uid29_fpFusedAddSubTest(BITSELECT,28)@0
    frac_sigb_uid29_fpFusedAddSubTest_in <= sigb_uid10_fpFusedAddSubTest_q(51 downto 0);
    frac_sigb_uid29_fpFusedAddSubTest_b <= frac_sigb_uid29_fpFusedAddSubTest_in(51 downto 0);

    -- redist41_frac_sigb_uid29_fpFusedAddSubTest_b_2(DELAY,423)
    redist41_frac_sigb_uid29_fpFusedAddSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_sigb_uid29_fpFusedAddSubTest_b, xout => redist41_frac_sigb_uid29_fpFusedAddSubTest_b_2_q, clk => clk, aclr => areset );

    -- oFracB_uid56_fpFusedAddSubTest(BITJOIN,55)@2
    oFracB_uid56_fpFusedAddSubTest_q <= InvExpXIsZero_uid37_fpFusedAddSubTest_q & redist41_frac_sigb_uid29_fpFusedAddSubTest_b_2_q;

    -- padConst_uid59_fpFusedAddSubTest(CONSTANT,58)
    padConst_uid59_fpFusedAddSubTest_q <= "000000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid60_fpFusedAddSubTest(BITJOIN,59)@2
    rightPaddedIn_uid60_fpFusedAddSubTest_q <= oFracB_uid56_fpFusedAddSubTest_q & padConst_uid59_fpFusedAddSubTest_q;

    -- rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest(MUX,274)@2
    rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_s <= rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b;
    rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_combproc: PROCESS (rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_s, rightPaddedIn_uid60_fpFusedAddSubTest_q, rightShiftStage0Idx1_uid267_alignmentShifter_uid59_fpFusedAddSubTest_q, rightShiftStage0Idx2_uid270_alignmentShifter_uid59_fpFusedAddSubTest_q, rightShiftStage0Idx3_uid273_alignmentShifter_uid59_fpFusedAddSubTest_q)
    BEGIN
        CASE (rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
            WHEN "00" => rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightPaddedIn_uid60_fpFusedAddSubTest_q;
            WHEN "01" => rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx1_uid267_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN "10" => rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx2_uid270_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN "11" => rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0Idx3_uid273_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN OTHERS => rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest(MUX,285)@2
    rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_s <= rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c;
    rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_combproc: PROCESS (rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_s, rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q, rightShiftStage1Idx1_uid278_alignmentShifter_uid59_fpFusedAddSubTest_q, rightShiftStage1Idx2_uid281_alignmentShifter_uid59_fpFusedAddSubTest_q, rightShiftStage1Idx3_uid284_alignmentShifter_uid59_fpFusedAddSubTest_q)
    BEGIN
        CASE (rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
            WHEN "00" => rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage0_uid275_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN "01" => rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx1_uid278_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN "10" => rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx2_uid281_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN "11" => rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1Idx3_uid284_alignmentShifter_uid59_fpFusedAddSubTest_q;
            WHEN OTHERS => rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftOutConst_uid52_fpFusedAddSubTest(CONSTANT,51)
    shiftOutConst_uid52_fpFusedAddSubTest_q <= "110110";

    -- exp_siga_uid14_fpFusedAddSubTest(BITSELECT,13)@0
    exp_siga_uid14_fpFusedAddSubTest_in <= siga_uid9_fpFusedAddSubTest_q(62 downto 0);
    exp_siga_uid14_fpFusedAddSubTest_b <= exp_siga_uid14_fpFusedAddSubTest_in(62 downto 52);

    -- redist49_exp_siga_uid14_fpFusedAddSubTest_b_1(DELAY,431)
    redist49_exp_siga_uid14_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_siga_uid14_fpFusedAddSubTest_b, xout => redist49_exp_siga_uid14_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- expAmExpB_uid48_fpFusedAddSubTest(SUB,47)@1
    expAmExpB_uid48_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & redist49_exp_siga_uid14_fpFusedAddSubTest_b_1_q);
    expAmExpB_uid48_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0" & redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1_q);
    expAmExpB_uid48_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_a) - UNSIGNED(expAmExpB_uid48_fpFusedAddSubTest_b));
    expAmExpB_uid48_fpFusedAddSubTest_q <= expAmExpB_uid48_fpFusedAddSubTest_o(11 downto 0);

    -- expAmExpBShiftRange_uid53_fpFusedAddSubTest(BITSELECT,52)@1
    expAmExpBShiftRange_uid53_fpFusedAddSubTest_in <= expAmExpB_uid48_fpFusedAddSubTest_q(5 downto 0);
    expAmExpBShiftRange_uid53_fpFusedAddSubTest_b <= expAmExpBShiftRange_uid53_fpFusedAddSubTest_in(5 downto 0);

    -- cWFP1_uid49_fpFusedAddSubTest(CONSTANT,48)
    cWFP1_uid49_fpFusedAddSubTest_q <= "110101";

    -- shiftedOut_uid51_fpFusedAddSubTest(COMPARE,50)@1
    shiftedOut_uid51_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("00000000" & cWFP1_uid49_fpFusedAddSubTest_q);
    shiftedOut_uid51_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid48_fpFusedAddSubTest_q);
    shiftedOut_uid51_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_a) - UNSIGNED(shiftedOut_uid51_fpFusedAddSubTest_b));
    shiftedOut_uid51_fpFusedAddSubTest_c(0) <= shiftedOut_uid51_fpFusedAddSubTest_o(13);

    -- shiftValue_uid54_fpFusedAddSubTest(MUX,53)@1 + 1
    shiftValue_uid54_fpFusedAddSubTest_s <= shiftedOut_uid51_fpFusedAddSubTest_c;
    shiftValue_uid54_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValue_uid54_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftValue_uid54_fpFusedAddSubTest_s) IS
                WHEN "0" => shiftValue_uid54_fpFusedAddSubTest_q <= expAmExpBShiftRange_uid53_fpFusedAddSubTest_b;
                WHEN "1" => shiftValue_uid54_fpFusedAddSubTest_q <= shiftOutConst_uid52_fpFusedAddSubTest_q;
                WHEN OTHERS => shiftValue_uid54_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select(BITSELECT,370)@2
    rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_b <= shiftValue_uid54_fpFusedAddSubTest_q(5 downto 4);
    rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_c <= shiftValue_uid54_fpFusedAddSubTest_q(3 downto 2);
    rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d <= shiftValue_uid54_fpFusedAddSubTest_q(1 downto 0);

    -- rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest(MUX,296)@2 + 1
    rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_s <= rightShiftStageSel5Dto4_uid274_alignmentShifter_uid59_fpFusedAddSubTest_merged_bit_select_d;
    rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_s) IS
                WHEN "00" => rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage1_uid286_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "01" => rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage2Idx1_uid289_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "10" => rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage2Idx2_uid292_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN "11" => rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q <= rightShiftStage2Idx3_uid295_alignmentShifter_uid59_fpFusedAddSubTest_q;
                WHEN OTHERS => rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- stickyBits_uid62_fpFusedAddSubTest_merged_bit_select(BITSELECT,381)@3
    stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b <= rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q(51 downto 0);
    stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c <= rightShiftStage2_uid297_alignmentShifter_uid59_fpFusedAddSubTest_q(106 downto 52);

    -- redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,382)
    redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c, xout => redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- cstZeroWF_uid12_fpFusedAddSubTest(CONSTANT,11)
    cstZeroWF_uid12_fpFusedAddSubTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- cmpStickyWZero_uid64_fpFusedAddSubTest(LOGICAL,63)@3 + 1
    cmpStickyWZero_uid64_fpFusedAddSubTest_qi <= "1" WHEN stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_b = cstZeroWF_uid12_fpFusedAddSubTest_q ELSE "0";
    cmpStickyWZero_uid64_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpStickyWZero_uid64_fpFusedAddSubTest_qi, xout => cmpStickyWZero_uid64_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- sticky_uid65_fpFusedAddSubTest(LOGICAL,64)@4
    sticky_uid65_fpFusedAddSubTest_q <= not (cmpStickyWZero_uid64_fpFusedAddSubTest_q);

    -- alignFracB_uid67_fpFusedAddSubTest(BITJOIN,66)@4
    alignFracB_uid67_fpFusedAddSubTest_q <= redist0_stickyBits_uid62_fpFusedAddSubTest_merged_bit_select_c_1_q & sticky_uid65_fpFusedAddSubTest_q;

    -- fracBOp_uid70_fpFusedAddSubTest(BITJOIN,69)@4
    fracBOp_uid70_fpFusedAddSubTest_q <= GND_q & GND_q & alignFracB_uid67_fpFusedAddSubTest_q;

    -- frac_siga_uid15_fpFusedAddSubTest(BITSELECT,14)@0
    frac_siga_uid15_fpFusedAddSubTest_in <= siga_uid9_fpFusedAddSubTest_q(51 downto 0);
    frac_siga_uid15_fpFusedAddSubTest_b <= frac_siga_uid15_fpFusedAddSubTest_in(51 downto 0);

    -- redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_inputreg(DELAY,434)
    redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_siga_uid15_fpFusedAddSubTest_b, xout => redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_inputreg_q, clk => clk, aclr => areset );

    -- redist48_frac_siga_uid15_fpFusedAddSubTest_b_4(DELAY,430)
    redist48_frac_siga_uid15_fpFusedAddSubTest_b_4 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_inputreg_q, xout => redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_q, clk => clk, aclr => areset );

    -- redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_outputreg(DELAY,435)
    redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_outputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_q, xout => redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_outputreg_q, clk => clk, aclr => areset );

    -- oFracA_uid57_fpFusedAddSubTest(BITJOIN,56)@4
    oFracA_uid57_fpFusedAddSubTest_q <= VCC_q & redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_outputreg_q;

    -- fracAOp_uid69_fpFusedAddSubTest(BITJOIN,68)@4
    fracAOp_uid69_fpFusedAddSubTest_q <= oFracA_uid57_fpFusedAddSubTest_q & zv_uid68_fpFusedAddSubTest_q;

    -- fracResSub_uid71_fpFusedAddSubTest(SUB,70)@4
    fracResSub_uid71_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("000" & fracAOp_uid69_fpFusedAddSubTest_q);
    fracResSub_uid71_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0" & fracBOp_uid70_fpFusedAddSubTest_q);
    fracResSub_uid71_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_a) - UNSIGNED(fracResSub_uid71_fpFusedAddSubTest_b));
    fracResSub_uid71_fpFusedAddSubTest_q <= fracResSub_uid71_fpFusedAddSubTest_o(58 downto 0);

    -- fracResSubNoSignExt_uid73_fpFusedAddSubTest(BITSELECT,72)@4
    fracResSubNoSignExt_uid73_fpFusedAddSubTest_in <= fracResSub_uid71_fpFusedAddSubTest_q(56 downto 0);
    fracResSubNoSignExt_uid73_fpFusedAddSubTest_b <= fracResSubNoSignExt_uid73_fpFusedAddSubTest_in(56 downto 0);

    -- redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1(DELAY,410)
    redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResSubNoSignExt_uid73_fpFusedAddSubTest_b, xout => redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,189)@5
    rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b <= redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q(56 downto 25);

    -- vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,190)@5
    vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b = zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist14_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,396)
    redist14_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist14_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,192)@5
    vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in <= redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q(24 downto 0);
    vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b <= vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_in(24 downto 0);

    -- mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest(CONSTANT,191)
    mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1111111";

    -- cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest(BITJOIN,193)@5
    cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q <= vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b & mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest(MUX,195)@5
    vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s, rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b, cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q)
    BEGIN
        CASE (vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid190_lzCountValSub_uid75_fpFusedAddSubTest_b;
            WHEN "1" => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= cStage_uid194_lzCountValSub_uid75_fpFusedAddSubTest_q;
            WHEN OTHERS => vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,371)@5
    rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q(31 downto 16);
    rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid196_lzCountValSub_uid75_fpFusedAddSubTest_q(15 downto 0);

    -- vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,198)@5
    vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid198_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist12_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2(DELAY,394)
    redist12_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist12_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest(MUX,201)@5 + 1
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

    -- rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,372)@6
    rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q(15 downto 8);
    rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid202_lzCountValSub_uid75_fpFusedAddSubTest_q(7 downto 0);

    -- vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,204)@6
    vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist11_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_1(DELAY,393)
    redist11_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist11_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest(MUX,207)@6
    vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s, rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid204_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,373)@6
    rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q(7 downto 4);
    rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid208_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 0);

    -- vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,210)@6
    vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist10_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1(DELAY,392)
    redist10_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q, xout => redist10_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest(MUX,213)@6
    vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s, rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= rVStage_uid210_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select(BITSELECT,374)@6
    rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 2);
    rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid214_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 0);

    -- vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,216)@6 + 1
    vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b = zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_qi, xout => vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist4_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,386)
    redist4_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c, xout => redist4_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist3_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,385)
    redist3_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b, xout => redist3_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest(MUX,219)@7
    vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s <= vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q;
    vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s, redist3_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q, redist4_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist3_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist4_rVStage_uid216_lzCountValSub_uid75_fpFusedAddSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest(BITSELECT,221)@7
    rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest_b <= vStagei_uid220_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 1);

    -- vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest(LOGICAL,222)@7
    vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid222_lzCountValSub_uid75_fpFusedAddSubTest_b = GND_q ELSE "0";

    -- r_uid224_lzCountValSub_uid75_fpFusedAddSubTest(BITJOIN,223)@7
    r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q <= redist14_vCount_uid191_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q & redist12_vCount_uid199_lzCountValSub_uid75_fpFusedAddSubTest_q_2_q & redist11_vCount_uid205_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q & redist10_vCount_uid211_lzCountValSub_uid75_fpFusedAddSubTest_q_1_q & vCount_uid217_lzCountValSub_uid75_fpFusedAddSubTest_q & vCount_uid223_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- aMinusA_uid80_fpFusedAddSubTest(LOGICAL,79)@7
    aMinusA_uid80_fpFusedAddSubTest_q <= "1" WHEN r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q = cAmA_uid79_fpFusedAddSubTest_q ELSE "0";

    -- cstAllOWE_uid11_fpFusedAddSubTest(CONSTANT,10)
    cstAllOWE_uid11_fpFusedAddSubTest_q <= "11111111111";

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_notEnable(LOGICAL,444)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_nor(LOGICAL,445)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_nor_q <= not (redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_notEnable_q or redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_q);

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_last(CONSTANT,441)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_last_q <= "01";

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmp(LOGICAL,442)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmp_q <= "1" WHEN redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_last_q = redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_q ELSE "0";

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmpReg(REG,443)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmp_q);
        END IF;
    END PROCESS;

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena(REG,446)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_nor_q = "1") THEN
                redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_enaAnd(LOGICAL,447)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_enaAnd_q <= redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_sticky_ena_q and VCC_q;

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt(COUNTER,439)
    -- low=0, high=2, step=1, init=0
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_eq <= '1';
            ELSE
                redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_eq <= '0';
            END IF;
            IF (redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_eq = '1') THEN
                redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i <= redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i + 2;
            ELSE
                redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i <= redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_i, 2)));

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_inputreg(DELAY,436)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist49_exp_siga_uid14_fpFusedAddSubTest_b_1_q, xout => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_inputreg_q, clk => clk, aclr => areset );

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_wraddr(REG,440)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem(DUALMEM,438)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_ia <= STD_LOGIC_VECTOR(redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_inputreg_q);
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_aa <= redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_wraddr_q;
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_ab <= redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_rdcnt_q;
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_reset0 <= areset;
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 11,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_aa,
        data_a => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_ab,
        q_b => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_iq
    );
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_q <= redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_iq(10 downto 0);

    -- redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg(DELAY,437)
    redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_mem_q, xout => redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg_q, clk => clk, aclr => areset );

    -- expXIsMax_uid17_fpFusedAddSubTest(LOGICAL,16)@7
    expXIsMax_uid17_fpFusedAddSubTest_q <= "1" WHEN redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg_q = cstAllOWE_uid11_fpFusedAddSubTest_q ELSE "0";

    -- invExpXIsMax_uid22_fpFusedAddSubTest(LOGICAL,21)@7
    invExpXIsMax_uid22_fpFusedAddSubTest_q <= not (expXIsMax_uid17_fpFusedAddSubTest_q);

    -- excZ_siga_uid9_uid16_fpFusedAddSubTest(LOGICAL,15)@7
    excZ_siga_uid9_uid16_fpFusedAddSubTest_q <= "1" WHEN redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg_q = cstAllZWE_uid13_fpFusedAddSubTest_q ELSE "0";

    -- InvExpXIsZero_uid23_fpFusedAddSubTest(LOGICAL,22)@7
    InvExpXIsZero_uid23_fpFusedAddSubTest_q <= not (excZ_siga_uid9_uid16_fpFusedAddSubTest_q);

    -- excR_siga_uid24_fpFusedAddSubTest(LOGICAL,23)@7
    excR_siga_uid24_fpFusedAddSubTest_q <= InvExpXIsZero_uid23_fpFusedAddSubTest_q and invExpXIsMax_uid22_fpFusedAddSubTest_q;

    -- positiveExc_uid173_fpFusedAddSubTest(LOGICAL,172)@7
    positiveExc_uid173_fpFusedAddSubTest_q <= excR_siga_uid24_fpFusedAddSubTest_q and aMinusA_uid80_fpFusedAddSubTest_q and redist33_sigA_uid43_fpFusedAddSubTest_b_7_q and redist32_sigB_uid44_fpFusedAddSubTest_b_7_q;

    -- invPositiveExc_uid174_fpFusedAddSubTest(LOGICAL,173)@7
    invPositiveExc_uid174_fpFusedAddSubTest_q <= not (positiveExc_uid173_fpFusedAddSubTest_q);

    -- redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6(DELAY,420)
    redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_sigb_uid10_uid30_fpFusedAddSubTest_q, xout => redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6_q, clk => clk, aclr => areset );

    -- signInputsZeroForSub_uid175_fpFusedAddSubTest(LOGICAL,174)@7
    signInputsZeroForSub_uid175_fpFusedAddSubTest_q <= excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6_q and redist33_sigA_uid43_fpFusedAddSubTest_b_7_q and redist32_sigB_uid44_fpFusedAddSubTest_b_7_q;

    -- invSignInputsZeroForSub_uid176_fpFusedAddSubTest(LOGICAL,175)@7
    invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q <= not (signInputsZeroForSub_uid175_fpFusedAddSubTest_q);

    -- sigY_uid177_fpFusedAddSubTest(BITSELECT,176)@0
    sigY_uid177_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(b(63 downto 63));

    -- invSigY_uid178_fpFusedAddSubTest(LOGICAL,177)@0
    invSigY_uid178_fpFusedAddSubTest_q <= not (sigY_uid177_fpFusedAddSubTest_b);

    -- invXGTEy_uid153_fpFusedAddSubTest(LOGICAL,152)@0
    invXGTEy_uid153_fpFusedAddSubTest_q <= not (xGTEy_uid8_fpFusedAddSubTest_n);

    -- yGTxYPos_uid180_fpFusedAddSubTest(LOGICAL,179)@0
    yGTxYPos_uid180_fpFusedAddSubTest_q <= invXGTEy_uid153_fpFusedAddSubTest_q and invSigY_uid178_fpFusedAddSubTest_q;

    -- sigX_uid181_fpFusedAddSubTest(BITSELECT,180)@0
    sigX_uid181_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(a(63 downto 63));

    -- xGTyXNeg_uid182_fpFusedAddSubTest(LOGICAL,181)@0
    xGTyXNeg_uid182_fpFusedAddSubTest_q <= xGTEy_uid8_fpFusedAddSubTest_n and sigX_uid181_fpFusedAddSubTest_b;

    -- signRPostExcSub0_uid183_fpFusedAddSubTest(LOGICAL,182)@0 + 1
    signRPostExcSub0_uid183_fpFusedAddSubTest_qi <= xGTyXNeg_uid182_fpFusedAddSubTest_q or yGTxYPos_uid180_fpFusedAddSubTest_q;
    signRPostExcSub0_uid183_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub0_uid183_fpFusedAddSubTest_qi, xout => signRPostExcSub0_uid183_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist16_signRPostExcSub0_uid183_fpFusedAddSubTest_q_7(DELAY,398)
    redist16_signRPostExcSub0_uid183_fpFusedAddSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub0_uid183_fpFusedAddSubTest_q, xout => redist16_signRPostExcSub0_uid183_fpFusedAddSubTest_q_7_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid32_fpFusedAddSubTest(LOGICAL,31)@2 + 1
    fracXIsZero_uid32_fpFusedAddSubTest_qi <= "1" WHEN cstZeroWF_uid12_fpFusedAddSubTest_q = redist41_frac_sigb_uid29_fpFusedAddSubTest_b_2_q ELSE "0";
    fracXIsZero_uid32_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid32_fpFusedAddSubTest_qi, xout => fracXIsZero_uid32_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist36_fracXIsZero_uid32_fpFusedAddSubTest_q_5(DELAY,418)
    redist36_fracXIsZero_uid32_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid32_fpFusedAddSubTest_q, xout => redist36_fracXIsZero_uid32_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid33_fpFusedAddSubTest(LOGICAL,32)@7
    fracXIsNotZero_uid33_fpFusedAddSubTest_q <= not (redist36_fracXIsZero_uid32_fpFusedAddSubTest_q_5_q);

    -- expXIsMax_uid31_fpFusedAddSubTest(LOGICAL,30)@1 + 1
    expXIsMax_uid31_fpFusedAddSubTest_qi <= "1" WHEN redist42_exp_sigb_uid28_fpFusedAddSubTest_b_1_q = cstAllOWE_uid11_fpFusedAddSubTest_q ELSE "0";
    expXIsMax_uid31_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid31_fpFusedAddSubTest_qi, xout => expXIsMax_uid31_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6(DELAY,419)
    redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid31_fpFusedAddSubTest_q, xout => redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6_q, clk => clk, aclr => areset );

    -- excN_sigb_uid35_fpFusedAddSubTest(LOGICAL,34)@7
    excN_sigb_uid35_fpFusedAddSubTest_q <= redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6_q and fracXIsNotZero_uid33_fpFusedAddSubTest_q;

    -- fracXIsZero_uid18_fpFusedAddSubTest(LOGICAL,17)@4 + 1
    fracXIsZero_uid18_fpFusedAddSubTest_qi <= "1" WHEN cstZeroWF_uid12_fpFusedAddSubTest_q = redist48_frac_siga_uid15_fpFusedAddSubTest_b_4_outputreg_q ELSE "0";
    fracXIsZero_uid18_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid18_fpFusedAddSubTest_qi, xout => fracXIsZero_uid18_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist45_fracXIsZero_uid18_fpFusedAddSubTest_q_3(DELAY,427)
    redist45_fracXIsZero_uid18_fpFusedAddSubTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid18_fpFusedAddSubTest_q, xout => redist45_fracXIsZero_uid18_fpFusedAddSubTest_q_3_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid19_fpFusedAddSubTest(LOGICAL,18)@7
    fracXIsNotZero_uid19_fpFusedAddSubTest_q <= not (redist45_fracXIsZero_uid18_fpFusedAddSubTest_q_3_q);

    -- excN_siga_uid21_fpFusedAddSubTest(LOGICAL,20)@7
    excN_siga_uid21_fpFusedAddSubTest_q <= expXIsMax_uid17_fpFusedAddSubTest_q and fracXIsNotZero_uid19_fpFusedAddSubTest_q;

    -- effSub_uid45_fpFusedAddSubTest(LOGICAL,44)@7
    effSub_uid45_fpFusedAddSubTest_q <= redist33_sigA_uid43_fpFusedAddSubTest_b_7_q xor redist32_sigB_uid44_fpFusedAddSubTest_b_7_q;

    -- invEffSub_uid134_fpFusedAddSubTest(LOGICAL,133)@7
    invEffSub_uid134_fpFusedAddSubTest_q <= not (effSub_uid45_fpFusedAddSubTest_q);

    -- excI_sigb_uid34_fpFusedAddSubTest(LOGICAL,33)@7
    excI_sigb_uid34_fpFusedAddSubTest_q <= redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6_q and redist36_fracXIsZero_uid32_fpFusedAddSubTest_q_5_q;

    -- excI_siga_uid20_fpFusedAddSubTest(LOGICAL,19)@7
    excI_siga_uid20_fpFusedAddSubTest_q <= expXIsMax_uid17_fpFusedAddSubTest_q and redist45_fracXIsZero_uid18_fpFusedAddSubTest_q_3_q;

    -- infPinfForSub_uid135_fpFusedAddSubTest(LOGICAL,134)@7
    infPinfForSub_uid135_fpFusedAddSubTest_q <= excI_siga_uid20_fpFusedAddSubTest_q and excI_sigb_uid34_fpFusedAddSubTest_q and invEffSub_uid134_fpFusedAddSubTest_q;

    -- excRNaNS_uid136_fpFusedAddSubTest(LOGICAL,135)@7
    excRNaNS_uid136_fpFusedAddSubTest_q <= infPinfForSub_uid135_fpFusedAddSubTest_q or excN_siga_uid21_fpFusedAddSubTest_q or excN_sigb_uid35_fpFusedAddSubTest_q;

    -- invExcRNaNS_uid184_fpFusedAddSubTest(LOGICAL,183)@7
    invExcRNaNS_uid184_fpFusedAddSubTest_q <= not (excRNaNS_uid136_fpFusedAddSubTest_q);

    -- signRPostExcSub_uid185_fpFusedAddSubTest(LOGICAL,184)@7 + 1
    signRPostExcSub_uid185_fpFusedAddSubTest_qi <= invExcRNaNS_uid184_fpFusedAddSubTest_q and redist16_signRPostExcSub0_uid183_fpFusedAddSubTest_q_7_q and invSignInputsZeroForSub_uid176_fpFusedAddSubTest_q and invPositiveExc_uid174_fpFusedAddSubTest_q;
    signRPostExcSub_uid185_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub_uid185_fpFusedAddSubTest_qi, xout => signRPostExcSub_uid185_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist15_signRPostExcSub_uid185_fpFusedAddSubTest_q_2(DELAY,397)
    redist15_signRPostExcSub_uid185_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExcSub_uid185_fpFusedAddSubTest_q, xout => redist15_signRPostExcSub_uid185_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- cRBit_sub_uid94_fpFusedAddSubTest(CONSTANT,93)
    cRBit_sub_uid94_fpFusedAddSubTest_q <= "01000";

    -- leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,365)@7
    leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest_in(53 downto 0);

    -- leftShiftStage2Idx3_uid367_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,366)@7
    leftShiftStage2Idx3_uid367_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx3Rng3_uid366_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zv_uid68_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,362)@7
    leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest_in(54 downto 0);

    -- leftShiftStage2Idx2_uid364_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,363)@7
    leftShiftStage2Idx2_uid364_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx2Rng2_uid363_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,359)@7
    leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest_in(55 downto 0);

    -- leftShiftStage2Idx1_uid361_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,360)@7
    leftShiftStage2Idx1_uid361_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx1Rng1_uid360_fracPostNormAdd_uid78_fpFusedAddSubTest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,354)@7
    leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest_in(44 downto 0);

    -- leftShiftStage1Idx3_uid356_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,355)@7
    leftShiftStage1Idx3_uid356_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx3Rng12_uid355_fracPostNormAdd_uid78_fpFusedAddSubTest_b & rightShiftStage1Idx3Pad12_uid283_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,351)@7
    leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest_in(48 downto 0);

    -- leftShiftStage1Idx2_uid353_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,352)@7
    leftShiftStage1Idx2_uid353_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx2Rng8_uid352_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,348)@7
    leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest_in(52 downto 0);

    -- leftShiftStage1Idx1_uid350_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,349)@7
    leftShiftStage1Idx1_uid350_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx1Rng4_uid349_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,343)@7
    leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest_in(8 downto 0);

    -- leftShiftStage0Idx3_uid345_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,344)@7
    leftShiftStage0Idx3_uid345_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx3Rng48_uid344_fracPostNormAdd_uid78_fpFusedAddSubTest_b & rightShiftStage0Idx3Pad48_uid272_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- fracResAdd_uid72_fpFusedAddSubTest(ADD,71)@4
    fracResAdd_uid72_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("000" & fracAOp_uid69_fpFusedAddSubTest_q);
    fracResAdd_uid72_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0" & fracBOp_uid70_fpFusedAddSubTest_q);
    fracResAdd_uid72_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_a) + UNSIGNED(fracResAdd_uid72_fpFusedAddSubTest_b));
    fracResAdd_uid72_fpFusedAddSubTest_q <= fracResAdd_uid72_fpFusedAddSubTest_o(58 downto 0);

    -- fracResAddNoSignExt_uid74_fpFusedAddSubTest(BITSELECT,73)@4
    fracResAddNoSignExt_uid74_fpFusedAddSubTest_in <= fracResAdd_uid72_fpFusedAddSubTest_q(56 downto 0);
    fracResAddNoSignExt_uid74_fpFusedAddSubTest_b <= fracResAddNoSignExt_uid74_fpFusedAddSubTest_in(56 downto 0);

    -- redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1(DELAY,408)
    redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 57, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracResAddNoSignExt_uid74_fpFusedAddSubTest_b, xout => redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,229)@5
    vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_in <= redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q(24 downto 0);
    vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b <= vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_in(24 downto 0);

    -- redist8_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_2(DELAY,390)
    redist8_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 25, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b, xout => redist8_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_2_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid342_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,341)@7
    leftShiftStage0Idx2_uid342_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= redist8_vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b_2_q & zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest(BITSELECT,337)@7
    leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest_in <= redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest_b <= leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest_in(40 downto 0);

    -- leftShiftStage0Idx1_uid339_fracPostNormAdd_uid78_fpFusedAddSubTest(BITJOIN,338)@7
    leftShiftStage0Idx1_uid339_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx1Rng16_uid338_fracPostNormAdd_uid78_fpFusedAddSubTest_b & zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3(DELAY,409)
    redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 57, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q, xout => redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,346)@7
    leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b;
    leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_s, redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q, leftShiftStage0Idx1_uid339_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage0Idx2_uid342_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage0Idx3_uid345_fracPostNormAdd_uid78_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= redist27_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_3_q;
            WHEN "01" => leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx1_uid339_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx2_uid342_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0Idx3_uid345_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,357)@7
    leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c;
    leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_s, leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage1Idx1_uid350_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage1Idx2_uid353_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage1Idx3_uid356_fracPostNormAdd_uid78_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage0_uid347_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "01" => leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx1_uid350_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx2_uid353_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1Idx3_uid356_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,226)@5
    rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b <= redist26_fracResAddNoSignExt_uid74_fpFusedAddSubTest_b_1_q(56 downto 25);

    -- vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,227)@5
    vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b = zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist9_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_2(DELAY,391)
    redist9_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist9_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest(BITJOIN,230)@5
    cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest_q <= vStage_uid230_lzCountValAdd_uid77_fpFusedAddSubTest_b & mO_uid192_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,232)@5
    vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s, rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b, cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest_q)
    BEGIN
        CASE (vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid227_lzCountValAdd_uid77_fpFusedAddSubTest_b;
            WHEN "1" => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= cStage_uid231_lzCountValAdd_uid77_fpFusedAddSubTest_q;
            WHEN OTHERS => vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,376)@5
    rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q(31 downto 16);
    rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid233_lzCountValAdd_uid77_fpFusedAddSubTest_q(15 downto 0);

    -- vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,235)@5
    vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid235_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist7_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_2(DELAY,389)
    redist7_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist7_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,238)@5 + 1
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

    -- rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,377)@6
    rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q(15 downto 8);
    rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid239_lzCountValAdd_uid77_fpFusedAddSubTest_q(7 downto 0);

    -- vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,241)@6
    vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist6_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_1(DELAY,388)
    redist6_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist6_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,244)@6
    vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s, rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid241_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,378)@6
    rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q(7 downto 4);
    rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid245_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 0);

    -- vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,247)@6
    vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";

    -- redist5_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1(DELAY,387)
    redist5_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q, xout => redist5_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,250)@6
    vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s, rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q <= rVStage_uid247_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select(BITSELECT,379)@6
    rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b <= vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 2);
    rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c <= vStagei_uid251_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 0);

    -- vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,253)@6 + 1
    vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_qi <= "1" WHEN rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b = zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q ELSE "0";
    vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_qi, xout => vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist2_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1(DELAY,384)
    redist2_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c, xout => redist2_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist1_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1(DELAY,383)
    redist1_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b, xout => redist1_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest(MUX,256)@7
    vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s <= vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q;
    vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_combproc: PROCESS (vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s, redist1_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q, redist2_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_s) IS
            WHEN "0" => vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist1_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist2_rVStage_uid253_lzCountValAdd_uid77_fpFusedAddSubTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest(BITSELECT,258)@7
    rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest_b <= vStagei_uid257_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 1);

    -- vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest(LOGICAL,259)@7
    vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest_q <= "1" WHEN rVStage_uid259_lzCountValAdd_uid77_fpFusedAddSubTest_b = GND_q ELSE "0";

    -- r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest(BITJOIN,260)@7
    r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q <= redist9_vCount_uid228_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q & redist7_vCount_uid236_lzCountValAdd_uid77_fpFusedAddSubTest_q_2_q & redist6_vCount_uid242_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q & redist5_vCount_uid248_lzCountValAdd_uid77_fpFusedAddSubTest_q_1_q & vCount_uid254_lzCountValAdd_uid77_fpFusedAddSubTest_q & vCount_uid260_lzCountValAdd_uid77_fpFusedAddSubTest_q;

    -- leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select(BITSELECT,380)@7
    leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_b <= r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q(5 downto 4);
    leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_c <= r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q(3 downto 2);
    leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d <= r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q(1 downto 0);

    -- leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest(MUX,368)@7
    leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid346_fracPostNormAdd_uid78_fpFusedAddSubTest_merged_bit_select_d;
    leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_s, leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage2Idx1_uid361_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage2Idx2_uid364_fracPostNormAdd_uid78_fpFusedAddSubTest_q, leftShiftStage2Idx3_uid367_fracPostNormAdd_uid78_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage1_uid358_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "01" => leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx1_uid361_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx2_uid364_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= leftShiftStage2Idx3_uid367_fracPostNormAdd_uid78_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_add_uid102_fpFusedAddSubTest(BITSELECT,101)@7
    LSB_add_uid102_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q(4 downto 0));
    LSB_add_uid102_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(LSB_add_uid102_fpFusedAddSubTest_in(4 downto 4));

    -- Guard_add_uid101_fpFusedAddSubTest(BITSELECT,100)@7
    Guard_add_uid101_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q(3 downto 0));
    Guard_add_uid101_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Guard_add_uid101_fpFusedAddSubTest_in(3 downto 3));

    -- Round_add_uid100_fpFusedAddSubTest(BITSELECT,99)@7
    Round_add_uid100_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q(2 downto 0));
    Round_add_uid100_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Round_add_uid100_fpFusedAddSubTest_in(2 downto 2));

    -- sticky1_add_uid99_fpFusedAddSubTest(BITSELECT,98)@7
    sticky1_add_uid99_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q(1 downto 0));
    sticky1_add_uid99_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sticky1_add_uid99_fpFusedAddSubTest_in(1 downto 1));

    -- sticky0_add_uid98_fpFusedAddSubTest(BITSELECT,97)@7
    sticky0_add_uid98_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q(0 downto 0));
    sticky0_add_uid98_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(sticky0_add_uid98_fpFusedAddSubTest_in(0 downto 0));

    -- rndBitCond_add_uid103_fpFusedAddSubTest(BITJOIN,102)@7
    rndBitCond_add_uid103_fpFusedAddSubTest_q <= LSB_add_uid102_fpFusedAddSubTest_b & Guard_add_uid101_fpFusedAddSubTest_b & Round_add_uid100_fpFusedAddSubTest_b & sticky1_add_uid99_fpFusedAddSubTest_b & sticky0_add_uid98_fpFusedAddSubTest_b;

    -- rBi_add_uid105_fpFusedAddSubTest(LOGICAL,104)@7 + 1
    rBi_add_uid105_fpFusedAddSubTest_qi <= "1" WHEN rndBitCond_add_uid103_fpFusedAddSubTest_q = cRBit_sub_uid94_fpFusedAddSubTest_q ELSE "0";
    rBi_add_uid105_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_add_uid105_fpFusedAddSubTest_qi, xout => rBi_add_uid105_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- roundBit_add_uid106_fpFusedAddSubTest(LOGICAL,105)@8
    roundBit_add_uid106_fpFusedAddSubTest_q <= not (rBi_add_uid105_fpFusedAddSubTest_q);

    -- expInc_uid81_fpFusedAddSubTest(ADD,80)@7
    expInc_uid81_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & redist50_exp_siga_uid14_fpFusedAddSubTest_b_7_outputreg_q);
    expInc_uid81_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
    expInc_uid81_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid81_fpFusedAddSubTest_a) + UNSIGNED(expInc_uid81_fpFusedAddSubTest_b));
    expInc_uid81_fpFusedAddSubTest_q <= expInc_uid81_fpFusedAddSubTest_o(11 downto 0);

    -- expPostNormAdd_uid83_fpFusedAddSubTest(SUB,82)@7 + 1
    expPostNormAdd_uid83_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_q);
    expPostNormAdd_uid83_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0000000" & r_uid261_lzCountValAdd_uid77_fpFusedAddSubTest_q);
    expPostNormAdd_uid83_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormAdd_uid83_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_a) - UNSIGNED(expPostNormAdd_uid83_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expPostNormAdd_uid83_fpFusedAddSubTest_q <= expPostNormAdd_uid83_fpFusedAddSubTest_o(12 downto 0);

    -- fracPostNormAddRndRange_uid86_fpFusedAddSubTest(BITSELECT,85)@7
    fracPostNormAddRndRange_uid86_fpFusedAddSubTest_in <= leftShiftStage2_uid369_fracPostNormAdd_uid78_fpFusedAddSubTest_q(55 downto 0);
    fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b <= fracPostNormAddRndRange_uid86_fpFusedAddSubTest_in(55 downto 3);

    -- redist23_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1(DELAY,405)
    redist23_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b, xout => redist23_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- expFracRAdd_uid87_fpFusedAddSubTest(BITJOIN,86)@8
    expFracRAdd_uid87_fpFusedAddSubTest_q <= expPostNormAdd_uid83_fpFusedAddSubTest_q & redist23_fracPostNormAddRndRange_uid86_fpFusedAddSubTest_b_1_q;

    -- expFracRAddPostRound_uid107_fpFusedAddSubTest(ADD,106)@8
    expFracRAddPostRound_uid107_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expFracRAdd_uid87_fpFusedAddSubTest_q);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_add_uid106_fpFusedAddSubTest_q);
    expFracRAddPostRound_uid107_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_a) + UNSIGNED(expFracRAddPostRound_uid107_fpFusedAddSubTest_b));
    expFracRAddPostRound_uid107_fpFusedAddSubTest_q <= expFracRAddPostRound_uid107_fpFusedAddSubTest_o(66 downto 0);

    -- expRPreExcAdd_uid117_fpFusedAddSubTest(BITSELECT,116)@8
    expRPreExcAdd_uid117_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_q(63 downto 0);
    expRPreExcAdd_uid117_fpFusedAddSubTest_b <= expRPreExcAdd_uid117_fpFusedAddSubTest_in(63 downto 53);

    -- leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,329)@7
    leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest_in(53 downto 0);

    -- leftShiftStage2Idx3_uid331_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,330)@7
    leftShiftStage2Idx3_uid331_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx3Rng3_uid330_fracPostNormSub_uid76_fpFusedAddSubTest_b & zv_uid68_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,326)@7
    leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest_in(54 downto 0);

    -- leftShiftStage2Idx2_uid328_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,327)@7
    leftShiftStage2Idx2_uid328_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx2Rng2_uid327_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid215_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,323)@7
    leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest_in(55 downto 0);

    -- leftShiftStage2Idx1_uid325_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,324)@7
    leftShiftStage2Idx1_uid325_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx1Rng1_uid324_fracPostNormSub_uid76_fpFusedAddSubTest_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,318)@7
    leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest_in(44 downto 0);

    -- leftShiftStage1Idx3_uid320_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,319)@7
    leftShiftStage1Idx3_uid320_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx3Rng12_uid319_fracPostNormSub_uid76_fpFusedAddSubTest_b & rightShiftStage1Idx3Pad12_uid283_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,315)@7
    leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest_in(48 downto 0);

    -- leftShiftStage1Idx2_uid317_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,316)@7
    leftShiftStage1Idx2_uid317_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx2Rng8_uid316_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid203_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,312)@7
    leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest_in <= leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest_in(52 downto 0);

    -- leftShiftStage1Idx1_uid314_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,313)@7
    leftShiftStage1Idx1_uid314_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx1Rng4_uid313_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid209_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,307)@7
    leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest_in <= redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest_in(8 downto 0);

    -- leftShiftStage0Idx3_uid309_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,308)@7
    leftShiftStage0Idx3_uid309_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx3Rng48_uid308_fracPostNormSub_uid76_fpFusedAddSubTest_b & rightShiftStage0Idx3Pad48_uid272_alignmentShifter_uid59_fpFusedAddSubTest_q;

    -- redist13_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_2(DELAY,395)
    redist13_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_2 : dspba_delay
    GENERIC MAP ( width => 25, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b, xout => redist13_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_2_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid306_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,305)@7
    leftShiftStage0Idx2_uid306_fracPostNormSub_uid76_fpFusedAddSubTest_q <= redist13_vStage_uid193_lzCountValSub_uid75_fpFusedAddSubTest_b_2_q & zs_uid189_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest(BITSELECT,301)@7
    leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest_in <= redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest_b <= leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest_in(40 downto 0);

    -- leftShiftStage0Idx1_uid303_fracPostNormSub_uid76_fpFusedAddSubTest(BITJOIN,302)@7
    leftShiftStage0Idx1_uid303_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx1Rng16_uid302_fracPostNormSub_uid76_fpFusedAddSubTest_b & zs_uid197_lzCountValSub_uid75_fpFusedAddSubTest_q;

    -- redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3(DELAY,411)
    redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3 : dspba_delay
    GENERIC MAP ( width => 57, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist28_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_1_q, xout => redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q, clk => clk, aclr => areset );

    -- leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,310)@7
    leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b;
    leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_s, redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q, leftShiftStage0Idx1_uid303_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage0Idx2_uid306_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage0Idx3_uid309_fracPostNormSub_uid76_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q <= redist29_fracResSubNoSignExt_uid73_fpFusedAddSubTest_b_3_q;
            WHEN "01" => leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx1_uid303_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx2_uid306_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0Idx3_uid309_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,321)@7
    leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c;
    leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_s, leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage1Idx1_uid314_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage1Idx2_uid317_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage1Idx3_uid320_fracPostNormSub_uid76_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage0_uid311_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "01" => leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx1_uid314_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx2_uid317_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1Idx3_uid320_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select(BITSELECT,375)@7
    leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_b <= r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q(5 downto 4);
    leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_c <= r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q(3 downto 2);
    leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d <= r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q(1 downto 0);

    -- leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest(MUX,332)@7
    leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_s <= leftShiftStageSel5Dto4_uid310_fracPostNormSub_uid76_fpFusedAddSubTest_merged_bit_select_d;
    leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_combproc: PROCESS (leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_s, leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage2Idx1_uid325_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage2Idx2_uid328_fracPostNormSub_uid76_fpFusedAddSubTest_q, leftShiftStage2Idx3_uid331_fracPostNormSub_uid76_fpFusedAddSubTest_q)
    BEGIN
        CASE (leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_s) IS
            WHEN "00" => leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage1_uid322_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "01" => leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx1_uid325_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "10" => leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx2_uid328_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN "11" => leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q <= leftShiftStage2Idx3_uid331_fracPostNormSub_uid76_fpFusedAddSubTest_q;
            WHEN OTHERS => leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_sub_uid92_fpFusedAddSubTest(BITSELECT,91)@7
    LSB_sub_uid92_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q(4 downto 0));
    LSB_sub_uid92_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(LSB_sub_uid92_fpFusedAddSubTest_in(4 downto 4));

    -- Guard_sub_uid91_fpFusedAddSubTest(BITSELECT,90)@7
    Guard_sub_uid91_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q(3 downto 0));
    Guard_sub_uid91_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Guard_sub_uid91_fpFusedAddSubTest_in(3 downto 3));

    -- Round_sub_uid90_fpFusedAddSubTest(BITSELECT,89)@7
    Round_sub_uid90_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q(2 downto 0));
    Round_sub_uid90_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Round_sub_uid90_fpFusedAddSubTest_in(2 downto 2));

    -- Sticky1_sub_uid89_fpFusedAddSubTest(BITSELECT,88)@7
    Sticky1_sub_uid89_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q(1 downto 0));
    Sticky1_sub_uid89_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Sticky1_sub_uid89_fpFusedAddSubTest_in(1 downto 1));

    -- Sticky0_sub_uid88_fpFusedAddSubTest(BITSELECT,87)@7
    Sticky0_sub_uid88_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q(0 downto 0));
    Sticky0_sub_uid88_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(Sticky0_sub_uid88_fpFusedAddSubTest_in(0 downto 0));

    -- rndBitCond_sub_uid93_fpFusedAddSubTest(BITJOIN,92)@7
    rndBitCond_sub_uid93_fpFusedAddSubTest_q <= LSB_sub_uid92_fpFusedAddSubTest_b & Guard_sub_uid91_fpFusedAddSubTest_b & Round_sub_uid90_fpFusedAddSubTest_b & Sticky1_sub_uid89_fpFusedAddSubTest_b & Sticky0_sub_uid88_fpFusedAddSubTest_b;

    -- rBi_sub_uid95_fpFusedAddSubTest(LOGICAL,94)@7 + 1
    rBi_sub_uid95_fpFusedAddSubTest_qi <= "1" WHEN rndBitCond_sub_uid93_fpFusedAddSubTest_q = cRBit_sub_uid94_fpFusedAddSubTest_q ELSE "0";
    rBi_sub_uid95_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_sub_uid95_fpFusedAddSubTest_qi, xout => rBi_sub_uid95_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- roundBit_sub_uid96_fpFusedAddSubTest(LOGICAL,95)@8
    roundBit_sub_uid96_fpFusedAddSubTest_q <= not (rBi_sub_uid95_fpFusedAddSubTest_q);

    -- expPostNormSub_uid82_fpFusedAddSubTest(SUB,81)@7 + 1
    expPostNormSub_uid82_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid81_fpFusedAddSubTest_q);
    expPostNormSub_uid82_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("0000000" & r_uid224_lzCountValSub_uid75_fpFusedAddSubTest_q);
    expPostNormSub_uid82_fpFusedAddSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNormSub_uid82_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_a) - UNSIGNED(expPostNormSub_uid82_fpFusedAddSubTest_b));
        END IF;
    END PROCESS;
    expPostNormSub_uid82_fpFusedAddSubTest_q <= expPostNormSub_uid82_fpFusedAddSubTest_o(12 downto 0);

    -- fracPostNormSubRndRange_uid84_fpFusedAddSubTest(BITSELECT,83)@7
    fracPostNormSubRndRange_uid84_fpFusedAddSubTest_in <= leftShiftStage2_uid333_fracPostNormSub_uid76_fpFusedAddSubTest_q(55 downto 0);
    fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b <= fracPostNormSubRndRange_uid84_fpFusedAddSubTest_in(55 downto 3);

    -- redist24_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1(DELAY,406)
    redist24_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b, xout => redist24_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- expFracRSub_uid85_fpFusedAddSubTest(BITJOIN,84)@8
    expFracRSub_uid85_fpFusedAddSubTest_q <= expPostNormSub_uid82_fpFusedAddSubTest_q & redist24_fracPostNormSubRndRange_uid84_fpFusedAddSubTest_b_1_q;

    -- expFracRSubPostRound_uid97_fpFusedAddSubTest(ADD,96)@8
    expFracRSubPostRound_uid97_fpFusedAddSubTest_a <= STD_LOGIC_VECTOR("0" & expFracRSub_uid85_fpFusedAddSubTest_q);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_sub_uid96_fpFusedAddSubTest_q);
    expFracRSubPostRound_uid97_fpFusedAddSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_a) + UNSIGNED(expFracRSubPostRound_uid97_fpFusedAddSubTest_b));
    expFracRSubPostRound_uid97_fpFusedAddSubTest_q <= expFracRSubPostRound_uid97_fpFusedAddSubTest_o(66 downto 0);

    -- expRPreExcSub_uid114_fpFusedAddSubTest(BITSELECT,113)@8
    expRPreExcSub_uid114_fpFusedAddSubTest_in <= expFracRSubPostRound_uid97_fpFusedAddSubTest_q(63 downto 0);
    expRPreExcSub_uid114_fpFusedAddSubTest_b <= expRPreExcSub_uid114_fpFusedAddSubTest_in(63 downto 53);

    -- redist30_effSub_uid45_fpFusedAddSubTest_q_1(DELAY,412)
    redist30_effSub_uid45_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid45_fpFusedAddSubTest_q, xout => redist30_effSub_uid45_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- expRPreExcSubtraction_uid144_fpFusedAddSubTest(MUX,143)@8 + 1
    expRPreExcSubtraction_uid144_fpFusedAddSubTest_s <= redist30_effSub_uid45_fpFusedAddSubTest_q_1_q;
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

    -- redist19_excRNaNS_uid136_fpFusedAddSubTest_q_2(DELAY,401)
    redist19_excRNaNS_uid136_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNS_uid136_fpFusedAddSubTest_q, xout => redist19_excRNaNS_uid136_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid108_fpFusedAddSubTest(CONSTANT,107)
    wEP2AllOwE_uid108_fpFusedAddSubTest_q <= "0011111111111";

    -- rndExp_uid109_fpFusedAddSubTest(BITSELECT,108)@8
    rndExp_uid109_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_q(65 downto 0);
    rndExp_uid109_fpFusedAddSubTest_b <= rndExp_uid109_fpFusedAddSubTest_in(65 downto 53);

    -- rOvf_uid110_fpFusedAddSubTest(LOGICAL,109)@8 + 1
    rOvf_uid110_fpFusedAddSubTest_qi <= "1" WHEN rndExp_uid109_fpFusedAddSubTest_b = wEP2AllOwE_uid108_fpFusedAddSubTest_q ELSE "0";
    rOvf_uid110_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rOvf_uid110_fpFusedAddSubTest_qi, xout => rOvf_uid110_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid36_fpFusedAddSubTest(LOGICAL,35)@7
    invExpXIsMax_uid36_fpFusedAddSubTest_q <= not (redist37_expXIsMax_uid31_fpFusedAddSubTest_q_6_q);

    -- redist34_InvExpXIsZero_uid37_fpFusedAddSubTest_q_5(DELAY,416)
    redist34_InvExpXIsZero_uid37_fpFusedAddSubTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid37_fpFusedAddSubTest_q, xout => redist34_InvExpXIsZero_uid37_fpFusedAddSubTest_q_5_q, clk => clk, aclr => areset );

    -- excR_sigb_uid38_fpFusedAddSubTest(LOGICAL,37)@7 + 1
    excR_sigb_uid38_fpFusedAddSubTest_qi <= redist34_InvExpXIsZero_uid37_fpFusedAddSubTest_q_5_q and invExpXIsMax_uid36_fpFusedAddSubTest_q;
    excR_sigb_uid38_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_sigb_uid38_fpFusedAddSubTest_qi, xout => excR_sigb_uid38_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist43_excR_siga_uid24_fpFusedAddSubTest_q_1(DELAY,425)
    redist43_excR_siga_uid24_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_siga_uid24_fpFusedAddSubTest_q, xout => redist43_excR_siga_uid24_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- regInputs_uid119_fpFusedAddSubTest(LOGICAL,118)@8 + 1
    regInputs_uid119_fpFusedAddSubTest_qi <= redist43_excR_siga_uid24_fpFusedAddSubTest_q_1_q and excR_sigb_uid38_fpFusedAddSubTest_q;
    regInputs_uid119_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid119_fpFusedAddSubTest_qi, xout => regInputs_uid119_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- regInAndOvf_uid123_fpFusedAddSubTest(LOGICAL,122)@9
    regInAndOvf_uid123_fpFusedAddSubTest_q <= regInputs_uid119_fpFusedAddSubTest_q and rOvf_uid110_fpFusedAddSubTest_q;

    -- redist39_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_7(DELAY,421)
    redist39_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6_q, xout => redist39_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_7_q, clk => clk, aclr => areset );

    -- redist40_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_8(DELAY,422)
    redist40_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_7_q, xout => redist40_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_8_q, clk => clk, aclr => areset );

    -- redist46_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_1(DELAY,428)
    redist46_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_siga_uid9_uid16_fpFusedAddSubTest_q, xout => redist46_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_1_q, clk => clk, aclr => areset );

    -- redist47_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2(DELAY,429)
    redist47_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist46_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_1_q, xout => redist47_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist35_excI_sigb_uid34_fpFusedAddSubTest_q_2(DELAY,417)
    redist35_excI_sigb_uid34_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_sigb_uid34_fpFusedAddSubTest_q, xout => redist35_excI_sigb_uid34_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist44_excI_siga_uid20_fpFusedAddSubTest_q_2(DELAY,426)
    redist44_excI_siga_uid20_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_siga_uid20_fpFusedAddSubTest_q, xout => redist44_excI_siga_uid20_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist31_effSub_uid45_fpFusedAddSubTest_q_2(DELAY,413)
    redist31_effSub_uid45_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_effSub_uid45_fpFusedAddSubTest_q_1_q, xout => redist31_effSub_uid45_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid127_fpFusedAddSubTest(BITJOIN,126)@9
    excRInfVInC_uid127_fpFusedAddSubTest_q <= regInAndOvf_uid123_fpFusedAddSubTest_q & redist40_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_8_q & redist47_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q & redist35_excI_sigb_uid34_fpFusedAddSubTest_q_2_q & redist44_excI_siga_uid20_fpFusedAddSubTest_q_2_q & redist31_effSub_uid45_fpFusedAddSubTest_q_2_q;

    -- excRInfSub_uid130_fpFusedAddSubTest(LOOKUP,129)@9
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

    -- oneIsInfOrZero_uid125_fpFusedAddSubTest(LOGICAL,124)@8 + 1
    oneIsInfOrZero_uid125_fpFusedAddSubTest_qi <= redist43_excR_siga_uid24_fpFusedAddSubTest_q_1_q or excR_sigb_uid38_fpFusedAddSubTest_q or redist46_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_1_q or redist39_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_7_q;
    oneIsInfOrZero_uid125_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInfOrZero_uid125_fpFusedAddSubTest_qi, xout => oneIsInfOrZero_uid125_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- oneIsInf_uid124_fpFusedAddSubTest(LOGICAL,123)@9
    oneIsInf_uid124_fpFusedAddSubTest_q <= redist44_excI_siga_uid20_fpFusedAddSubTest_q_2_q or redist35_excI_sigb_uid34_fpFusedAddSubTest_q_2_q;

    -- addIsAlsoInf_uid126_fpFusedAddSubTest(LOGICAL,125)@9
    addIsAlsoInf_uid126_fpFusedAddSubTest_q <= oneIsInf_uid124_fpFusedAddSubTest_q and oneIsInfOrZero_uid125_fpFusedAddSubTest_q;

    -- excRInfSubFull_uid131_fpFusedAddSubTest(LOGICAL,130)@9
    excRInfSubFull_uid131_fpFusedAddSubTest_q <= addIsAlsoInf_uid126_fpFusedAddSubTest_q or excRInfSub_uid130_fpFusedAddSubTest_q;

    -- redist25_aMinusA_uid80_fpFusedAddSubTest_q_2(DELAY,407)
    redist25_aMinusA_uid80_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid80_fpFusedAddSubTest_q, xout => redist25_aMinusA_uid80_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- signedExp_uid111_fpFusedAddSubTest(BITSELECT,110)@8
    signedExp_uid111_fpFusedAddSubTest_in <= STD_LOGIC_VECTOR(expFracRSubPostRound_uid97_fpFusedAddSubTest_q(65 downto 0));
    signedExp_uid111_fpFusedAddSubTest_b <= STD_LOGIC_VECTOR(signedExp_uid111_fpFusedAddSubTest_in(65 downto 53));

    -- rUdf_uid112_fpFusedAddSubTest(COMPARE,111)@8 + 1
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

    -- excRZeroVInC_uid120_fpFusedAddSubTest(BITJOIN,119)@9
    excRZeroVInC_uid120_fpFusedAddSubTest_q <= redist31_effSub_uid45_fpFusedAddSubTest_q_2_q & redist25_aMinusA_uid80_fpFusedAddSubTest_q_2_q & rUdf_uid112_fpFusedAddSubTest_n & regInputs_uid119_fpFusedAddSubTest_q & redist40_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_8_q & redist47_excZ_siga_uid9_uid16_fpFusedAddSubTest_q_2_q;

    -- excRZeroSub_uid122_fpFusedAddSubTest(LOOKUP,121)@9
    excRZeroSub_uid122_fpFusedAddSubTest_combproc: PROCESS (excRZeroVInC_uid120_fpFusedAddSubTest_q)
    BEGIN
        -- Begin reserved scope level
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
        -- End reserved scope level
    END PROCESS;

    -- concExcSub_uid137_fpFusedAddSubTest(BITJOIN,136)@9
    concExcSub_uid137_fpFusedAddSubTest_q <= redist19_excRNaNS_uid136_fpFusedAddSubTest_q_2_q & excRInfSubFull_uid131_fpFusedAddSubTest_q & excRZeroSub_uid122_fpFusedAddSubTest_q;

    -- excREncSub_uid139_fpFusedAddSubTest(LOOKUP,138)@9
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

    -- expRPostExcSub_uid172_fpFusedAddSubTest(MUX,171)@9
    expRPostExcSub_uid172_fpFusedAddSubTest_s <= excREncSub_uid139_fpFusedAddSubTest_q;
    expRPostExcSub_uid172_fpFusedAddSubTest_combproc: PROCESS (expRPostExcSub_uid172_fpFusedAddSubTest_s, cstAllZWE_uid13_fpFusedAddSubTest_q, expRPreExcSubtraction_uid144_fpFusedAddSubTest_q, cstAllOWE_uid11_fpFusedAddSubTest_q)
    BEGIN
        CASE (expRPostExcSub_uid172_fpFusedAddSubTest_s) IS
            WHEN "00" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q;
            WHEN "01" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= expRPreExcSubtraction_uid144_fpFusedAddSubTest_q;
            WHEN "10" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN "11" => expRPostExcSub_uid172_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN OTHERS => expRPostExcSub_uid172_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid145_fpFusedAddSubTest(CONSTANT,144)
    oneFracRPostExc2_uid145_fpFusedAddSubTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExcAdd_uid116_fpFusedAddSubTest(BITSELECT,115)@8
    fracRPreExcAdd_uid116_fpFusedAddSubTest_in <= expFracRAddPostRound_uid107_fpFusedAddSubTest_q(52 downto 0);
    fracRPreExcAdd_uid116_fpFusedAddSubTest_b <= fracRPreExcAdd_uid116_fpFusedAddSubTest_in(52 downto 1);

    -- redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1(DELAY,403)
    redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcAdd_uid116_fpFusedAddSubTest_b, xout => redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPreExcSub_uid113_fpFusedAddSubTest(BITSELECT,112)@8
    fracRPreExcSub_uid113_fpFusedAddSubTest_in <= expFracRSubPostRound_uid97_fpFusedAddSubTest_q(52 downto 0);
    fracRPreExcSub_uid113_fpFusedAddSubTest_b <= fracRPreExcSub_uid113_fpFusedAddSubTest_in(52 downto 1);

    -- redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1(DELAY,404)
    redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExcSub_uid113_fpFusedAddSubTest_b, xout => redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPreExcSubtraction_uid143_fpFusedAddSubTest(MUX,142)@9
    fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s <= redist31_effSub_uid45_fpFusedAddSubTest_q_2_q;
    fracRPreExcSubtraction_uid143_fpFusedAddSubTest_combproc: PROCESS (fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s, redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q, redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q)
    BEGIN
        CASE (fracRPreExcSubtraction_uid143_fpFusedAddSubTest_s) IS
            WHEN "0" => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q;
            WHEN "1" => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q;
            WHEN OTHERS => fracRPreExcSubtraction_uid143_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExcSub_uid168_fpFusedAddSubTest(MUX,167)@9
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

    -- RDiff_uid186_fpFusedAddSubTest(BITJOIN,185)@9
    RDiff_uid186_fpFusedAddSubTest_q <= redist15_signRPostExcSub_uid185_fpFusedAddSubTest_q_2_q & expRPostExcSub_uid172_fpFusedAddSubTest_q & fracRPostExcSub_uid168_fpFusedAddSubTest_q;

    -- redist18_invXGTEy_uid153_fpFusedAddSubTest_q_7(DELAY,400)
    redist18_invXGTEy_uid153_fpFusedAddSubTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => invXGTEy_uid153_fpFusedAddSubTest_q, xout => redist18_invXGTEy_uid153_fpFusedAddSubTest_q_7_q, clk => clk, aclr => areset );

    -- invSigA_uid154_fpFusedAddSubTest(LOGICAL,153)@7
    invSigA_uid154_fpFusedAddSubTest_q <= not (redist33_sigA_uid43_fpFusedAddSubTest_b_7_q);

    -- signInputsZeroSwap_uid155_fpFusedAddSubTest(LOGICAL,154)@7
    signInputsZeroSwap_uid155_fpFusedAddSubTest_q <= excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6_q and invSigA_uid154_fpFusedAddSubTest_q and redist32_sigB_uid44_fpFusedAddSubTest_b_7_q and redist18_invXGTEy_uid153_fpFusedAddSubTest_q_7_q;

    -- invSignInputsZeroSwap_uid156_fpFusedAddSubTest(LOGICAL,155)@7
    invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q <= not (signInputsZeroSwap_uid155_fpFusedAddSubTest_q);

    -- redist51_xGTEy_uid8_fpFusedAddSubTest_n_7(DELAY,433)
    redist51_xGTEy_uid8_fpFusedAddSubTest_n_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => xGTEy_uid8_fpFusedAddSubTest_n, xout => redist51_xGTEy_uid8_fpFusedAddSubTest_n_7_q, clk => clk, aclr => areset );

    -- invSigB_uid157_fpFusedAddSubTest(LOGICAL,156)@7
    invSigB_uid157_fpFusedAddSubTest_q <= not (redist32_sigB_uid44_fpFusedAddSubTest_b_7_q);

    -- signInputsZeroNoSwap_uid158_fpFusedAddSubTest(LOGICAL,157)@7
    signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q <= excZ_siga_uid9_uid16_fpFusedAddSubTest_q and redist38_excZ_sigb_uid10_uid30_fpFusedAddSubTest_q_6_q and redist33_sigA_uid43_fpFusedAddSubTest_b_7_q and invSigB_uid157_fpFusedAddSubTest_q and redist51_xGTEy_uid8_fpFusedAddSubTest_n_7_q;

    -- invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest(LOGICAL,158)@7
    invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q <= not (signInputsZeroNoSwap_uid158_fpFusedAddSubTest_q);

    -- aMa_uid160_fpFusedAddSubTest(LOGICAL,159)@7
    aMa_uid160_fpFusedAddSubTest_q <= aMinusA_uid80_fpFusedAddSubTest_q and effSub_uid45_fpFusedAddSubTest_q;

    -- invAMA_uid161_fpFusedAddSubTest(LOGICAL,160)@7
    invAMA_uid161_fpFusedAddSubTest_q <= not (aMa_uid160_fpFusedAddSubTest_q);

    -- infMinf_uid132_fpFusedAddSubTest(LOGICAL,131)@7
    infMinf_uid132_fpFusedAddSubTest_q <= excI_siga_uid20_fpFusedAddSubTest_q and excI_sigb_uid34_fpFusedAddSubTest_q and effSub_uid45_fpFusedAddSubTest_q;

    -- excRNaNA_uid133_fpFusedAddSubTest(LOGICAL,132)@7
    excRNaNA_uid133_fpFusedAddSubTest_q <= infMinf_uid132_fpFusedAddSubTest_q or excN_siga_uid21_fpFusedAddSubTest_q or excN_sigb_uid35_fpFusedAddSubTest_q;

    -- invExcRNaNA_uid162_fpFusedAddSubTest(LOGICAL,161)@7
    invExcRNaNA_uid162_fpFusedAddSubTest_q <= not (excRNaNA_uid133_fpFusedAddSubTest_q);

    -- signRPostExc_uid163_fpFusedAddSubTest(LOGICAL,162)@7 + 1
    signRPostExc_uid163_fpFusedAddSubTest_qi <= invExcRNaNA_uid162_fpFusedAddSubTest_q and redist33_sigA_uid43_fpFusedAddSubTest_b_7_q and invAMA_uid161_fpFusedAddSubTest_q and invSignInputsZeroNoSwap_uid159_fpFusedAddSubTest_q and invSignInputsZeroSwap_uid156_fpFusedAddSubTest_q;
    signRPostExc_uid163_fpFusedAddSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid163_fpFusedAddSubTest_qi, xout => signRPostExc_uid163_fpFusedAddSubTest_q, clk => clk, aclr => areset );

    -- redist17_signRPostExc_uid163_fpFusedAddSubTest_q_2(DELAY,399)
    redist17_signRPostExc_uid163_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid163_fpFusedAddSubTest_q, xout => redist17_signRPostExc_uid163_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- expRPreExcAddition_uid142_fpFusedAddSubTest(MUX,141)@8 + 1
    expRPreExcAddition_uid142_fpFusedAddSubTest_s <= redist30_effSub_uid45_fpFusedAddSubTest_q_1_q;
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

    -- redist20_excRNaNA_uid133_fpFusedAddSubTest_q_2(DELAY,402)
    redist20_excRNaNA_uid133_fpFusedAddSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaNA_uid133_fpFusedAddSubTest_q, xout => redist20_excRNaNA_uid133_fpFusedAddSubTest_q_2_q, clk => clk, aclr => areset );

    -- excRInfAdd_uid128_fpFusedAddSubTest(LOOKUP,127)@9
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

    -- excRInfAddFull_uid129_fpFusedAddSubTest(LOGICAL,128)@9
    excRInfAddFull_uid129_fpFusedAddSubTest_q <= addIsAlsoInf_uid126_fpFusedAddSubTest_q or excRInfAdd_uid128_fpFusedAddSubTest_q;

    -- excRZeroAdd_uid121_fpFusedAddSubTest(LOOKUP,120)@9
    excRZeroAdd_uid121_fpFusedAddSubTest_combproc: PROCESS (excRZeroVInC_uid120_fpFusedAddSubTest_q)
    BEGIN
        -- Begin reserved scope level
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
        -- End reserved scope level
    END PROCESS;

    -- concExcAdd_uid138_fpFusedAddSubTest(BITJOIN,137)@9
    concExcAdd_uid138_fpFusedAddSubTest_q <= redist20_excRNaNA_uid133_fpFusedAddSubTest_q_2_q & excRInfAddFull_uid129_fpFusedAddSubTest_q & excRZeroAdd_uid121_fpFusedAddSubTest_q;

    -- excREncAdd_uid140_fpFusedAddSubTest(LOOKUP,139)@9
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

    -- expRPostExcAdd_uid152_fpFusedAddSubTest(MUX,151)@9
    expRPostExcAdd_uid152_fpFusedAddSubTest_s <= excREncAdd_uid140_fpFusedAddSubTest_q;
    expRPostExcAdd_uid152_fpFusedAddSubTest_combproc: PROCESS (expRPostExcAdd_uid152_fpFusedAddSubTest_s, cstAllZWE_uid13_fpFusedAddSubTest_q, expRPreExcAddition_uid142_fpFusedAddSubTest_q, cstAllOWE_uid11_fpFusedAddSubTest_q)
    BEGIN
        CASE (expRPostExcAdd_uid152_fpFusedAddSubTest_s) IS
            WHEN "00" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllZWE_uid13_fpFusedAddSubTest_q;
            WHEN "01" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= expRPreExcAddition_uid142_fpFusedAddSubTest_q;
            WHEN "10" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN "11" => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= cstAllOWE_uid11_fpFusedAddSubTest_q;
            WHEN OTHERS => expRPostExcAdd_uid152_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExcAddition_uid141_fpFusedAddSubTest(MUX,140)@9
    fracRPreExcAddition_uid141_fpFusedAddSubTest_s <= redist31_effSub_uid45_fpFusedAddSubTest_q_2_q;
    fracRPreExcAddition_uid141_fpFusedAddSubTest_combproc: PROCESS (fracRPreExcAddition_uid141_fpFusedAddSubTest_s, redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q, redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q)
    BEGIN
        CASE (fracRPreExcAddition_uid141_fpFusedAddSubTest_s) IS
            WHEN "0" => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= redist21_fracRPreExcAdd_uid116_fpFusedAddSubTest_b_1_q;
            WHEN "1" => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= redist22_fracRPreExcSub_uid113_fpFusedAddSubTest_b_1_q;
            WHEN OTHERS => fracRPreExcAddition_uid141_fpFusedAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExcAdd_uid148_fpFusedAddSubTest(MUX,147)@9
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

    -- RSum_uid164_fpFusedAddSubTest(BITJOIN,163)@9
    RSum_uid164_fpFusedAddSubTest_q <= redist17_signRPostExc_uid163_fpFusedAddSubTest_q_2_q & expRPostExcAdd_uid152_fpFusedAddSubTest_q & fracRPostExcAdd_uid148_fpFusedAddSubTest_q;

    -- xOut(GPOUT,4)@9
    q <= RSum_uid164_fpFusedAddSubTest_q;
    s <= RDiff_uid186_fpFusedAddSubTest_q;

END normal;
