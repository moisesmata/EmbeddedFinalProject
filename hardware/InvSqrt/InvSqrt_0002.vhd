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

-- VHDL created from InvSqrt_0002
-- VHDL created on Wed Apr 23 14:08:14 2025


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

entity InvSqrt_0002 is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end InvSqrt_0002;

architecture normal of InvSqrt_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpInvSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstAllZWF_uid7_fpInvSqrtTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstNaNWF_uid8_fpInvSqrtTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid9_fpInvSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cst3BiasM1o2M1_uid10_fpInvSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cst3BiasP1o2M1_uid11_fpInvSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal exp_x_uid16_fpInvSqrtTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_x_uid17_fpInvSqrtTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_x_uid18_fpInvSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid18_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid19_fpInvSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid19_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid21_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid22_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid28_fpInvSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal evenOddExp_uid30_fpInvSqrtTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal evenOddExp_uid30_fpInvSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal addrYFull_uid31_fpInvSqrtTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal yAddr_uid33_fpInvSqrtTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPPolyEval_uid34_fpInvSqrtTest_in : STD_LOGIC_VECTOR (43 downto 0);
    signal yPPolyEval_uid34_fpInvSqrtTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal fxpInvSqrtRes_uid36_fpInvSqrtTest_in : STD_LOGIC_VECTOR (57 downto 0);
    signal fxpInvSqrtRes_uid36_fpInvSqrtTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal concFracXIsZeroOddEvenSel_uid39_fpInvSqrtTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cstSel_uid40_fpInvSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal cstSel_uid40_fpInvSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expRExt_uid41_fpInvSqrtTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRExt_uid42_fpInvSqrtTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expRExt_uid42_fpInvSqrtTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRExt_uid42_fpInvSqrtTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expRExt_uid42_fpInvSqrtTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid43_fpInvSqrtTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid43_fpInvSqrtTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fxpInverseResFrac_uid44_fpInvSqrtTest_in : STD_LOGIC_VECTOR (51 downto 0);
    signal fxpInverseResFrac_uid44_fpInvSqrtTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal invSignX_uid45_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid46_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid47_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegNeg_uid48_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNOxRNeg_uid49_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRConc_uid50_fpInvSqrtTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid51_fpInvSqrtTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid53_fpInvSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid53_fpInvSqrtTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid54_fpInvSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid54_fpInvSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid55_fpInvSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid55_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid56_fpInvSqrtTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid61_invSqrtTables_q : STD_LOGIC_VECTOR (57 downto 0);
    signal os_uid66_invSqrtTables_q : STD_LOGIC_VECTOR (47 downto 0);
    signal os_uid70_invSqrtTables_q : STD_LOGIC_VECTOR (39 downto 0);
    signal os_uid74_invSqrtTables_q : STD_LOGIC_VECTOR (32 downto 0);
    signal os_uid78_invSqrtTables_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yT1_uid89_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal lowRangeB_uid91_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid91_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid92_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal s1sumAHighB_uid93_invPolyEval_a : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid93_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid93_invPolyEval_o : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid93_invPolyEval_q : STD_LOGIC_VECTOR (24 downto 0);
    signal s1_uid94_invPolyEval_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yT2_uid95_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid97_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid97_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid98_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal s2sumAHighB_uid99_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid99_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid99_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid99_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal s2_uid100_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yT3_uid101_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lowRangeB_uid103_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid103_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid104_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal s3sumAHighB_uid105_invPolyEval_a : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid105_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid105_invPolyEval_o : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid105_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid106_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal yT4_uid107_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeB_uid109_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid109_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid110_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s4sumAHighB_uid111_invPolyEval_a : STD_LOGIC_VECTOR (48 downto 0);
    signal s4sumAHighB_uid111_invPolyEval_b : STD_LOGIC_VECTOR (48 downto 0);
    signal s4sumAHighB_uid111_invPolyEval_o : STD_LOGIC_VECTOR (48 downto 0);
    signal s4sumAHighB_uid111_invPolyEval_q : STD_LOGIC_VECTOR (48 downto 0);
    signal s4_uid112_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal lowRangeB_uid115_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid115_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid116_invPolyEval_b : STD_LOGIC_VECTOR (48 downto 0);
    signal s5sumAHighB_uid117_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal s5sumAHighB_uid117_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal s5sumAHighB_uid117_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal s5sumAHighB_uid117_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal s5_uid118_invPolyEval_q : STD_LOGIC_VECTOR (60 downto 0);
    signal osig_uid121_pT1_uid90_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal osig_uid124_pT2_uid96_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal nx_mergedSignalTM_uid138_pT3_uid102_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aboveLeftY_mergedSignalTM_uid145_pT3_uid102_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid147_pT3_uid102_invPolyEval_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomX_mergedSignalTM_uid149_pT3_uid102_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid155_pT3_uid102_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid155_pT3_uid102_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid156_pT3_uid102_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid158_pT3_uid102_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid159_pT3_uid102_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid159_pT3_uid102_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal nx_mergedSignalTM_uid173_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal topRangeX_uid175_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid176_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid177_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomExtension_uid178_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_mergedSignalTM_uid180_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid182_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_mergedSignalTM_uid184_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid186_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid190_pT4_uid108_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid190_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid191_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid193_pT4_uid108_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid194_pT4_uid108_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid194_pT4_uid108_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal nx_mergedSignalTM_uid208_pT5_uid114_invPolyEval_q : STD_LOGIC_VECTOR (44 downto 0);
    signal aboveLeftY_mergedSignalTM_uid215_pT5_uid114_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid217_pT5_uid114_invPolyEval_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_mergedSignalTM_uid219_pT5_uid114_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal lowRangeB_uid225_pT5_uid114_invPolyEval_in : STD_LOGIC_VECTOR (26 downto 0);
    signal lowRangeB_uid225_pT5_uid114_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal highBBits_uid226_pT5_uid114_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid228_pT5_uid114_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid229_pT5_uid114_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid229_pT5_uid114_invPolyEval_b : STD_LOGIC_VECTOR (50 downto 0);
    signal z0_uid231_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid231_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq0_uid233_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z1_uid234_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal z1_uid234_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq1_uid236_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z2_uid237_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal z2_uid237_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq2_uid239_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z3_uid240_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal z3_uid240_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq3_uid242_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z4_uid243_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal z4_uid243_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq4_uid245_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z5_uid246_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal z5_uid246_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq5_uid248_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z6_uid249_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal z6_uid249_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq6_uid251_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z7_uid252_fracXIsZero_uid20_fpInvSqrtTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal z7_uid252_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal eq7_uid254_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal z8_uid255_fracXIsZero_uid20_fpInvSqrtTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal eq8_uid257_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memoryC0_uid58_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid58_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid58_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid58_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid58_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid58_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid59_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid59_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid59_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid59_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid59_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid59_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid60_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid60_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid60_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid60_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid60_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid60_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid63_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid63_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid63_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid63_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid64_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid64_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid64_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid64_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid64_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid64_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid65_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid65_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid65_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid65_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid65_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid65_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid68_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid68_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid68_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid68_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid68_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid68_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid69_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid69_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid69_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid69_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid69_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid69_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC3_uid72_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid72_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC3_uid72_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid72_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid72_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC3_uid72_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC3_uid73_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid73_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC3_uid73_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid73_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid73_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC3_uid73_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC4_uid76_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid76_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC4_uid76_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC4_uid76_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC4_uid76_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC4_uid76_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC4_uid77_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid77_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC4_uid77_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC4_uid77_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC4_uid77_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC4_uid77_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC5_uid80_invSqrtTables_lutmem_reset0 : std_logic;
    signal memoryC5_uid80_invSqrtTables_lutmem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal memoryC5_uid80_invSqrtTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC5_uid80_invSqrtTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC5_uid80_invSqrtTables_lutmem_ir : STD_LOGIC_VECTOR (14 downto 0);
    signal memoryC5_uid80_invSqrtTables_lutmem_r : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_reset : std_logic;
    type prodXY_uid120_pT1_uid90_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(14 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_a0 : prodXY_uid120_pT1_uid90_invPolyEval_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid120_pT1_uid90_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid120_pT1_uid90_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_c0 : prodXY_uid120_pT1_uid90_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid120_pT1_uid90_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid120_pT1_uid90_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_l : prodXY_uid120_pT1_uid90_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(30 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_p : prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_u : prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_w : prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_x : prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_y : prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_s : prodXY_uid120_pT1_uid90_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_qq : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_q : STD_LOGIC_VECTOR (29 downto 0);
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid120_pT1_uid90_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_reset : std_logic;
    type prodXY_uid123_pT2_uid96_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_a0 : prodXY_uid123_pT2_uid96_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid123_pT2_uid96_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid123_pT2_uid96_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_c0 : prodXY_uid123_pT2_uid96_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid123_pT2_uid96_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid123_pT2_uid96_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_l : prodXY_uid123_pT2_uid96_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(50 downto 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_p : prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_u : prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_w : prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_x : prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_y : prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_s : prodXY_uid123_pT2_uid96_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid123_pT2_uid96_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_reset : std_logic;
    type sm0_uid152_pT3_uid102_invPolyEval_cma_a0type is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_a0 : sm0_uid152_pT3_uid102_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid152_pT3_uid102_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_c0 : sm0_uid152_pT3_uid102_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid152_pT3_uid102_invPolyEval_cma_c0 : signal is true;
    type sm0_uid152_pT3_uid102_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(35 downto 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_p : sm0_uid152_pT3_uid102_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_u : sm0_uid152_pT3_uid102_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_w : sm0_uid152_pT3_uid102_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_x : sm0_uid152_pT3_uid102_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_y : sm0_uid152_pT3_uid102_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_s : sm0_uid152_pT3_uid102_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid152_pT3_uid102_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_reset : std_logic;
    type sm0_uid187_pT4_uid108_invPolyEval_cma_a0type is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_a0 : sm0_uid187_pT4_uid108_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid187_pT4_uid108_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_c0 : sm0_uid187_pT4_uid108_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid187_pT4_uid108_invPolyEval_cma_c0 : signal is true;
    type sm0_uid187_pT4_uid108_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(53 downto 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_p : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_u : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_w : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_x : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_y : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_s : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid187_pT4_uid108_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_reset : std_logic;
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_a0 : sm0_uid187_pT4_uid108_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid222_pT5_uid114_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_c0 : sm0_uid187_pT4_uid108_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid222_pT5_uid114_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_p : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_u : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_w : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_x : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_y : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_s : sm0_uid187_pT4_uid108_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid222_pT5_uid114_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0 : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0 : sm0_uid152_pT3_uid102_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0 : signal is true;
    type multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_l : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ltype(0 to 1);
    type multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(36 downto 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_p : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(37 downto 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_u : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_w : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_x : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_y : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_s : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0 : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0 : sm0_uid152_pT3_uid102_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_l : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ltype(0 to 1);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_p : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_u : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_w : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_x : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_y : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_s : multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0 : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0 : sm0_uid187_pT4_uid108_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0 : signal is true;
    type multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(27 downto 0);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_l : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ltype(0 to 1);
    type multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(54 downto 0);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_p : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(55 downto 0);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_u : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_w : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_x : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_y : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_s : multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena1 : std_logic;
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist1_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist2_topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist3_multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist4_multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist5_multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist6_sm0_uid222_pT5_uid114_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist7_sm0_uid187_pT4_uid108_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist8_sm0_uid152_pT3_uid102_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist9_memoryC5_uid80_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist10_memoryC4_uid77_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_memoryC4_uid76_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist12_memoryC3_uid73_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist13_memoryC3_uid72_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist14_memoryC2_uid69_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist15_memoryC2_uid68_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist16_memoryC1_uid65_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_memoryC1_uid64_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist18_memoryC1_uid63_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist19_memoryC0_uid60_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist20_memoryC0_uid59_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist21_memoryC0_uid58_invSqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist22_os_uid229_pT5_uid114_invPolyEval_b_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal redist23_os_uid194_pT4_uid108_invPolyEval_b_1_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist24_os_uid159_pT3_uid102_invPolyEval_b_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist25_osig_uid124_pT2_uid96_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist26_osig_uid121_pT1_uid90_invPolyEval_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist27_lowRangeB_uid109_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_lowRangeB_uid103_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_lowRangeB_uid97_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_lowRangeB_uid91_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_signR_uid55_fpInvSqrtTest_q_25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_fxpInverseResFrac_uid44_fpInvSqrtTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist35_expRExt_uid41_fpInvSqrtTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist41_yAddr_uid33_fpInvSqrtTest_b_3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist42_yAddr_uid33_fpInvSqrtTest_b_7_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist43_yAddr_uid33_fpInvSqrtTest_b_12_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist44_yAddr_uid33_fpInvSqrtTest_b_17_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist45_yAddr_uid33_fpInvSqrtTest_b_23_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist46_evenOddExp_uid30_fpInvSqrtTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_signX_uid28_fpInvSqrtTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_exp_x_uid16_fpInvSqrtTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_inputreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_outputreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_reset0 : std_logic;
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_iq : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i : signal is true;
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_eq : std_logic;
    attribute preserve of redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_eq : signal is true;
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_q : signal is true;
    signal redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_reset0 : std_logic;
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i : signal is true;
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_eq : std_logic;
    attribute preserve of redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_eq : signal is true;
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_q : signal is true;
    signal redist34_expR_uid43_fpInvSqrtTest_b_25_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_inputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_inputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_outputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_inputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_outputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_inputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_outputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_reset0 : std_logic;
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_ia : STD_LOGIC_VECTOR (43 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_iq : STD_LOGIC_VECTOR (43 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_i : signal is true;
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_q : signal is true;
    signal redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_inputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_outputreg_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_reset0 : std_logic;
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_ia : STD_LOGIC_VECTOR (43 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_iq : STD_LOGIC_VECTOR (43 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_i : signal is true;
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_q : signal is true;
    signal redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_yAddr_uid33_fpInvSqrtTest_b_12_inputreg_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist44_yAddr_uid33_fpInvSqrtTest_b_17_inputreg_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist45_yAddr_uid33_fpInvSqrtTest_b_23_inputreg_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg_q : STD_LOGIC_VECTOR (8 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signX_uid28_fpInvSqrtTest(BITSELECT,27)@0
    signX_uid28_fpInvSqrtTest_b <= STD_LOGIC_VECTOR(a(63 downto 63));

    -- redist47_signX_uid28_fpInvSqrtTest_b_2(DELAY,333)
    redist47_signX_uid28_fpInvSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid28_fpInvSqrtTest_b, xout => redist47_signX_uid28_fpInvSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid9_fpInvSqrtTest(CONSTANT,8)
    cstAllZWE_uid9_fpInvSqrtTest_q <= "00000000000";

    -- exp_x_uid16_fpInvSqrtTest(BITSELECT,15)@0
    exp_x_uid16_fpInvSqrtTest_b <= a(62 downto 52);

    -- redist48_exp_x_uid16_fpInvSqrtTest_b_1(DELAY,334)
    redist48_exp_x_uid16_fpInvSqrtTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_x_uid16_fpInvSqrtTest_b, xout => redist48_exp_x_uid16_fpInvSqrtTest_b_1_q, clk => clk, aclr => areset );

    -- excZ_x_uid18_fpInvSqrtTest(LOGICAL,17)@1 + 1
    excZ_x_uid18_fpInvSqrtTest_qi <= "1" WHEN redist48_exp_x_uid16_fpInvSqrtTest_b_1_q = cstAllZWE_uid9_fpInvSqrtTest_q ELSE "0";
    excZ_x_uid18_fpInvSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid18_fpInvSqrtTest_qi, xout => excZ_x_uid18_fpInvSqrtTest_q, clk => clk, aclr => areset );

    -- signR_uid55_fpInvSqrtTest(LOGICAL,54)@2 + 1
    signR_uid55_fpInvSqrtTest_qi <= excZ_x_uid18_fpInvSqrtTest_q and redist47_signX_uid28_fpInvSqrtTest_b_2_q;
    signR_uid55_fpInvSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid55_fpInvSqrtTest_qi, xout => signR_uid55_fpInvSqrtTest_q, clk => clk, aclr => areset );

    -- redist31_signR_uid55_fpInvSqrtTest_q_25(DELAY,317)
    redist31_signR_uid55_fpInvSqrtTest_q_25 : dspba_delay
    GENERIC MAP ( width => 1, depth => 24, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid55_fpInvSqrtTest_q, xout => redist31_signR_uid55_fpInvSqrtTest_q_25_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid6_fpInvSqrtTest(CONSTANT,5)
    cstAllOWE_uid6_fpInvSqrtTest_q <= "11111111111";

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_notEnable(LOGICAL,355)
    redist34_expR_uid43_fpInvSqrtTest_b_25_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_nor(LOGICAL,356)
    redist34_expR_uid43_fpInvSqrtTest_b_25_nor_q <= not (redist34_expR_uid43_fpInvSqrtTest_b_25_notEnable_q or redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_q);

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_mem_last(CONSTANT,352)
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_last_q <= "010100";

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_cmp(LOGICAL,353)
    redist34_expR_uid43_fpInvSqrtTest_b_25_cmp_b <= STD_LOGIC_VECTOR("0" & redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_q);
    redist34_expR_uid43_fpInvSqrtTest_b_25_cmp_q <= "1" WHEN redist34_expR_uid43_fpInvSqrtTest_b_25_mem_last_q = redist34_expR_uid43_fpInvSqrtTest_b_25_cmp_b ELSE "0";

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_cmpReg(REG,354)
    redist34_expR_uid43_fpInvSqrtTest_b_25_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expR_uid43_fpInvSqrtTest_b_25_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist34_expR_uid43_fpInvSqrtTest_b_25_cmpReg_q <= STD_LOGIC_VECTOR(redist34_expR_uid43_fpInvSqrtTest_b_25_cmp_q);
        END IF;
    END PROCESS;

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena(REG,357)
    redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist34_expR_uid43_fpInvSqrtTest_b_25_nor_q = "1") THEN
                redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_q <= STD_LOGIC_VECTOR(redist34_expR_uid43_fpInvSqrtTest_b_25_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_enaAnd(LOGICAL,358)
    redist34_expR_uid43_fpInvSqrtTest_b_25_enaAnd_q <= redist34_expR_uid43_fpInvSqrtTest_b_25_sticky_ena_q and VCC_q;

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt(COUNTER,350)
    -- low=0, high=21, step=1, init=0
    redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_eq <= '1';
            ELSE
                redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_eq <= '0';
            END IF;
            IF (redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_eq = '1') THEN
                redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i <= redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i + 11;
            ELSE
                redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i <= redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_i, 5)));

    -- expRExt_uid41_fpInvSqrtTest(BITSELECT,40)@1
    expRExt_uid41_fpInvSqrtTest_b <= redist48_exp_x_uid16_fpInvSqrtTest_b_1_q(10 downto 1);

    -- redist35_expRExt_uid41_fpInvSqrtTest_b_1(DELAY,321)
    redist35_expRExt_uid41_fpInvSqrtTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRExt_uid41_fpInvSqrtTest_b, xout => redist35_expRExt_uid41_fpInvSqrtTest_b_1_q, clk => clk, aclr => areset );

    -- cst3BiasM1o2M1_uid10_fpInvSqrtTest(CONSTANT,9)
    cst3BiasM1o2M1_uid10_fpInvSqrtTest_q <= "10111111101";

    -- cst3BiasP1o2M1_uid11_fpInvSqrtTest(CONSTANT,10)
    cst3BiasP1o2M1_uid11_fpInvSqrtTest_q <= "10111111110";

    -- cstAllZWF_uid7_fpInvSqrtTest(CONSTANT,6)
    cstAllZWF_uid7_fpInvSqrtTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select(BITSELECT,281)
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_b <= cstAllZWF_uid7_fpInvSqrtTest_q(5 downto 0);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_c <= cstAllZWF_uid7_fpInvSqrtTest_q(11 downto 6);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_d <= cstAllZWF_uid7_fpInvSqrtTest_q(17 downto 12);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_e <= cstAllZWF_uid7_fpInvSqrtTest_q(23 downto 18);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_f <= cstAllZWF_uid7_fpInvSqrtTest_q(29 downto 24);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_g <= cstAllZWF_uid7_fpInvSqrtTest_q(35 downto 30);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_h <= cstAllZWF_uid7_fpInvSqrtTest_q(41 downto 36);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_i <= cstAllZWF_uid7_fpInvSqrtTest_q(47 downto 42);
    c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_j <= cstAllZWF_uid7_fpInvSqrtTest_q(51 downto 48);

    -- frac_x_uid17_fpInvSqrtTest(BITSELECT,16)@0
    frac_x_uid17_fpInvSqrtTest_b <= a(51 downto 0);

    -- z8_uid255_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,254)@0
    z8_uid255_fracXIsZero_uid20_fpInvSqrtTest_b <= frac_x_uid17_fpInvSqrtTest_b(51 downto 48);

    -- eq8_uid257_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,256)@0
    eq8_uid257_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z8_uid255_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_j ELSE "0";

    -- z7_uid252_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,251)@0
    z7_uid252_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(47 downto 0);
    z7_uid252_fracXIsZero_uid20_fpInvSqrtTest_b <= z7_uid252_fracXIsZero_uid20_fpInvSqrtTest_in(47 downto 42);

    -- eq7_uid254_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,253)@0
    eq7_uid254_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z7_uid252_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_i ELSE "0";

    -- z6_uid249_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,248)@0
    z6_uid249_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(41 downto 0);
    z6_uid249_fracXIsZero_uid20_fpInvSqrtTest_b <= z6_uid249_fracXIsZero_uid20_fpInvSqrtTest_in(41 downto 36);

    -- eq6_uid251_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,250)@0
    eq6_uid251_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z6_uid249_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,258)@0 + 1
    and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_qi <= eq6_uid251_fracXIsZero_uid20_fpInvSqrtTest_q and eq7_uid254_fracXIsZero_uid20_fpInvSqrtTest_q and eq8_uid257_fracXIsZero_uid20_fpInvSqrtTest_q;
    and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_qi, xout => and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_q, clk => clk, aclr => areset );

    -- z5_uid246_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,245)@0
    z5_uid246_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(35 downto 0);
    z5_uid246_fracXIsZero_uid20_fpInvSqrtTest_b <= z5_uid246_fracXIsZero_uid20_fpInvSqrtTest_in(35 downto 30);

    -- eq5_uid248_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,247)@0
    eq5_uid248_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z5_uid246_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_g ELSE "0";

    -- z4_uid243_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,242)@0
    z4_uid243_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(29 downto 0);
    z4_uid243_fracXIsZero_uid20_fpInvSqrtTest_b <= z4_uid243_fracXIsZero_uid20_fpInvSqrtTest_in(29 downto 24);

    -- eq4_uid245_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,244)@0
    eq4_uid245_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z4_uid243_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_f ELSE "0";

    -- z3_uid240_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,239)@0
    z3_uid240_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(23 downto 0);
    z3_uid240_fracXIsZero_uid20_fpInvSqrtTest_b <= z3_uid240_fracXIsZero_uid20_fpInvSqrtTest_in(23 downto 18);

    -- eq3_uid242_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,241)@0
    eq3_uid242_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z3_uid240_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_e ELSE "0";

    -- z2_uid237_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,236)@0
    z2_uid237_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(17 downto 0);
    z2_uid237_fracXIsZero_uid20_fpInvSqrtTest_b <= z2_uid237_fracXIsZero_uid20_fpInvSqrtTest_in(17 downto 12);

    -- eq2_uid239_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,238)@0
    eq2_uid239_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z2_uid237_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_d ELSE "0";

    -- z1_uid234_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,233)@0
    z1_uid234_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(11 downto 0);
    z1_uid234_fracXIsZero_uid20_fpInvSqrtTest_b <= z1_uid234_fracXIsZero_uid20_fpInvSqrtTest_in(11 downto 6);

    -- eq1_uid236_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,235)@0
    eq1_uid236_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z1_uid234_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_c ELSE "0";

    -- z0_uid231_fracXIsZero_uid20_fpInvSqrtTest(BITSELECT,230)@0
    z0_uid231_fracXIsZero_uid20_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(5 downto 0);
    z0_uid231_fracXIsZero_uid20_fpInvSqrtTest_b <= z0_uid231_fracXIsZero_uid20_fpInvSqrtTest_in(5 downto 0);

    -- eq0_uid233_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,232)@0
    eq0_uid233_fracXIsZero_uid20_fpInvSqrtTest_q <= "1" WHEN z0_uid231_fracXIsZero_uid20_fpInvSqrtTest_b = c0_uid232_fracXIsZero_uid20_fpInvSqrtTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,257)@0 + 1
    and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_qi <= eq0_uid233_fracXIsZero_uid20_fpInvSqrtTest_q and eq1_uid236_fracXIsZero_uid20_fpInvSqrtTest_q and eq2_uid239_fracXIsZero_uid20_fpInvSqrtTest_q and eq3_uid242_fracXIsZero_uid20_fpInvSqrtTest_q and eq4_uid245_fracXIsZero_uid20_fpInvSqrtTest_q and eq5_uid248_fracXIsZero_uid20_fpInvSqrtTest_q;
    and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_qi, xout => and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest(LOGICAL,259)@1 + 1
    and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_qi <= and_lev0_uid258_fracXIsZero_uid20_fpInvSqrtTest_q and and_lev0_uid259_fracXIsZero_uid20_fpInvSqrtTest_q;
    and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_qi, xout => and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_q, clk => clk, aclr => areset );

    -- evenOddExp_uid30_fpInvSqrtTest(BITSELECT,29)@0
    evenOddExp_uid30_fpInvSqrtTest_in <= STD_LOGIC_VECTOR(exp_x_uid16_fpInvSqrtTest_b(0 downto 0));
    evenOddExp_uid30_fpInvSqrtTest_b <= STD_LOGIC_VECTOR(evenOddExp_uid30_fpInvSqrtTest_in(0 downto 0));

    -- redist46_evenOddExp_uid30_fpInvSqrtTest_b_2(DELAY,332)
    redist46_evenOddExp_uid30_fpInvSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => evenOddExp_uid30_fpInvSqrtTest_b, xout => redist46_evenOddExp_uid30_fpInvSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- concFracXIsZeroOddEvenSel_uid39_fpInvSqrtTest(BITJOIN,38)@2
    concFracXIsZeroOddEvenSel_uid39_fpInvSqrtTest_q <= and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_q & redist46_evenOddExp_uid30_fpInvSqrtTest_b_2_q;

    -- cstSel_uid40_fpInvSqrtTest(MUX,39)@2
    cstSel_uid40_fpInvSqrtTest_s <= concFracXIsZeroOddEvenSel_uid39_fpInvSqrtTest_q;
    cstSel_uid40_fpInvSqrtTest_combproc: PROCESS (cstSel_uid40_fpInvSqrtTest_s, cst3BiasP1o2M1_uid11_fpInvSqrtTest_q, cst3BiasM1o2M1_uid10_fpInvSqrtTest_q)
    BEGIN
        CASE (cstSel_uid40_fpInvSqrtTest_s) IS
            WHEN "00" => cstSel_uid40_fpInvSqrtTest_q <= cst3BiasP1o2M1_uid11_fpInvSqrtTest_q;
            WHEN "01" => cstSel_uid40_fpInvSqrtTest_q <= cst3BiasM1o2M1_uid10_fpInvSqrtTest_q;
            WHEN "10" => cstSel_uid40_fpInvSqrtTest_q <= cst3BiasP1o2M1_uid11_fpInvSqrtTest_q;
            WHEN "11" => cstSel_uid40_fpInvSqrtTest_q <= cst3BiasP1o2M1_uid11_fpInvSqrtTest_q;
            WHEN OTHERS => cstSel_uid40_fpInvSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expRExt_uid42_fpInvSqrtTest(SUB,41)@2
    expRExt_uid42_fpInvSqrtTest_a <= STD_LOGIC_VECTOR("0" & cstSel_uid40_fpInvSqrtTest_q);
    expRExt_uid42_fpInvSqrtTest_b <= STD_LOGIC_VECTOR("00" & redist35_expRExt_uid41_fpInvSqrtTest_b_1_q);
    expRExt_uid42_fpInvSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid42_fpInvSqrtTest_a) - UNSIGNED(expRExt_uid42_fpInvSqrtTest_b));
    expRExt_uid42_fpInvSqrtTest_q <= expRExt_uid42_fpInvSqrtTest_o(11 downto 0);

    -- expR_uid43_fpInvSqrtTest(BITSELECT,42)@2
    expR_uid43_fpInvSqrtTest_in <= expRExt_uid42_fpInvSqrtTest_q(10 downto 0);
    expR_uid43_fpInvSqrtTest_b <= expR_uid43_fpInvSqrtTest_in(10 downto 0);

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_inputreg(DELAY,347)
    redist34_expR_uid43_fpInvSqrtTest_b_25_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expR_uid43_fpInvSqrtTest_b, xout => redist34_expR_uid43_fpInvSqrtTest_b_25_inputreg_q, clk => clk, aclr => areset );

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_wraddr(REG,351)
    redist34_expR_uid43_fpInvSqrtTest_b_25_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist34_expR_uid43_fpInvSqrtTest_b_25_wraddr_q <= "10101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist34_expR_uid43_fpInvSqrtTest_b_25_wraddr_q <= STD_LOGIC_VECTOR(redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_mem(DUALMEM,349)
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_ia <= STD_LOGIC_VECTOR(redist34_expR_uid43_fpInvSqrtTest_b_25_inputreg_q);
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_aa <= redist34_expR_uid43_fpInvSqrtTest_b_25_wraddr_q;
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_ab <= redist34_expR_uid43_fpInvSqrtTest_b_25_rdcnt_q;
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_reset0 <= areset;
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 11,
        widthad_b => 5,
        numwords_b => 22,
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
        clocken1 => redist34_expR_uid43_fpInvSqrtTest_b_25_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist34_expR_uid43_fpInvSqrtTest_b_25_mem_reset0,
        clock1 => clk,
        address_a => redist34_expR_uid43_fpInvSqrtTest_b_25_mem_aa,
        data_a => redist34_expR_uid43_fpInvSqrtTest_b_25_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist34_expR_uid43_fpInvSqrtTest_b_25_mem_ab,
        q_b => redist34_expR_uid43_fpInvSqrtTest_b_25_mem_iq
    );
    redist34_expR_uid43_fpInvSqrtTest_b_25_mem_q <= redist34_expR_uid43_fpInvSqrtTest_b_25_mem_iq(10 downto 0);

    -- redist34_expR_uid43_fpInvSqrtTest_b_25_outputreg(DELAY,348)
    redist34_expR_uid43_fpInvSqrtTest_b_25_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist34_expR_uid43_fpInvSqrtTest_b_25_mem_q, xout => redist34_expR_uid43_fpInvSqrtTest_b_25_outputreg_q, clk => clk, aclr => areset );

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_notEnable(LOGICAL,343)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_nor(LOGICAL,344)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_nor_q <= not (redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_notEnable_q or redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_q);

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_last(CONSTANT,340)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_last_q <= "010011";

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp(LOGICAL,341)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp_b <= STD_LOGIC_VECTOR("0" & redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_q);
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp_q <= "1" WHEN redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_last_q = redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp_b ELSE "0";

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmpReg(REG,342)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmpReg_q <= STD_LOGIC_VECTOR(redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmp_q);
        END IF;
    END PROCESS;

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena(REG,345)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_nor_q = "1") THEN
                redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_q <= STD_LOGIC_VECTOR(redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_enaAnd(LOGICAL,346)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_enaAnd_q <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_sticky_ena_q and VCC_q;

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt(COUNTER,338)
    -- low=0, high=20, step=1, init=0
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i = TO_UNSIGNED(19, 5)) THEN
                redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_eq <= '1';
            ELSE
                redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_eq <= '0';
            END IF;
            IF (redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_eq = '1') THEN
                redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i + 12;
            ELSE
                redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_i, 5)));

    -- invExcXZ_uid47_fpInvSqrtTest(LOGICAL,46)@2
    invExcXZ_uid47_fpInvSqrtTest_q <= not (excZ_x_uid18_fpInvSqrtTest_q);

    -- xRegNeg_uid48_fpInvSqrtTest(LOGICAL,47)@2
    xRegNeg_uid48_fpInvSqrtTest_q <= invExcXZ_uid47_fpInvSqrtTest_q and redist47_signX_uid28_fpInvSqrtTest_b_2_q;

    -- fracXIsNotZero_uid21_fpInvSqrtTest(LOGICAL,20)@2
    fracXIsNotZero_uid21_fpInvSqrtTest_q <= not (and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_q);

    -- expXIsMax_uid19_fpInvSqrtTest(LOGICAL,18)@1 + 1
    expXIsMax_uid19_fpInvSqrtTest_qi <= "1" WHEN redist48_exp_x_uid16_fpInvSqrtTest_b_1_q = cstAllOWE_uid6_fpInvSqrtTest_q ELSE "0";
    expXIsMax_uid19_fpInvSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid19_fpInvSqrtTest_qi, xout => expXIsMax_uid19_fpInvSqrtTest_q, clk => clk, aclr => areset );

    -- excN_x_uid23_fpInvSqrtTest(LOGICAL,22)@2
    excN_x_uid23_fpInvSqrtTest_q <= expXIsMax_uid19_fpInvSqrtTest_q and fracXIsNotZero_uid21_fpInvSqrtTest_q;

    -- xNOxRNeg_uid49_fpInvSqrtTest(LOGICAL,48)@2
    xNOxRNeg_uid49_fpInvSqrtTest_q <= excN_x_uid23_fpInvSqrtTest_q or xRegNeg_uid48_fpInvSqrtTest_q;

    -- excI_x_uid22_fpInvSqrtTest(LOGICAL,21)@2
    excI_x_uid22_fpInvSqrtTest_q <= expXIsMax_uid19_fpInvSqrtTest_q and and_lev1_uid260_fracXIsZero_uid20_fpInvSqrtTest_q;

    -- invSignX_uid45_fpInvSqrtTest(LOGICAL,44)@2
    invSignX_uid45_fpInvSqrtTest_q <= not (redist47_signX_uid28_fpInvSqrtTest_b_2_q);

    -- excRZero_uid46_fpInvSqrtTest(LOGICAL,45)@2
    excRZero_uid46_fpInvSqrtTest_q <= invSignX_uid45_fpInvSqrtTest_q and excI_x_uid22_fpInvSqrtTest_q;

    -- excRConc_uid50_fpInvSqrtTest(BITJOIN,49)@2
    excRConc_uid50_fpInvSqrtTest_q <= xNOxRNeg_uid49_fpInvSqrtTest_q & excZ_x_uid18_fpInvSqrtTest_q & excRZero_uid46_fpInvSqrtTest_q;

    -- outMuxSelEnc_uid51_fpInvSqrtTest(LOOKUP,50)@2 + 1
    outMuxSelEnc_uid51_fpInvSqrtTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid51_fpInvSqrtTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRConc_uid50_fpInvSqrtTest_q) IS
                WHEN "000" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "01";
                WHEN "001" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "00";
                WHEN "010" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "10";
                WHEN "011" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "00";
                WHEN "100" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "11";
                WHEN "101" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "00";
                WHEN "110" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "10";
                WHEN "111" => outMuxSelEnc_uid51_fpInvSqrtTest_q <= "01";
                WHEN OTHERS => -- unreachable
                               outMuxSelEnc_uid51_fpInvSqrtTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_inputreg(DELAY,335)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => outMuxSelEnc_uid51_fpInvSqrtTest_q, xout => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_inputreg_q, clk => clk, aclr => areset );

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_wraddr(REG,339)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_wraddr_q <= "10100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_wraddr_q <= STD_LOGIC_VECTOR(redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem(DUALMEM,337)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_ia <= STD_LOGIC_VECTOR(redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_inputreg_q);
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_aa <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_wraddr_q;
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_ab <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_rdcnt_q;
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_reset0 <= areset;
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 2,
        widthad_b => 5,
        numwords_b => 21,
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
        clocken1 => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_reset0,
        clock1 => clk,
        address_a => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_aa,
        data_a => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_ab,
        q_b => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_iq
    );
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_q <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_iq(1 downto 0);

    -- redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_outputreg(DELAY,336)
    redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_outputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_mem_q, xout => redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_outputreg_q, clk => clk, aclr => areset );

    -- expRPostExc_uid54_fpInvSqrtTest(MUX,53)@27
    expRPostExc_uid54_fpInvSqrtTest_s <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_outputreg_q;
    expRPostExc_uid54_fpInvSqrtTest_combproc: PROCESS (expRPostExc_uid54_fpInvSqrtTest_s, cstAllZWE_uid9_fpInvSqrtTest_q, redist34_expR_uid43_fpInvSqrtTest_b_25_outputreg_q, cstAllOWE_uid6_fpInvSqrtTest_q)
    BEGIN
        CASE (expRPostExc_uid54_fpInvSqrtTest_s) IS
            WHEN "00" => expRPostExc_uid54_fpInvSqrtTest_q <= cstAllZWE_uid9_fpInvSqrtTest_q;
            WHEN "01" => expRPostExc_uid54_fpInvSqrtTest_q <= redist34_expR_uid43_fpInvSqrtTest_b_25_outputreg_q;
            WHEN "10" => expRPostExc_uid54_fpInvSqrtTest_q <= cstAllOWE_uid6_fpInvSqrtTest_q;
            WHEN "11" => expRPostExc_uid54_fpInvSqrtTest_q <= cstAllOWE_uid6_fpInvSqrtTest_q;
            WHEN OTHERS => expRPostExc_uid54_fpInvSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid8_fpInvSqrtTest(CONSTANT,7)
    cstNaNWF_uid8_fpInvSqrtTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_notEnable(LOGICAL,380)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_nor(LOGICAL,381)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_nor_q <= not (redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_notEnable_q or redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_q);

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_cmpReg(REG,379)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena(REG,382)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_nor_q = "1") THEN
                redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_q <= STD_LOGIC_VECTOR(redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_enaAnd(LOGICAL,383)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_enaAnd_q <= redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_sticky_ena_q and VCC_q;

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt(COUNTER,377)
    -- low=0, high=1, step=1, init=0
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_i <= redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_i, 1)));

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_notEnable(LOGICAL,370)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_nor(LOGICAL,371)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_nor_q <= not (redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_notEnable_q or redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_q);

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_cmpReg(REG,369)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena(REG,372)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_nor_q = "1") THEN
                redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_enaAnd(LOGICAL,373)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_enaAnd_q <= redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_sticky_ena_q and VCC_q;

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt(COUNTER,367)
    -- low=0, high=1, step=1, init=0
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_i <= redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_i, 1)));

    -- yPPolyEval_uid34_fpInvSqrtTest(BITSELECT,33)@0
    yPPolyEval_uid34_fpInvSqrtTest_in <= frac_x_uid17_fpInvSqrtTest_b(43 downto 0);
    yPPolyEval_uid34_fpInvSqrtTest_b <= yPPolyEval_uid34_fpInvSqrtTest_in(43 downto 0);

    -- redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_inputreg(DELAY,359)
    redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_inputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPPolyEval_uid34_fpInvSqrtTest_b, xout => redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_inputreg_q, clk => clk, aclr => areset );

    -- redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3(DELAY,322)
    redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_inputreg_q, xout => redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_q, clk => clk, aclr => areset );

    -- redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_inputreg(DELAY,360)
    redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_inputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_q, xout => redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_inputreg_q, clk => clk, aclr => areset );

    -- redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7(DELAY,323)
    redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_inputreg_q, xout => redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_q, clk => clk, aclr => areset );

    -- redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_outputreg(DELAY,361)
    redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_outputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_q, xout => redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_outputreg_q, clk => clk, aclr => areset );

    -- redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_inputreg(DELAY,362)
    redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_inputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_outputreg_q, xout => redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_inputreg_q, clk => clk, aclr => areset );

    -- redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11(DELAY,324)
    redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_inputreg_q, xout => redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_q, clk => clk, aclr => areset );

    -- redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_outputreg(DELAY,363)
    redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_outputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_q, xout => redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_outputreg_q, clk => clk, aclr => areset );

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_inputreg(DELAY,364)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_inputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_outputreg_q, xout => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_inputreg_q, clk => clk, aclr => areset );

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_wraddr(REG,368)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_wraddr_q <= STD_LOGIC_VECTOR(redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem(DUALMEM,366)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_ia <= STD_LOGIC_VECTOR(redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_inputreg_q);
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_aa <= redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_wraddr_q;
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_ab <= redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_rdcnt_q;
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_reset0 <= areset;
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 44,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 44,
        widthad_b => 1,
        numwords_b => 2,
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
        clocken1 => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_reset0,
        clock1 => clk,
        address_a => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_aa,
        data_a => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_ab,
        q_b => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_iq
    );
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_q <= redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_iq(43 downto 0);

    -- redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_outputreg(DELAY,365)
    redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_outputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_mem_q, xout => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_outputreg_q, clk => clk, aclr => areset );

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_inputreg(DELAY,374)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_inputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_outputreg_q, xout => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_inputreg_q, clk => clk, aclr => areset );

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_wraddr(REG,378)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_wraddr_q <= STD_LOGIC_VECTOR(redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem(DUALMEM,376)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_ia <= STD_LOGIC_VECTOR(redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_inputreg_q);
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_aa <= redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_wraddr_q;
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_ab <= redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_rdcnt_q;
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_reset0 <= areset;
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 44,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 44,
        widthad_b => 1,
        numwords_b => 2,
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
        clocken1 => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_reset0,
        clock1 => clk,
        address_a => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_aa,
        data_a => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_ab,
        q_b => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_iq
    );
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_q <= redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_iq(43 downto 0);

    -- redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_outputreg(DELAY,375)
    redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_outputreg : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_mem_q, xout => redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_outputreg_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid208_pT5_uid114_invPolyEval(BITJOIN,207)@21
    nx_mergedSignalTM_uid208_pT5_uid114_invPolyEval_q <= GND_q & redist40_yPPolyEval_uid34_fpInvSqrtTest_b_21_outputreg_q;

    -- topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select(BITSELECT,285)@21
    topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid208_pT5_uid114_invPolyEval_q(44 downto 18));
    topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid208_pT5_uid114_invPolyEval_q(17 downto 0));

    -- yT4_uid107_invPolyEval(BITSELECT,106)@16
    yT4_uid107_invPolyEval_b <= redist39_yPPolyEval_uid34_fpInvSqrtTest_b_16_outputreg_q(43 downto 4);

    -- nx_mergedSignalTM_uid173_pT4_uid108_invPolyEval(BITJOIN,172)@16
    nx_mergedSignalTM_uid173_pT4_uid108_invPolyEval_q <= GND_q & yT4_uid107_invPolyEval_b;

    -- aboveLeftX_uid177_pT4_uid108_invPolyEval(BITSELECT,176)@16
    aboveLeftX_uid177_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid173_pT4_uid108_invPolyEval_q(40 downto 23));

    -- yT3_uid101_invPolyEval(BITSELECT,100)@11
    yT3_uid101_invPolyEval_b <= redist38_yPPolyEval_uid34_fpInvSqrtTest_b_11_outputreg_q(43 downto 11);

    -- nx_mergedSignalTM_uid138_pT3_uid102_invPolyEval(BITJOIN,137)@11
    nx_mergedSignalTM_uid138_pT3_uid102_invPolyEval_q <= GND_q & yT3_uid101_invPolyEval_b;

    -- topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select(BITSELECT,284)@11
    topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid138_pT3_uid102_invPolyEval_q(33 downto 16));
    topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid138_pT3_uid102_invPolyEval_q(15 downto 0));

    -- aboveLeftY_mergedSignalTM_uid145_pT3_uid102_invPolyEval(BITJOIN,144)@11
    aboveLeftY_mergedSignalTM_uid145_pT3_uid102_invPolyEval_q <= topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_c & GND_q;

    -- addrYFull_uid31_fpInvSqrtTest(BITJOIN,30)@0
    addrYFull_uid31_fpInvSqrtTest_q <= evenOddExp_uid30_fpInvSqrtTest_b & frac_x_uid17_fpInvSqrtTest_b;

    -- yAddr_uid33_fpInvSqrtTest(BITSELECT,32)@0
    yAddr_uid33_fpInvSqrtTest_b <= addrYFull_uid31_fpInvSqrtTest_q(52 downto 44);

    -- memoryC5_uid80_invSqrtTables_lutmem(DUALMEM,272)@0 + 2
    -- in j@20000000
    memoryC5_uid80_invSqrtTables_lutmem_aa <= yAddr_uid33_fpInvSqrtTest_b;
    memoryC5_uid80_invSqrtTables_lutmem_reset0 <= areset;
    memoryC5_uid80_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 15,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC5_uid80_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC5_uid80_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC5_uid80_invSqrtTables_lutmem_aa,
        q_a => memoryC5_uid80_invSqrtTables_lutmem_ir
    );
    memoryC5_uid80_invSqrtTables_lutmem_r <= memoryC5_uid80_invSqrtTables_lutmem_ir(14 downto 0);

    -- redist9_memoryC5_uid80_invSqrtTables_lutmem_r_1(DELAY,295)
    redist9_memoryC5_uid80_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC5_uid80_invSqrtTables_lutmem_r, xout => redist9_memoryC5_uid80_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- yT1_uid89_invPolyEval(BITSELECT,88)@3
    yT1_uid89_invPolyEval_b <= redist36_yPPolyEval_uid34_fpInvSqrtTest_b_3_q(43 downto 29);

    -- prodXY_uid120_pT1_uid90_invPolyEval_cma(CHAINMULTADD,273)@3 + 2
    prodXY_uid120_pT1_uid90_invPolyEval_cma_reset <= areset;
    prodXY_uid120_pT1_uid90_invPolyEval_cma_ena0 <= '1';
    prodXY_uid120_pT1_uid90_invPolyEval_cma_ena1 <= prodXY_uid120_pT1_uid90_invPolyEval_cma_ena0;
    prodXY_uid120_pT1_uid90_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid120_pT1_uid90_invPolyEval_cma_a0(0),16));
    prodXY_uid120_pT1_uid90_invPolyEval_cma_p(0) <= prodXY_uid120_pT1_uid90_invPolyEval_cma_l(0) * prodXY_uid120_pT1_uid90_invPolyEval_cma_c0(0);
    prodXY_uid120_pT1_uid90_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid120_pT1_uid90_invPolyEval_cma_p(0),31);
    prodXY_uid120_pT1_uid90_invPolyEval_cma_w(0) <= prodXY_uid120_pT1_uid90_invPolyEval_cma_u(0);
    prodXY_uid120_pT1_uid90_invPolyEval_cma_x(0) <= prodXY_uid120_pT1_uid90_invPolyEval_cma_w(0);
    prodXY_uid120_pT1_uid90_invPolyEval_cma_y(0) <= prodXY_uid120_pT1_uid90_invPolyEval_cma_x(0);
    prodXY_uid120_pT1_uid90_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid120_pT1_uid90_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid120_pT1_uid90_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid120_pT1_uid90_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid120_pT1_uid90_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid89_invPolyEval_b),15);
                prodXY_uid120_pT1_uid90_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist9_memoryC5_uid80_invSqrtTables_lutmem_r_1_q),15);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid120_pT1_uid90_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid120_pT1_uid90_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid120_pT1_uid90_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid120_pT1_uid90_invPolyEval_cma_s(0) <= prodXY_uid120_pT1_uid90_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid120_pT1_uid90_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 30, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid120_pT1_uid90_invPolyEval_cma_s(0)(29 downto 0)), xout => prodXY_uid120_pT1_uid90_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid120_pT1_uid90_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid120_pT1_uid90_invPolyEval_cma_qq(29 downto 0));

    -- osig_uid121_pT1_uid90_invPolyEval(BITSELECT,120)@5
    osig_uid121_pT1_uid90_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid120_pT1_uid90_invPolyEval_cma_q(29 downto 14));

    -- redist26_osig_uid121_pT1_uid90_invPolyEval_b_1(DELAY,312)
    redist26_osig_uid121_pT1_uid90_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid121_pT1_uid90_invPolyEval_b, xout => redist26_osig_uid121_pT1_uid90_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid92_invPolyEval(BITSELECT,91)@6
    highBBits_uid92_invPolyEval_b <= STD_LOGIC_VECTOR(redist26_osig_uid121_pT1_uid90_invPolyEval_b_1_q(15 downto 1));

    -- redist41_yAddr_uid33_fpInvSqrtTest_b_3(DELAY,327)
    redist41_yAddr_uid33_fpInvSqrtTest_b_3 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid33_fpInvSqrtTest_b, xout => redist41_yAddr_uid33_fpInvSqrtTest_b_3_q, clk => clk, aclr => areset );

    -- memoryC4_uid77_invSqrtTables_lutmem(DUALMEM,271)@3 + 2
    -- in j@20000000
    memoryC4_uid77_invSqrtTables_lutmem_aa <= redist41_yAddr_uid33_fpInvSqrtTest_b_3_q;
    memoryC4_uid77_invSqrtTables_lutmem_reset0 <= areset;
    memoryC4_uid77_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 4,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC4_uid77_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid77_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid77_invSqrtTables_lutmem_aa,
        q_a => memoryC4_uid77_invSqrtTables_lutmem_ir
    );
    memoryC4_uid77_invSqrtTables_lutmem_r <= memoryC4_uid77_invSqrtTables_lutmem_ir(3 downto 0);

    -- redist10_memoryC4_uid77_invSqrtTables_lutmem_r_1(DELAY,296)
    redist10_memoryC4_uid77_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC4_uid77_invSqrtTables_lutmem_r, xout => redist10_memoryC4_uid77_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC4_uid76_invSqrtTables_lutmem(DUALMEM,270)@3 + 2
    -- in j@20000000
    memoryC4_uid76_invSqrtTables_lutmem_aa <= redist41_yAddr_uid33_fpInvSqrtTest_b_3_q;
    memoryC4_uid76_invSqrtTables_lutmem_reset0 <= areset;
    memoryC4_uid76_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC4_uid76_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid76_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid76_invSqrtTables_lutmem_aa,
        q_a => memoryC4_uid76_invSqrtTables_lutmem_ir
    );
    memoryC4_uid76_invSqrtTables_lutmem_r <= memoryC4_uid76_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist11_memoryC4_uid76_invSqrtTables_lutmem_r_1(DELAY,297)
    redist11_memoryC4_uid76_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC4_uid76_invSqrtTables_lutmem_r, xout => redist11_memoryC4_uid76_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid78_invSqrtTables(BITJOIN,77)@6
    os_uid78_invSqrtTables_q <= redist10_memoryC4_uid77_invSqrtTables_lutmem_r_1_q & redist11_memoryC4_uid76_invSqrtTables_lutmem_r_1_q;

    -- s1sumAHighB_uid93_invPolyEval(ADD,92)@6 + 1
    s1sumAHighB_uid93_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => os_uid78_invSqrtTables_q(23)) & os_uid78_invSqrtTables_q));
    s1sumAHighB_uid93_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 15 => highBBits_uid92_invPolyEval_b(14)) & highBBits_uid92_invPolyEval_b));
    s1sumAHighB_uid93_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s1sumAHighB_uid93_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1sumAHighB_uid93_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid93_invPolyEval_a) + SIGNED(s1sumAHighB_uid93_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid93_invPolyEval_q <= s1sumAHighB_uid93_invPolyEval_o(24 downto 0);

    -- lowRangeB_uid91_invPolyEval(BITSELECT,90)@6
    lowRangeB_uid91_invPolyEval_in <= redist26_osig_uid121_pT1_uid90_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid91_invPolyEval_b <= lowRangeB_uid91_invPolyEval_in(0 downto 0);

    -- redist30_lowRangeB_uid91_invPolyEval_b_1(DELAY,316)
    redist30_lowRangeB_uid91_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid91_invPolyEval_b, xout => redist30_lowRangeB_uid91_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s1_uid94_invPolyEval(BITJOIN,93)@7
    s1_uid94_invPolyEval_q <= s1sumAHighB_uid93_invPolyEval_q & redist30_lowRangeB_uid91_invPolyEval_b_1_q;

    -- yT2_uid95_invPolyEval(BITSELECT,94)@7
    yT2_uid95_invPolyEval_b <= redist37_yPPolyEval_uid34_fpInvSqrtTest_b_7_outputreg_q(43 downto 20);

    -- prodXY_uid123_pT2_uid96_invPolyEval_cma(CHAINMULTADD,274)@7 + 2
    prodXY_uid123_pT2_uid96_invPolyEval_cma_reset <= areset;
    prodXY_uid123_pT2_uid96_invPolyEval_cma_ena0 <= '1';
    prodXY_uid123_pT2_uid96_invPolyEval_cma_ena1 <= prodXY_uid123_pT2_uid96_invPolyEval_cma_ena0;
    prodXY_uid123_pT2_uid96_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid123_pT2_uid96_invPolyEval_cma_a0(0),25));
    prodXY_uid123_pT2_uid96_invPolyEval_cma_p(0) <= prodXY_uid123_pT2_uid96_invPolyEval_cma_l(0) * prodXY_uid123_pT2_uid96_invPolyEval_cma_c0(0);
    prodXY_uid123_pT2_uid96_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid123_pT2_uid96_invPolyEval_cma_p(0),51);
    prodXY_uid123_pT2_uid96_invPolyEval_cma_w(0) <= prodXY_uid123_pT2_uid96_invPolyEval_cma_u(0);
    prodXY_uid123_pT2_uid96_invPolyEval_cma_x(0) <= prodXY_uid123_pT2_uid96_invPolyEval_cma_w(0);
    prodXY_uid123_pT2_uid96_invPolyEval_cma_y(0) <= prodXY_uid123_pT2_uid96_invPolyEval_cma_x(0);
    prodXY_uid123_pT2_uid96_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid123_pT2_uid96_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid123_pT2_uid96_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid123_pT2_uid96_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid123_pT2_uid96_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT2_uid95_invPolyEval_b),24);
                prodXY_uid123_pT2_uid96_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid94_invPolyEval_q),26);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid123_pT2_uid96_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid123_pT2_uid96_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid123_pT2_uid96_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid123_pT2_uid96_invPolyEval_cma_s(0) <= prodXY_uid123_pT2_uid96_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid123_pT2_uid96_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid123_pT2_uid96_invPolyEval_cma_s(0)(49 downto 0)), xout => prodXY_uid123_pT2_uid96_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid123_pT2_uid96_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid123_pT2_uid96_invPolyEval_cma_qq(49 downto 0));

    -- osig_uid124_pT2_uid96_invPolyEval(BITSELECT,123)@9
    osig_uid124_pT2_uid96_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid123_pT2_uid96_invPolyEval_cma_q(49 downto 23));

    -- redist25_osig_uid124_pT2_uid96_invPolyEval_b_1(DELAY,311)
    redist25_osig_uid124_pT2_uid96_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid124_pT2_uid96_invPolyEval_b, xout => redist25_osig_uid124_pT2_uid96_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid98_invPolyEval(BITSELECT,97)@10
    highBBits_uid98_invPolyEval_b <= STD_LOGIC_VECTOR(redist25_osig_uid124_pT2_uid96_invPolyEval_b_1_q(26 downto 1));

    -- redist42_yAddr_uid33_fpInvSqrtTest_b_7(DELAY,328)
    redist42_yAddr_uid33_fpInvSqrtTest_b_7 : dspba_delay
    GENERIC MAP ( width => 9, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist41_yAddr_uid33_fpInvSqrtTest_b_3_q, xout => redist42_yAddr_uid33_fpInvSqrtTest_b_7_q, clk => clk, aclr => areset );

    -- memoryC3_uid73_invSqrtTables_lutmem(DUALMEM,269)@7 + 2
    -- in j@20000000
    memoryC3_uid73_invSqrtTables_lutmem_aa <= redist42_yAddr_uid33_fpInvSqrtTest_b_7_q;
    memoryC3_uid73_invSqrtTables_lutmem_reset0 <= areset;
    memoryC3_uid73_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC3_uid73_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid73_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid73_invSqrtTables_lutmem_aa,
        q_a => memoryC3_uid73_invSqrtTables_lutmem_ir
    );
    memoryC3_uid73_invSqrtTables_lutmem_r <= memoryC3_uid73_invSqrtTables_lutmem_ir(12 downto 0);

    -- redist12_memoryC3_uid73_invSqrtTables_lutmem_r_1(DELAY,298)
    redist12_memoryC3_uid73_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC3_uid73_invSqrtTables_lutmem_r, xout => redist12_memoryC3_uid73_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC3_uid72_invSqrtTables_lutmem(DUALMEM,268)@7 + 2
    -- in j@20000000
    memoryC3_uid72_invSqrtTables_lutmem_aa <= redist42_yAddr_uid33_fpInvSqrtTest_b_7_q;
    memoryC3_uid72_invSqrtTables_lutmem_reset0 <= areset;
    memoryC3_uid72_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC3_uid72_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid72_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid72_invSqrtTables_lutmem_aa,
        q_a => memoryC3_uid72_invSqrtTables_lutmem_ir
    );
    memoryC3_uid72_invSqrtTables_lutmem_r <= memoryC3_uid72_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist13_memoryC3_uid72_invSqrtTables_lutmem_r_1(DELAY,299)
    redist13_memoryC3_uid72_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC3_uid72_invSqrtTables_lutmem_r, xout => redist13_memoryC3_uid72_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid74_invSqrtTables(BITJOIN,73)@10
    os_uid74_invSqrtTables_q <= redist12_memoryC3_uid73_invSqrtTables_lutmem_r_1_q & redist13_memoryC3_uid72_invSqrtTables_lutmem_r_1_q;

    -- s2sumAHighB_uid99_invPolyEval(ADD,98)@10 + 1
    s2sumAHighB_uid99_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => os_uid74_invSqrtTables_q(32)) & os_uid74_invSqrtTables_q));
    s2sumAHighB_uid99_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 26 => highBBits_uid98_invPolyEval_b(25)) & highBBits_uid98_invPolyEval_b));
    s2sumAHighB_uid99_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s2sumAHighB_uid99_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s2sumAHighB_uid99_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid99_invPolyEval_a) + SIGNED(s2sumAHighB_uid99_invPolyEval_b));
        END IF;
    END PROCESS;
    s2sumAHighB_uid99_invPolyEval_q <= s2sumAHighB_uid99_invPolyEval_o(33 downto 0);

    -- lowRangeB_uid97_invPolyEval(BITSELECT,96)@10
    lowRangeB_uid97_invPolyEval_in <= redist25_osig_uid124_pT2_uid96_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid97_invPolyEval_b <= lowRangeB_uid97_invPolyEval_in(0 downto 0);

    -- redist29_lowRangeB_uid97_invPolyEval_b_1(DELAY,315)
    redist29_lowRangeB_uid97_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid97_invPolyEval_b, xout => redist29_lowRangeB_uid97_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s2_uid100_invPolyEval(BITJOIN,99)@11
    s2_uid100_invPolyEval_q <= s2sumAHighB_uid99_invPolyEval_q & redist29_lowRangeB_uid97_invPolyEval_b_1_q;

    -- topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select(BITSELECT,282)@11
    topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid100_invPolyEval_q(34 downto 17));
    topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid100_invPolyEval_q(16 downto 0));

    -- rightBottomX_bottomExtension_uid147_pT3_uid102_invPolyEval(CONSTANT,146)
    rightBottomX_bottomExtension_uid147_pT3_uid102_invPolyEval_q <= "00";

    -- rightBottomX_mergedSignalTM_uid149_pT3_uid102_invPolyEval(BITJOIN,148)@11
    rightBottomX_mergedSignalTM_uid149_pT3_uid102_invPolyEval_q <= topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid147_pT3_uid102_invPolyEval_q;

    -- multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma(CHAINMULTADD,278)@11 + 2
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_l(0) * multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_l(1) * multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_u(0) + multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid149_pT3_uid102_invPolyEval_q),18);
                multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid145_pT3_uid102_invPolyEval_q),18);
                multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_b),18);
                multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_qq(36 downto 0));

    -- redist5_multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q_1(DELAY,291)
    redist5_multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q, xout => redist5_multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- highBBits_uid156_pT3_uid102_invPolyEval(BITSELECT,155)@14
    highBBits_uid156_pT3_uid102_invPolyEval_b <= STD_LOGIC_VECTOR(redist5_multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q_1_q(36 downto 18));

    -- sm0_uid152_pT3_uid102_invPolyEval_cma(CHAINMULTADD,275)@11 + 2
    sm0_uid152_pT3_uid102_invPolyEval_cma_reset <= areset;
    sm0_uid152_pT3_uid102_invPolyEval_cma_ena0 <= '1';
    sm0_uid152_pT3_uid102_invPolyEval_cma_ena1 <= sm0_uid152_pT3_uid102_invPolyEval_cma_ena0;
    sm0_uid152_pT3_uid102_invPolyEval_cma_p(0) <= sm0_uid152_pT3_uid102_invPolyEval_cma_a0(0) * sm0_uid152_pT3_uid102_invPolyEval_cma_c0(0);
    sm0_uid152_pT3_uid102_invPolyEval_cma_u(0) <= RESIZE(sm0_uid152_pT3_uid102_invPolyEval_cma_p(0),36);
    sm0_uid152_pT3_uid102_invPolyEval_cma_w(0) <= sm0_uid152_pT3_uid102_invPolyEval_cma_u(0);
    sm0_uid152_pT3_uid102_invPolyEval_cma_x(0) <= sm0_uid152_pT3_uid102_invPolyEval_cma_w(0);
    sm0_uid152_pT3_uid102_invPolyEval_cma_y(0) <= sm0_uid152_pT3_uid102_invPolyEval_cma_x(0);
    sm0_uid152_pT3_uid102_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid152_pT3_uid102_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid152_pT3_uid102_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid152_pT3_uid102_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid152_pT3_uid102_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid140_pT3_uid102_invPolyEval_merged_bit_select_b),18);
                sm0_uid152_pT3_uid102_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid141_pT3_uid102_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid152_pT3_uid102_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid152_pT3_uid102_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid152_pT3_uid102_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid152_pT3_uid102_invPolyEval_cma_s(0) <= sm0_uid152_pT3_uid102_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid152_pT3_uid102_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid152_pT3_uid102_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid152_pT3_uid102_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid152_pT3_uid102_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid152_pT3_uid102_invPolyEval_cma_qq(35 downto 0));

    -- redist8_sm0_uid152_pT3_uid102_invPolyEval_cma_q_1(DELAY,294)
    redist8_sm0_uid152_pT3_uid102_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid152_pT3_uid102_invPolyEval_cma_q, xout => redist8_sm0_uid152_pT3_uid102_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval(ADD,156)@14
    lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => redist8_sm0_uid152_pT3_uid102_invPolyEval_cma_q_1_q(35)) & redist8_sm0_uid152_pT3_uid102_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid156_pT3_uid102_invPolyEval_b(18)) & highBBits_uid156_pT3_uid102_invPolyEval_b));
    lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_b));
    lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_q <= lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid155_pT3_uid102_invPolyEval(BITSELECT,154)@14
    lowRangeB_uid155_pT3_uid102_invPolyEval_in <= redist5_multSumOfTwoTS_uid153_pT3_uid102_invPolyEval_cma_q_1_q(17 downto 0);
    lowRangeB_uid155_pT3_uid102_invPolyEval_b <= lowRangeB_uid155_pT3_uid102_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid158_pT3_uid102_invPolyEval(BITJOIN,157)@14
    lev1_a0_uid158_pT3_uid102_invPolyEval_q <= lev1_a0sumAHighB_uid157_pT3_uid102_invPolyEval_q & lowRangeB_uid155_pT3_uid102_invPolyEval_b;

    -- os_uid159_pT3_uid102_invPolyEval(BITSELECT,158)@14
    os_uid159_pT3_uid102_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid158_pT3_uid102_invPolyEval_q(52 downto 0));
    os_uid159_pT3_uid102_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid159_pT3_uid102_invPolyEval_in(52 downto 19));

    -- redist24_os_uid159_pT3_uid102_invPolyEval_b_1(DELAY,310)
    redist24_os_uid159_pT3_uid102_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid159_pT3_uid102_invPolyEval_b, xout => redist24_os_uid159_pT3_uid102_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid104_invPolyEval(BITSELECT,103)@15
    highBBits_uid104_invPolyEval_b <= STD_LOGIC_VECTOR(redist24_os_uid159_pT3_uid102_invPolyEval_b_1_q(33 downto 1));

    -- redist43_yAddr_uid33_fpInvSqrtTest_b_12_inputreg(DELAY,384)
    redist43_yAddr_uid33_fpInvSqrtTest_b_12_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist42_yAddr_uid33_fpInvSqrtTest_b_7_q, xout => redist43_yAddr_uid33_fpInvSqrtTest_b_12_inputreg_q, clk => clk, aclr => areset );

    -- redist43_yAddr_uid33_fpInvSqrtTest_b_12(DELAY,329)
    redist43_yAddr_uid33_fpInvSqrtTest_b_12 : dspba_delay
    GENERIC MAP ( width => 9, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist43_yAddr_uid33_fpInvSqrtTest_b_12_inputreg_q, xout => redist43_yAddr_uid33_fpInvSqrtTest_b_12_q, clk => clk, aclr => areset );

    -- memoryC2_uid69_invSqrtTables_lutmem(DUALMEM,267)@12 + 2
    -- in j@20000000
    memoryC2_uid69_invSqrtTables_lutmem_aa <= redist43_yAddr_uid33_fpInvSqrtTest_b_12_q;
    memoryC2_uid69_invSqrtTables_lutmem_reset0 <= areset;
    memoryC2_uid69_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC2_uid69_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid69_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid69_invSqrtTables_lutmem_aa,
        q_a => memoryC2_uid69_invSqrtTables_lutmem_ir
    );
    memoryC2_uid69_invSqrtTables_lutmem_r <= memoryC2_uid69_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist14_memoryC2_uid69_invSqrtTables_lutmem_r_1(DELAY,300)
    redist14_memoryC2_uid69_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC2_uid69_invSqrtTables_lutmem_r, xout => redist14_memoryC2_uid69_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC2_uid68_invSqrtTables_lutmem(DUALMEM,266)@12 + 2
    -- in j@20000000
    memoryC2_uid68_invSqrtTables_lutmem_aa <= redist43_yAddr_uid33_fpInvSqrtTest_b_12_q;
    memoryC2_uid68_invSqrtTables_lutmem_reset0 <= areset;
    memoryC2_uid68_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC2_uid68_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid68_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid68_invSqrtTables_lutmem_aa,
        q_a => memoryC2_uid68_invSqrtTables_lutmem_ir
    );
    memoryC2_uid68_invSqrtTables_lutmem_r <= memoryC2_uid68_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist15_memoryC2_uid68_invSqrtTables_lutmem_r_1(DELAY,301)
    redist15_memoryC2_uid68_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC2_uid68_invSqrtTables_lutmem_r, xout => redist15_memoryC2_uid68_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid70_invSqrtTables(BITJOIN,69)@15
    os_uid70_invSqrtTables_q <= redist14_memoryC2_uid69_invSqrtTables_lutmem_r_1_q & redist15_memoryC2_uid68_invSqrtTables_lutmem_r_1_q;

    -- s3sumAHighB_uid105_invPolyEval(ADD,104)@15 + 1
    s3sumAHighB_uid105_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => os_uid70_invSqrtTables_q(39)) & os_uid70_invSqrtTables_q));
    s3sumAHighB_uid105_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => highBBits_uid104_invPolyEval_b(32)) & highBBits_uid104_invPolyEval_b));
    s3sumAHighB_uid105_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s3sumAHighB_uid105_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s3sumAHighB_uid105_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid105_invPolyEval_a) + SIGNED(s3sumAHighB_uid105_invPolyEval_b));
        END IF;
    END PROCESS;
    s3sumAHighB_uid105_invPolyEval_q <= s3sumAHighB_uid105_invPolyEval_o(40 downto 0);

    -- lowRangeB_uid103_invPolyEval(BITSELECT,102)@15
    lowRangeB_uid103_invPolyEval_in <= redist24_os_uid159_pT3_uid102_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid103_invPolyEval_b <= lowRangeB_uid103_invPolyEval_in(0 downto 0);

    -- redist28_lowRangeB_uid103_invPolyEval_b_1(DELAY,314)
    redist28_lowRangeB_uid103_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid103_invPolyEval_b, xout => redist28_lowRangeB_uid103_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s3_uid106_invPolyEval(BITJOIN,105)@16
    s3_uid106_invPolyEval_q <= s3sumAHighB_uid105_invPolyEval_q & redist28_lowRangeB_uid103_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval(BITSELECT,178)@16
    aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid106_invPolyEval_q(14 downto 0));
    aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval_in(14 downto 0));

    -- aboveLeftY_bottomExtension_uid178_pT4_uid108_invPolyEval(CONSTANT,177)
    aboveLeftY_bottomExtension_uid178_pT4_uid108_invPolyEval_q <= "000";

    -- aboveLeftY_mergedSignalTM_uid180_pT4_uid108_invPolyEval(BITJOIN,179)@16
    aboveLeftY_mergedSignalTM_uid180_pT4_uid108_invPolyEval_q <= aboveLeftY_bottomRange_uid179_pT4_uid108_invPolyEval_b & aboveLeftY_bottomExtension_uid178_pT4_uid108_invPolyEval_q;

    -- rightBottomY_uid186_pT4_uid108_invPolyEval(BITSELECT,185)@16
    rightBottomY_uid186_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid106_invPolyEval_q(41 downto 24));

    -- rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval(BITSELECT,182)@16
    rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid173_pT4_uid108_invPolyEval_q(13 downto 0));
    rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval_in(13 downto 0));

    -- rightBottomX_mergedSignalTM_uid184_pT4_uid108_invPolyEval(BITJOIN,183)@16
    rightBottomX_mergedSignalTM_uid184_pT4_uid108_invPolyEval_q <= rightBottomX_bottomRange_uid183_pT4_uid108_invPolyEval_b & rightBottomX_bottomExtension_uid182_pT4_uid108_invPolyEval_q;

    -- multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma(CHAINMULTADD,279)@16 + 2
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_l(0) * multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_l(1) * multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_u(0) + multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid184_pT4_uid108_invPolyEval_q),18);
                multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid180_pT4_uid108_invPolyEval_q),18);
                multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(rightBottomY_uid186_pT4_uid108_invPolyEval_b),18);
                multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(aboveLeftX_uid177_pT4_uid108_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_qq(36 downto 0));

    -- redist4_multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q_1(DELAY,290)
    redist4_multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q, xout => redist4_multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- highBBits_uid191_pT4_uid108_invPolyEval(BITSELECT,190)@19
    highBBits_uid191_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(redist4_multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q_1_q(36 downto 9));

    -- topRangeY_uid176_pT4_uid108_invPolyEval(BITSELECT,175)@16
    topRangeY_uid176_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid106_invPolyEval_q(41 downto 15));

    -- topRangeX_uid175_pT4_uid108_invPolyEval(BITSELECT,174)@16
    topRangeX_uid175_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid173_pT4_uid108_invPolyEval_q(40 downto 14));

    -- sm0_uid187_pT4_uid108_invPolyEval_cma(CHAINMULTADD,276)@16 + 2
    sm0_uid187_pT4_uid108_invPolyEval_cma_reset <= areset;
    sm0_uid187_pT4_uid108_invPolyEval_cma_ena0 <= '1';
    sm0_uid187_pT4_uid108_invPolyEval_cma_ena1 <= sm0_uid187_pT4_uid108_invPolyEval_cma_ena0;
    sm0_uid187_pT4_uid108_invPolyEval_cma_p(0) <= sm0_uid187_pT4_uid108_invPolyEval_cma_a0(0) * sm0_uid187_pT4_uid108_invPolyEval_cma_c0(0);
    sm0_uid187_pT4_uid108_invPolyEval_cma_u(0) <= RESIZE(sm0_uid187_pT4_uid108_invPolyEval_cma_p(0),54);
    sm0_uid187_pT4_uid108_invPolyEval_cma_w(0) <= sm0_uid187_pT4_uid108_invPolyEval_cma_u(0);
    sm0_uid187_pT4_uid108_invPolyEval_cma_x(0) <= sm0_uid187_pT4_uid108_invPolyEval_cma_w(0);
    sm0_uid187_pT4_uid108_invPolyEval_cma_y(0) <= sm0_uid187_pT4_uid108_invPolyEval_cma_x(0);
    sm0_uid187_pT4_uid108_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid187_pT4_uid108_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid187_pT4_uid108_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid187_pT4_uid108_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid187_pT4_uid108_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid175_pT4_uid108_invPolyEval_b),27);
                sm0_uid187_pT4_uid108_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid176_pT4_uid108_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid187_pT4_uid108_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid187_pT4_uid108_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid187_pT4_uid108_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid187_pT4_uid108_invPolyEval_cma_s(0) <= sm0_uid187_pT4_uid108_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid187_pT4_uid108_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid187_pT4_uid108_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid187_pT4_uid108_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid187_pT4_uid108_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid187_pT4_uid108_invPolyEval_cma_qq(53 downto 0));

    -- redist7_sm0_uid187_pT4_uid108_invPolyEval_cma_q_1(DELAY,293)
    redist7_sm0_uid187_pT4_uid108_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid187_pT4_uid108_invPolyEval_cma_q, xout => redist7_sm0_uid187_pT4_uid108_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval(ADD,191)@19
    lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => redist7_sm0_uid187_pT4_uid108_invPolyEval_cma_q_1_q(53)) & redist7_sm0_uid187_pT4_uid108_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid191_pT4_uid108_invPolyEval_b(27)) & highBBits_uid191_pT4_uid108_invPolyEval_b));
    lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_b));
    lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_q <= lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid190_pT4_uid108_invPolyEval(BITSELECT,189)@19
    lowRangeB_uid190_pT4_uid108_invPolyEval_in <= redist4_multSumOfTwoTS_uid188_pT4_uid108_invPolyEval_cma_q_1_q(8 downto 0);
    lowRangeB_uid190_pT4_uid108_invPolyEval_b <= lowRangeB_uid190_pT4_uid108_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid193_pT4_uid108_invPolyEval(BITJOIN,192)@19
    lev1_a0_uid193_pT4_uid108_invPolyEval_q <= lev1_a0sumAHighB_uid192_pT4_uid108_invPolyEval_q & lowRangeB_uid190_pT4_uid108_invPolyEval_b;

    -- os_uid194_pT4_uid108_invPolyEval(BITSELECT,193)@19
    os_uid194_pT4_uid108_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid193_pT4_uid108_invPolyEval_q(61 downto 0));
    os_uid194_pT4_uid108_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid194_pT4_uid108_invPolyEval_in(61 downto 20));

    -- redist23_os_uid194_pT4_uid108_invPolyEval_b_1(DELAY,309)
    redist23_os_uid194_pT4_uid108_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 42, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid194_pT4_uid108_invPolyEval_b, xout => redist23_os_uid194_pT4_uid108_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid110_invPolyEval(BITSELECT,109)@20
    highBBits_uid110_invPolyEval_b <= STD_LOGIC_VECTOR(redist23_os_uid194_pT4_uid108_invPolyEval_b_1_q(41 downto 1));

    -- redist44_yAddr_uid33_fpInvSqrtTest_b_17_inputreg(DELAY,385)
    redist44_yAddr_uid33_fpInvSqrtTest_b_17_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist43_yAddr_uid33_fpInvSqrtTest_b_12_q, xout => redist44_yAddr_uid33_fpInvSqrtTest_b_17_inputreg_q, clk => clk, aclr => areset );

    -- redist44_yAddr_uid33_fpInvSqrtTest_b_17(DELAY,330)
    redist44_yAddr_uid33_fpInvSqrtTest_b_17 : dspba_delay
    GENERIC MAP ( width => 9, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist44_yAddr_uid33_fpInvSqrtTest_b_17_inputreg_q, xout => redist44_yAddr_uid33_fpInvSqrtTest_b_17_q, clk => clk, aclr => areset );

    -- memoryC1_uid65_invSqrtTables_lutmem(DUALMEM,265)@17 + 2
    -- in j@20000000
    memoryC1_uid65_invSqrtTables_lutmem_aa <= redist44_yAddr_uid33_fpInvSqrtTest_b_17_q;
    memoryC1_uid65_invSqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid65_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC1_uid65_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid65_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid65_invSqrtTables_lutmem_aa,
        q_a => memoryC1_uid65_invSqrtTables_lutmem_ir
    );
    memoryC1_uid65_invSqrtTables_lutmem_r <= memoryC1_uid65_invSqrtTables_lutmem_ir(7 downto 0);

    -- redist16_memoryC1_uid65_invSqrtTables_lutmem_r_1(DELAY,302)
    redist16_memoryC1_uid65_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC1_uid65_invSqrtTables_lutmem_r, xout => redist16_memoryC1_uid65_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC1_uid64_invSqrtTables_lutmem(DUALMEM,264)@17 + 2
    -- in j@20000000
    memoryC1_uid64_invSqrtTables_lutmem_aa <= redist44_yAddr_uid33_fpInvSqrtTest_b_17_q;
    memoryC1_uid64_invSqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid64_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC1_uid64_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid64_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid64_invSqrtTables_lutmem_aa,
        q_a => memoryC1_uid64_invSqrtTables_lutmem_ir
    );
    memoryC1_uid64_invSqrtTables_lutmem_r <= memoryC1_uid64_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist17_memoryC1_uid64_invSqrtTables_lutmem_r_1(DELAY,303)
    redist17_memoryC1_uid64_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC1_uid64_invSqrtTables_lutmem_r, xout => redist17_memoryC1_uid64_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC1_uid63_invSqrtTables_lutmem(DUALMEM,263)@17 + 2
    -- in j@20000000
    memoryC1_uid63_invSqrtTables_lutmem_aa <= redist44_yAddr_uid33_fpInvSqrtTest_b_17_q;
    memoryC1_uid63_invSqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid63_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC1_uid63_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid63_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid63_invSqrtTables_lutmem_aa,
        q_a => memoryC1_uid63_invSqrtTables_lutmem_ir
    );
    memoryC1_uid63_invSqrtTables_lutmem_r <= memoryC1_uid63_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist18_memoryC1_uid63_invSqrtTables_lutmem_r_1(DELAY,304)
    redist18_memoryC1_uid63_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC1_uid63_invSqrtTables_lutmem_r, xout => redist18_memoryC1_uid63_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid66_invSqrtTables(BITJOIN,65)@20
    os_uid66_invSqrtTables_q <= redist16_memoryC1_uid65_invSqrtTables_lutmem_r_1_q & redist17_memoryC1_uid64_invSqrtTables_lutmem_r_1_q & redist18_memoryC1_uid63_invSqrtTables_lutmem_r_1_q;

    -- s4sumAHighB_uid111_invPolyEval(ADD,110)@20 + 1
    s4sumAHighB_uid111_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 48 => os_uid66_invSqrtTables_q(47)) & os_uid66_invSqrtTables_q));
    s4sumAHighB_uid111_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 41 => highBBits_uid110_invPolyEval_b(40)) & highBBits_uid110_invPolyEval_b));
    s4sumAHighB_uid111_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s4sumAHighB_uid111_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s4sumAHighB_uid111_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid111_invPolyEval_a) + SIGNED(s4sumAHighB_uid111_invPolyEval_b));
        END IF;
    END PROCESS;
    s4sumAHighB_uid111_invPolyEval_q <= s4sumAHighB_uid111_invPolyEval_o(48 downto 0);

    -- lowRangeB_uid109_invPolyEval(BITSELECT,108)@20
    lowRangeB_uid109_invPolyEval_in <= redist23_os_uid194_pT4_uid108_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid109_invPolyEval_b <= lowRangeB_uid109_invPolyEval_in(0 downto 0);

    -- redist27_lowRangeB_uid109_invPolyEval_b_1(DELAY,313)
    redist27_lowRangeB_uid109_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid109_invPolyEval_b, xout => redist27_lowRangeB_uid109_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s4_uid112_invPolyEval(BITJOIN,111)@21
    s4_uid112_invPolyEval_q <= s4sumAHighB_uid111_invPolyEval_q & redist27_lowRangeB_uid109_invPolyEval_b_1_q;

    -- topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select(BITSELECT,283)@21
    topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s4_uid112_invPolyEval_q(49 downto 23));
    topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s4_uid112_invPolyEval_q(22 downto 0));

    -- rightBottomX_bottomExtension_uid182_pT4_uid108_invPolyEval(CONSTANT,181)
    rightBottomX_bottomExtension_uid182_pT4_uid108_invPolyEval_q <= "0000";

    -- aboveLeftY_mergedSignalTM_uid215_pT5_uid114_invPolyEval(BITJOIN,214)@21
    aboveLeftY_mergedSignalTM_uid215_pT5_uid114_invPolyEval_q <= topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid182_pT4_uid108_invPolyEval_q;

    -- redist2_topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b_1(DELAY,288)
    redist2_topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b, xout => redist2_topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- redist1_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c_1(DELAY,287)
    redist1_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c, xout => redist1_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightBottomX_bottomExtension_uid217_pT5_uid114_invPolyEval(CONSTANT,216)
    rightBottomX_bottomExtension_uid217_pT5_uid114_invPolyEval_q <= "000000000";

    -- rightBottomX_mergedSignalTM_uid219_pT5_uid114_invPolyEval(BITJOIN,218)@22
    rightBottomX_mergedSignalTM_uid219_pT5_uid114_invPolyEval_q <= redist1_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_c_1_q & rightBottomX_bottomExtension_uid217_pT5_uid114_invPolyEval_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma(CHAINMULTADD,280)@21 + 2
    -- in e@22
    -- in g@22
    -- out q@24
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0(0),28));
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0(1),28));
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_l(0) * multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_l(1) * multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_p(0),56);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_p(1),56);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_u(0);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_w(1) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_x(1) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_w(1);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_s(1) + multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_y(1) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_x(1);
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid219_pT5_uid114_invPolyEval_q),27);
                multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid215_pT5_uid114_invPolyEval_q),27);
                multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist2_topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b_1_q),27);
                multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_y(0);
                multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_s(1) <= multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_qq(54 downto 0));

    -- redist3_multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q_1(DELAY,289)
    redist3_multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q, xout => redist3_multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- highBBits_uid226_pT5_uid114_invPolyEval(BITSELECT,225)@25
    highBBits_uid226_pT5_uid114_invPolyEval_b <= STD_LOGIC_VECTOR(redist3_multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q_1_q(54 downto 27));

    -- redist0_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b_1(DELAY,286)
    redist0_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b, xout => redist0_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid222_pT5_uid114_invPolyEval_cma(CHAINMULTADD,277)@22 + 2
    sm0_uid222_pT5_uid114_invPolyEval_cma_reset <= areset;
    sm0_uid222_pT5_uid114_invPolyEval_cma_ena0 <= '1';
    sm0_uid222_pT5_uid114_invPolyEval_cma_ena1 <= sm0_uid222_pT5_uid114_invPolyEval_cma_ena0;
    sm0_uid222_pT5_uid114_invPolyEval_cma_p(0) <= sm0_uid222_pT5_uid114_invPolyEval_cma_a0(0) * sm0_uid222_pT5_uid114_invPolyEval_cma_c0(0);
    sm0_uid222_pT5_uid114_invPolyEval_cma_u(0) <= RESIZE(sm0_uid222_pT5_uid114_invPolyEval_cma_p(0),54);
    sm0_uid222_pT5_uid114_invPolyEval_cma_w(0) <= sm0_uid222_pT5_uid114_invPolyEval_cma_u(0);
    sm0_uid222_pT5_uid114_invPolyEval_cma_x(0) <= sm0_uid222_pT5_uid114_invPolyEval_cma_w(0);
    sm0_uid222_pT5_uid114_invPolyEval_cma_y(0) <= sm0_uid222_pT5_uid114_invPolyEval_cma_x(0);
    sm0_uid222_pT5_uid114_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid222_pT5_uid114_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid222_pT5_uid114_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid222_pT5_uid114_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid222_pT5_uid114_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(redist0_topRangeX_uid210_pT5_uid114_invPolyEval_merged_bit_select_b_1_q),27);
                sm0_uid222_pT5_uid114_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist2_topRangeY_uid211_pT5_uid114_invPolyEval_merged_bit_select_b_1_q),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid222_pT5_uid114_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid222_pT5_uid114_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid222_pT5_uid114_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid222_pT5_uid114_invPolyEval_cma_s(0) <= sm0_uid222_pT5_uid114_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid222_pT5_uid114_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid222_pT5_uid114_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid222_pT5_uid114_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid222_pT5_uid114_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid222_pT5_uid114_invPolyEval_cma_qq(53 downto 0));

    -- redist6_sm0_uid222_pT5_uid114_invPolyEval_cma_q_1(DELAY,292)
    redist6_sm0_uid222_pT5_uid114_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid222_pT5_uid114_invPolyEval_cma_q, xout => redist6_sm0_uid222_pT5_uid114_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval(ADD,226)@25
    lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => redist6_sm0_uid222_pT5_uid114_invPolyEval_cma_q_1_q(53)) & redist6_sm0_uid222_pT5_uid114_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid226_pT5_uid114_invPolyEval_b(27)) & highBBits_uid226_pT5_uid114_invPolyEval_b));
    lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_b));
    lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_q <= lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid225_pT5_uid114_invPolyEval(BITSELECT,224)@25
    lowRangeB_uid225_pT5_uid114_invPolyEval_in <= redist3_multSumOfTwoTS_uid223_pT5_uid114_invPolyEval_cma_q_1_q(26 downto 0);
    lowRangeB_uid225_pT5_uid114_invPolyEval_b <= lowRangeB_uid225_pT5_uid114_invPolyEval_in(26 downto 0);

    -- lev1_a0_uid228_pT5_uid114_invPolyEval(BITJOIN,227)@25
    lev1_a0_uid228_pT5_uid114_invPolyEval_q <= lev1_a0sumAHighB_uid227_pT5_uid114_invPolyEval_q & lowRangeB_uid225_pT5_uid114_invPolyEval_b;

    -- os_uid229_pT5_uid114_invPolyEval(BITSELECT,228)@25
    os_uid229_pT5_uid114_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid228_pT5_uid114_invPolyEval_q(79 downto 0));
    os_uid229_pT5_uid114_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid229_pT5_uid114_invPolyEval_in(79 downto 29));

    -- redist22_os_uid229_pT5_uid114_invPolyEval_b_1(DELAY,308)
    redist22_os_uid229_pT5_uid114_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 51, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid229_pT5_uid114_invPolyEval_b, xout => redist22_os_uid229_pT5_uid114_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid116_invPolyEval(BITSELECT,115)@26
    highBBits_uid116_invPolyEval_b <= STD_LOGIC_VECTOR(redist22_os_uid229_pT5_uid114_invPolyEval_b_1_q(50 downto 2));

    -- redist45_yAddr_uid33_fpInvSqrtTest_b_23_inputreg(DELAY,386)
    redist45_yAddr_uid33_fpInvSqrtTest_b_23_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist44_yAddr_uid33_fpInvSqrtTest_b_17_q, xout => redist45_yAddr_uid33_fpInvSqrtTest_b_23_inputreg_q, clk => clk, aclr => areset );

    -- redist45_yAddr_uid33_fpInvSqrtTest_b_23(DELAY,331)
    redist45_yAddr_uid33_fpInvSqrtTest_b_23 : dspba_delay
    GENERIC MAP ( width => 9, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist45_yAddr_uid33_fpInvSqrtTest_b_23_inputreg_q, xout => redist45_yAddr_uid33_fpInvSqrtTest_b_23_q, clk => clk, aclr => areset );

    -- redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg(DELAY,387)
    redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist45_yAddr_uid33_fpInvSqrtTest_b_23_q, xout => redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg_q, clk => clk, aclr => areset );

    -- memoryC0_uid60_invSqrtTables_lutmem(DUALMEM,262)@23 + 2
    -- in j@20000000
    memoryC0_uid60_invSqrtTables_lutmem_aa <= redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg_q;
    memoryC0_uid60_invSqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid60_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 18,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC0_uid60_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid60_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid60_invSqrtTables_lutmem_aa,
        q_a => memoryC0_uid60_invSqrtTables_lutmem_ir
    );
    memoryC0_uid60_invSqrtTables_lutmem_r <= memoryC0_uid60_invSqrtTables_lutmem_ir(17 downto 0);

    -- redist19_memoryC0_uid60_invSqrtTables_lutmem_r_1(DELAY,305)
    redist19_memoryC0_uid60_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid60_invSqrtTables_lutmem_r, xout => redist19_memoryC0_uid60_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid59_invSqrtTables_lutmem(DUALMEM,261)@23 + 2
    -- in j@20000000
    memoryC0_uid59_invSqrtTables_lutmem_aa <= redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg_q;
    memoryC0_uid59_invSqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid59_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC0_uid59_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid59_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid59_invSqrtTables_lutmem_aa,
        q_a => memoryC0_uid59_invSqrtTables_lutmem_ir
    );
    memoryC0_uid59_invSqrtTables_lutmem_r <= memoryC0_uid59_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist20_memoryC0_uid59_invSqrtTables_lutmem_r_1(DELAY,306)
    redist20_memoryC0_uid59_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid59_invSqrtTables_lutmem_r, xout => redist20_memoryC0_uid59_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid58_invSqrtTables_lutmem(DUALMEM,260)@23 + 2
    -- in j@20000000
    memoryC0_uid58_invSqrtTables_lutmem_aa <= redist45_yAddr_uid33_fpInvSqrtTest_b_23_outputreg_q;
    memoryC0_uid58_invSqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid58_invSqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "InvSqrt_0002_memoryC0_uid58_invSqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid58_invSqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid58_invSqrtTables_lutmem_aa,
        q_a => memoryC0_uid58_invSqrtTables_lutmem_ir
    );
    memoryC0_uid58_invSqrtTables_lutmem_r <= memoryC0_uid58_invSqrtTables_lutmem_ir(19 downto 0);

    -- redist21_memoryC0_uid58_invSqrtTables_lutmem_r_1(DELAY,307)
    redist21_memoryC0_uid58_invSqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid58_invSqrtTables_lutmem_r, xout => redist21_memoryC0_uid58_invSqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid61_invSqrtTables(BITJOIN,60)@26
    os_uid61_invSqrtTables_q <= redist19_memoryC0_uid60_invSqrtTables_lutmem_r_1_q & redist20_memoryC0_uid59_invSqrtTables_lutmem_r_1_q & redist21_memoryC0_uid58_invSqrtTables_lutmem_r_1_q;

    -- s5sumAHighB_uid117_invPolyEval(ADD,116)@26
    s5sumAHighB_uid117_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => os_uid61_invSqrtTables_q(57)) & os_uid61_invSqrtTables_q));
    s5sumAHighB_uid117_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 49 => highBBits_uid116_invPolyEval_b(48)) & highBBits_uid116_invPolyEval_b));
    s5sumAHighB_uid117_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s5sumAHighB_uid117_invPolyEval_a) + SIGNED(s5sumAHighB_uid117_invPolyEval_b));
    s5sumAHighB_uid117_invPolyEval_q <= s5sumAHighB_uid117_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid115_invPolyEval(BITSELECT,114)@26
    lowRangeB_uid115_invPolyEval_in <= redist22_os_uid229_pT5_uid114_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid115_invPolyEval_b <= lowRangeB_uid115_invPolyEval_in(1 downto 0);

    -- s5_uid118_invPolyEval(BITJOIN,117)@26
    s5_uid118_invPolyEval_q <= s5sumAHighB_uid117_invPolyEval_q & lowRangeB_uid115_invPolyEval_b;

    -- fxpInvSqrtRes_uid36_fpInvSqrtTest(BITSELECT,35)@26
    fxpInvSqrtRes_uid36_fpInvSqrtTest_in <= s5_uid118_invPolyEval_q(57 downto 0);
    fxpInvSqrtRes_uid36_fpInvSqrtTest_b <= fxpInvSqrtRes_uid36_fpInvSqrtTest_in(57 downto 5);

    -- fxpInverseResFrac_uid44_fpInvSqrtTest(BITSELECT,43)@26
    fxpInverseResFrac_uid44_fpInvSqrtTest_in <= fxpInvSqrtRes_uid36_fpInvSqrtTest_b(51 downto 0);
    fxpInverseResFrac_uid44_fpInvSqrtTest_b <= fxpInverseResFrac_uid44_fpInvSqrtTest_in(51 downto 0);

    -- redist33_fxpInverseResFrac_uid44_fpInvSqrtTest_b_1(DELAY,319)
    redist33_fxpInverseResFrac_uid44_fpInvSqrtTest_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fxpInverseResFrac_uid44_fpInvSqrtTest_b, xout => redist33_fxpInverseResFrac_uid44_fpInvSqrtTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid53_fpInvSqrtTest(MUX,52)@27
    fracRPostExc_uid53_fpInvSqrtTest_s <= redist32_outMuxSelEnc_uid51_fpInvSqrtTest_q_25_outputreg_q;
    fracRPostExc_uid53_fpInvSqrtTest_combproc: PROCESS (fracRPostExc_uid53_fpInvSqrtTest_s, cstAllZWF_uid7_fpInvSqrtTest_q, redist33_fxpInverseResFrac_uid44_fpInvSqrtTest_b_1_q, cstNaNWF_uid8_fpInvSqrtTest_q)
    BEGIN
        CASE (fracRPostExc_uid53_fpInvSqrtTest_s) IS
            WHEN "00" => fracRPostExc_uid53_fpInvSqrtTest_q <= cstAllZWF_uid7_fpInvSqrtTest_q;
            WHEN "01" => fracRPostExc_uid53_fpInvSqrtTest_q <= redist33_fxpInverseResFrac_uid44_fpInvSqrtTest_b_1_q;
            WHEN "10" => fracRPostExc_uid53_fpInvSqrtTest_q <= cstAllZWF_uid7_fpInvSqrtTest_q;
            WHEN "11" => fracRPostExc_uid53_fpInvSqrtTest_q <= cstNaNWF_uid8_fpInvSqrtTest_q;
            WHEN OTHERS => fracRPostExc_uid53_fpInvSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid56_fpInvSqrtTest(BITJOIN,55)@27
    R_uid56_fpInvSqrtTest_q <= redist31_signR_uid55_fpInvSqrtTest_q_25_q & expRPostExc_uid54_fpInvSqrtTest_q & fracRPostExc_uid53_fpInvSqrtTest_q;

    -- xOut(GPOUT,4)@27
    q <= R_uid56_fpInvSqrtTest_q;

END normal;
