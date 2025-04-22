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

-- VHDL created from threeDHyp_0002
-- VHDL created on Tue Apr 22 16:34:44 2025


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

entity threeDHyp_0002 is
    port (
        a : in std_logic_vector(63 downto 0);  -- float64_m52
        b : in std_logic_vector(63 downto 0);  -- float64_m52
        c : in std_logic_vector(63 downto 0);  -- float64_m52
        q : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end threeDHyp_0002;

architecture normal of threeDHyp_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid12_fpHypot3dTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid13_fpHypot3dTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid14_fpHypot3dTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_x_uid17_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid17_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid18_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid18_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid20_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid21_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid22_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid22_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid23_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid24_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid25_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid31_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid31_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid32_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid32_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid34_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid35_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid36_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid36_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid37_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid38_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid39_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_z_uid45_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_z_uid45_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid46_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid46_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid48_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_z_uid49_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_z_uid50_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_z_uid50_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid51_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid52_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_z_uid53_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid55_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracY_uid56_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracZ_uid57_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal bias_uid61_fpHypot3dTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal normBitXSqr_uid62_fpHypot3dTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normBitXSqr_uid62_fpHypot3dTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normBitYSqr_uid63_fpHypot3dTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normBitYSqr_uid63_fpHypot3dTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normBitZSqr_uid64_fpHypot3dTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normBitZSqr_uid64_fpHypot3dTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expXTimes2_uid65_fpHypot3dTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expYTimes2_uid67_fpHypot3dTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expZTimes2_uid69_fpHypot3dTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expP_uid71_fpHypot3dTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expP_uid71_fpHypot3dTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expP_uid71_fpHypot3dTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expP_uid71_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expQ_uid72_fpHypot3dTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expQ_uid72_fpHypot3dTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expQ_uid72_fpHypot3dTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expQ_uid72_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expS_uid73_fpHypot3dTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expS_uid73_fpHypot3dTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expS_uid73_fpHypot3dTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expS_uid73_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal normFracXSqrHigh_uid74_fpHypot3dTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normFracXSqrHigh_uid74_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal normFracXSqrLow_uid75_fpHypot3dTest_in : STD_LOGIC_VECTOR (104 downto 0);
    signal normFracXSqrLow_uid75_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal ofracP_uid76_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracP_uid76_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal normFracYSqrHigh_uid77_fpHypot3dTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normFracYSqrHigh_uid77_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal normFracYSqrLow_uid78_fpHypot3dTest_in : STD_LOGIC_VECTOR (104 downto 0);
    signal normFracYSqrLow_uid78_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal ofracQ_uid79_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracQ_uid79_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal normFracZSqrHigh_uid80_fpHypot3dTest_in : STD_LOGIC_VECTOR (105 downto 0);
    signal normFracZSqrHigh_uid80_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal normFracZSqrLow_uid81_fpHypot3dTest_in : STD_LOGIC_VECTOR (104 downto 0);
    signal normFracZSqrLow_uid81_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal ofracS_uid82_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracS_uid82_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal pGTEq_uid83_fpHypot3dTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal pGTEq_uid83_fpHypot3dTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal pGTEq_uid83_fpHypot3dTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal pGTEq_uid83_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expCmpGtePQ_uid84_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expCmpGtePQ_uid84_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal pGTEs_uid85_fpHypot3dTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal pGTEs_uid85_fpHypot3dTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal pGTEs_uid85_fpHypot3dTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal pGTEs_uid85_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expCmpGtePS_uid86_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expCmpGtePS_uid86_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal qGTEs_uid87_fpHypot3dTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal qGTEs_uid87_fpHypot3dTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal qGTEs_uid87_fpHypot3dTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal qGTEs_uid87_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expCmpGteQS_uid88_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expCmpGteQS_uid88_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concCompareExpRes_uid89_fpHypot3dTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal selATab_uid90_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal selBTab_uid91_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal selCTab_uid92_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expA_uid93_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expA_uid93_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expB_uid94_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expB_uid94_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expC_uid95_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expC_uid95_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expAmB_uid96_fpHypot3dTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmB_uid96_fpHypot3dTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmB_uid96_fpHypot3dTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmB_uid96_fpHypot3dTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmC_uid97_fpHypot3dTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmC_uid97_fpHypot3dTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmC_uid97_fpHypot3dTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expAmC_uid97_fpHypot3dTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal cWFP2_uid98_fpHypot3dTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOutB_uid99_fpHypot3dTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal shiftedOutB_uid99_fpHypot3dTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal shiftedOutB_uid99_fpHypot3dTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal shiftedOutB_uid99_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOutC_uid101_fpHypot3dTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal shiftedOutC_uid101_fpHypot3dTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal shiftedOutC_uid101_fpHypot3dTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal shiftedOutC_uid101_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracA_uid102_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracA_uid102_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracB_uid103_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracB_uid103_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracC_uid104_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracC_uid104_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal cstbfvZwfp1_uid105_fpHypot3dTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expDiffShiftRangeB_uid106_fpHypot3dTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal expDiffShiftRangeB_uid106_fpHypot3dTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValueB_uid107_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValueB_uid107_fpHypot3dTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expDiffShiftRangeC_uid108_fpHypot3dTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal expDiffShiftRangeC_uid108_fpHypot3dTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValueC_uid109_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValueC_uid109_fpHypot3dTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excAZero_uid110_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal excAZero_uid110_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZero_uid111_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal excBZero_uid111_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excCZero_uid112_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal excCZero_uid112_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracBFlushToZero_uid113_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracCFlushToZero_uid114_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zerosWFp1_uid115_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracCPostExc_uid116_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracCPostExc_uid116_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracBPostExc_uid117_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracBPostExc_uid117_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracAPostExc_uid118_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracAPostExc_uid118_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal cstZ2_uid119_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracBPostExcG_uid120_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal oFracBPostExcG_uid122_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal pad_oFracAPostExc_uid118_uid126_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal soSPreNorm_uid126_fpHypot3dTest_a : STD_LOGIC_VECTOR (56 downto 0);
    signal soSPreNorm_uid126_fpHypot3dTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal soSPreNorm_uid126_fpHypot3dTest_c : STD_LOGIC_VECTOR (56 downto 0);
    signal soSPreNorm_uid126_fpHypot3dTest_o : STD_LOGIC_VECTOR (56 downto 0);
    signal soSPreNorm_uid126_fpHypot3dTest_q : STD_LOGIC_VECTOR (56 downto 0);
    signal sumOfSquareNormBits_uid128_fpHypot3dTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal soSRangeHigh_uid129_fpHypot3dTest_in : STD_LOGIC_VECTOR (55 downto 0);
    signal soSRangeHigh_uid129_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal soSRangeMed_uid130_fpHypot3dTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal soSRangeMed_uid130_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal soSRangeLow_uid131_fpHypot3dTest_in : STD_LOGIC_VECTOR (53 downto 0);
    signal soSRangeLow_uid131_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal resFracNorm_uid132_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal resFracNorm_uid132_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expCatRndBit_uid135_fpHypot3dTest_q : STD_LOGIC_VECTOR (65 downto 0);
    signal cst01_2_uid136_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cst10_2_uid137_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expUpdateVal_uid138_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expUpdateVal_uid138_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal normCatFracSoS_uid140_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal expFracPostNorm_uid141_fpHypot3dTest_a : STD_LOGIC_VECTOR (67 downto 0);
    signal expFracPostNorm_uid141_fpHypot3dTest_b : STD_LOGIC_VECTOR (67 downto 0);
    signal expFracPostNorm_uid141_fpHypot3dTest_o : STD_LOGIC_VECTOR (67 downto 0);
    signal expFracPostNorm_uid141_fpHypot3dTest_q : STD_LOGIC_VECTOR (66 downto 0);
    signal fracRPreSqrt_uid142_fpHypot3dTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreSqrt_uid142_fpHypot3dTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreSqrt_uid143_fpHypot3dTest_in : STD_LOGIC_VECTOR (65 downto 0);
    signal expRPreSqrt_uid143_fpHypot3dTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expSumOfSquaresUnbiased_uid144_fpHypot3dTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumOfSquaresUnbiased_uid144_fpHypot3dTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumOfSquaresUnbiased_uid144_fpHypot3dTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumOfSquaresUnbiased_uid144_fpHypot3dTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal expREven_uid145_fpHypot3dTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal biasP1Signal_uid146_fpHypot3dTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expOddSig_uid147_fpHypot3dTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expOddSig_uid147_fpHypot3dTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expOddSig_uid147_fpHypot3dTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expOddSig_uid147_fpHypot3dTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal expROdd_uid148_fpHypot3dTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal x0_uid149_fpHypot3dTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal x0_uid149_fpHypot3dTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid151_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid152_fpHypot3dTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid152_fpHypot3dTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal addrFull_uid153_fpHypot3dTest_q : STD_LOGIC_VECTOR (52 downto 0);
    signal yAddr_uid155_fpHypot3dTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yy_uid156_fpHypot3dTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal yy_uid156_fpHypot3dTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal fracRPreInc_uid158_fpHypot3dTest_in : STD_LOGIC_VECTOR (58 downto 0);
    signal fracRPreInc_uid158_fpHypot3dTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal fracRPostInc_uid161_fpHypot3dTest_a : STD_LOGIC_VECTOR (55 downto 0);
    signal fracRPostInc_uid161_fpHypot3dTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracRPostInc_uid161_fpHypot3dTest_o : STD_LOGIC_VECTOR (55 downto 0);
    signal fracRPostInc_uid161_fpHypot3dTest_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracR_uid162_fpHypot3dTest_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracR_uid162_fpHypot3dTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostIncMSBU_uid163_fpHypot3dTest_in : STD_LOGIC_VECTOR (54 downto 0);
    signal fracRPostIncMSBU_uid163_fpHypot3dTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostInc_uid164_fpHypot3dTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expRPostInc_uid164_fpHypot3dTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expRPostInc_uid164_fpHypot3dTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expRPostInc_uid164_fpHypot3dTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal sqrtUnderflow_uid165_fpHypot3dTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal sqrtUnderflow_uid165_fpHypot3dTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal sqrtUnderflow_uid165_fpHypot3dTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal sqrtUnderflow_uid165_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sqrtOverflow_uid167_fpHypot3dTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal sqrtOverflow_uid167_fpHypot3dTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal sqrtOverflow_uid167_fpHypot3dTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal sqrtOverflow_uid167_fpHypot3dTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXYZ_uid168_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXYZ_uid168_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInf_uid169_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsInf_uid169_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal noneInf_uid170_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal onIsReg_uid171_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal onIsReg_uid171_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXYRUdf_uid172_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid173_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcZN_uid174_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYN_uid175_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXN_uid176_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid177_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid178_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid179_fpHypot3dTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid180_fpHypot3dTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal NaNFracRPostExc_uid181_fpHypot3dTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid185_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid185_fpHypot3dTest_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExc_uid188_fpHypot3dTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPreExc_uid188_fpHypot3dTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPostExc_uid190_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid190_fpHypot3dTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal RHypot_uid191_fpHypot3dTest_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid195_sqrtTables_q : STD_LOGIC_VECTOR (56 downto 0);
    signal os_uid199_sqrtTables_q : STD_LOGIC_VECTOR (48 downto 0);
    signal yT1_uid219_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeB_uid221_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid221_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid222_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid223_invPolyEval_a : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid223_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid223_invPolyEval_o : STD_LOGIC_VECTOR (24 downto 0);
    signal s1sumAHighB_uid223_invPolyEval_q : STD_LOGIC_VECTOR (24 downto 0);
    signal s1_uid224_invPolyEval_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yT2_uid225_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid227_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid227_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid228_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal s2sumAHighB_uid229_invPolyEval_a : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid229_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid229_invPolyEval_o : STD_LOGIC_VECTOR (33 downto 0);
    signal s2sumAHighB_uid229_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal s2_uid230_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yT3_uid231_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal lowRangeB_uid233_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid233_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid234_invPolyEval_b : STD_LOGIC_VECTOR (32 downto 0);
    signal s3sumAHighB_uid235_invPolyEval_a : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid235_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid235_invPolyEval_o : STD_LOGIC_VECTOR (40 downto 0);
    signal s3sumAHighB_uid235_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal s3_uid236_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal yT4_uid237_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeB_uid239_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid239_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid240_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal s4sumAHighB_uid241_invPolyEval_a : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid241_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid241_invPolyEval_o : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid241_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal s4_uid242_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lowRangeB_uid245_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid245_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid246_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s5sumAHighB_uid247_invPolyEval_a : STD_LOGIC_VECTOR (57 downto 0);
    signal s5sumAHighB_uid247_invPolyEval_b : STD_LOGIC_VECTOR (57 downto 0);
    signal s5sumAHighB_uid247_invPolyEval_o : STD_LOGIC_VECTOR (57 downto 0);
    signal s5sumAHighB_uid247_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal s5_uid248_invPolyEval_q : STD_LOGIC_VECTOR (59 downto 0);
    signal osig_uid251_pT1_uid220_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal osig_uid254_pT2_uid226_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal nx_mergedSignalTM_uid268_pT3_uid232_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aboveLeftY_mergedSignalTM_uid275_pT3_uid232_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_mergedSignalTM_uid279_pT3_uid232_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid285_pT3_uid232_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid285_pT3_uid232_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid286_pT3_uid232_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid288_pT3_uid232_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid289_pT3_uid232_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid289_pT3_uid232_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal nx_mergedSignalTM_uid303_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal topRangeX_uid305_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid306_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid307_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftY_mergedSignalTM_uid310_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid312_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightBottomX_mergedSignalTM_uid314_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid316_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid320_pT4_uid238_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid320_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid321_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid323_pT4_uid238_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid324_pT4_uid238_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid324_pT4_uid238_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal nx_mergedSignalTM_uid338_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (45 downto 0);
    signal topRangeX_uid340_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid341_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_mergedSignalTM_uid345_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid347_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_in : STD_LOGIC_VECTOR (18 downto 0);
    signal rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightBottomX_mergedSignalTM_uid349_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid352_pT5_uid244_invPolyEval_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aboveLeftX_uid352_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid353_pT5_uid244_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_uid353_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid357_pT5_uid244_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid357_pT5_uid244_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid357_pT5_uid244_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid357_pT5_uid244_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid357_pT5_uid244_invPolyEval_pr : signal is "logic";
    signal sm0_uid357_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid358_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal lowRangeB_uid359_pT5_uid244_invPolyEval_in : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid359_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal highBBits_uid360_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0_uid362_pT5_uid244_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid363_pT5_uid244_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid363_pT5_uid244_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal eq0_uid367_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid370_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid373_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid376_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid379_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid382_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid385_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid388_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid391_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid397_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid400_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid403_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid406_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid409_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid412_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid415_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid418_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid421_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid427_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid430_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq2_uid433_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq3_uid436_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq4_uid439_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq5_uid442_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq6_uid445_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq7_uid448_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq8_uid451_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_align_13_q : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_align_13_qint : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_align_15_q : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_align_15_qint : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_align_13_q : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_align_13_qint : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_align_15_q : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_align_15_qint : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_align_13_q : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_align_13_qint : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_align_15_q : STD_LOGIC_VECTOR (79 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_align_15_qint : STD_LOGIC_VECTOR (79 downto 0);
    signal rightShiftStage0Idx1Rng16_uid514_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal rightShiftStage0Idx1Pad16_uid515_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1_uid516_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0Idx2Rng32_uid517_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx2Pad32_uid518_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2_uid519_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0Idx3Rng48_uid520_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx3Pad48_uid521_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid522_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx1Rng4_uid525_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage1Idx1_uid527_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx2Rng8_uid528_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid530_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx3Rng12_uid531_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx3Pad12_uid532_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid533_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2Idx1Rng1_uid536_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage2Idx1_uid538_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2Idx2Rng2_uid539_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage2Idx2_uid541_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2Idx3Rng3_uid542_alignFracB_uid124_fpHypot3dTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal rightShiftStage2Idx3_uid544_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0Idx1Rng16_uid550_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal rightShiftStage0Idx1_uid552_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0Idx2Rng32_uid553_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx2_uid555_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0Idx3Rng48_uid556_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx3_uid558_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx1Rng4_uid561_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage1Idx1_uid563_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx2Rng8_uid564_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid566_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1Idx3Rng12_uid567_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx3_uid569_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2Idx1Rng1_uid572_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage2Idx1_uid574_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2Idx2Rng2_uid575_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage2Idx2_uid577_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2Idx3Rng3_uid578_alignFracC_uid125_fpHypot3dTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal rightShiftStage2Idx3_uid580_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q : STD_LOGIC_VECTOR (54 downto 0);
    signal memoryC0_uid193_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid193_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid193_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid193_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid193_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid193_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid194_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid194_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC0_uid194_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid194_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid194_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC0_uid194_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC1_uid197_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid197_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid197_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid197_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid197_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid197_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid198_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid198_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid198_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid198_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid198_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid198_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid201_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid201_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid201_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid201_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid201_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid201_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC3_uid204_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid204_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC3_uid204_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid204_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid204_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC3_uid204_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (32 downto 0);
    signal memoryC4_uid207_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid207_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC4_uid207_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid207_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid207_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC4_uid207_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC5_uid210_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC5_uid210_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid210_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid210_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid210_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid210_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (16 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (107 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (107 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (35 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (73 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q : STD_LOGIC_VECTOR (107 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (34 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_reset : std_logic;
    type prodXY_uid250_pT1_uid220_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(16 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_a0 : prodXY_uid250_pT1_uid220_invPolyEval_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid250_pT1_uid220_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid250_pT1_uid220_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_c0 : prodXY_uid250_pT1_uid220_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid250_pT1_uid220_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid250_pT1_uid220_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_l : prodXY_uid250_pT1_uid220_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_p : prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_u : prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_w : prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_x : prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_y : prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_s : prodXY_uid250_pT1_uid220_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid250_pT1_uid220_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_reset : std_logic;
    type prodXY_uid253_pT2_uid226_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_a0 : prodXY_uid253_pT2_uid226_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid253_pT2_uid226_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid253_pT2_uid226_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_c0 : prodXY_uid253_pT2_uid226_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid253_pT2_uid226_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid253_pT2_uid226_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_l : prodXY_uid253_pT2_uid226_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(50 downto 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_p : prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_u : prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_w : prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_x : prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_y : prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_s : prodXY_uid253_pT2_uid226_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid253_pT2_uid226_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_reset : std_logic;
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_a0 : prodXY_uid250_pT1_uid220_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid282_pT3_uid232_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_c0 : prodXY_uid250_pT1_uid220_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid282_pT3_uid232_invPolyEval_cma_c0 : signal is true;
    type sm0_uid282_pT3_uid232_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(35 downto 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_p : sm0_uid282_pT3_uid232_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_u : sm0_uid282_pT3_uid232_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_w : sm0_uid282_pT3_uid232_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_x : sm0_uid282_pT3_uid232_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_y : sm0_uid282_pT3_uid232_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_s : sm0_uid282_pT3_uid232_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid282_pT3_uid232_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_reset : std_logic;
    type sm0_uid317_pT4_uid238_invPolyEval_cma_a0type is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_a0 : sm0_uid317_pT4_uid238_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid317_pT4_uid238_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_c0 : sm0_uid317_pT4_uid238_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid317_pT4_uid238_invPolyEval_cma_c0 : signal is true;
    type sm0_uid317_pT4_uid238_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(53 downto 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_p : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_u : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_w : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_x : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_y : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_s : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid317_pT4_uid238_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_reset : std_logic;
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_a0 : sm0_uid317_pT4_uid238_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid354_pT5_uid244_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_c0 : sm0_uid317_pT4_uid238_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of sm0_uid354_pT5_uid244_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_p : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_u : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_w : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_x : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_y : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_s : sm0_uid317_pT4_uid238_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid354_pT5_uid244_invPolyEval_cma_ena1 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_reset : std_logic;
    type oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0 : signal is true;
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im0_cma_c0 : signal is true;
    type oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(51 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_p : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_u : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_w : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_x : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_y : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_s : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_qq : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_q : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena0 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena1 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_reset : std_logic;
    type oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0 : signal is true;
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im3_cma_c0 : signal is true;
    type oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype is array(NATURAL range <>) of UNSIGNED(52 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_p : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_u : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_w : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_x : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_y : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_s : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena0 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena1 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_reset : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im6_cma_a0 : signal is true;
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im6_cma_c0 : signal is true;
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_p : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_u : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_w : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_x : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_y : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_s : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena0 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena1 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_reset : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im9_cma_a0 : signal is true;
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracXSqr_uid58_fpHypot3dTest_im9_cma_c0 : signal is true;
    type oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype is array(NATURAL range <>) of UNSIGNED(53 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_p : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_u : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_w : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_x : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_y : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_s : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena0 : std_logic;
    signal oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena1 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_reset : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im0_cma_a0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im0_cma_c0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_p : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_u : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_w : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_x : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_y : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_s : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_qq : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_q : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena0 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena1 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_reset : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im3_cma_a0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im3_cma_c0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_p : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_u : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_w : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_x : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_y : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_s : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena0 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena1 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_reset : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im6_cma_a0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im6_cma_c0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_p : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_u : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_w : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_x : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_y : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_s : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena0 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena1 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_reset : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im9_cma_a0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracYSqr_uid59_fpHypot3dTest_im9_cma_c0 : signal is true;
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_p : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_u : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_w : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_x : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_y : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_s : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena0 : std_logic;
    signal oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena1 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_reset : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im0_cma_a0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im0_cma_c0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_p : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_u : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_w : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_x : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_y : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_s : oFracXSqr_uid58_fpHypot3dTest_im0_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_qq : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_q : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena0 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena1 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_reset : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im3_cma_a0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im3_cma_c0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_p : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_u : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_w : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_x : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_y : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_s : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena0 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena1 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_reset : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im6_cma_a0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im6_cma_c0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_p : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_u : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_w : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_x : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_y : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_s : oFracXSqr_uid58_fpHypot3dTest_im3_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena0 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena1 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_reset : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im9_cma_a0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_c0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 0);
    attribute preserve of oFracZSqr_uid60_fpHypot3dTest_im9_cma_c0 : signal is true;
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_p : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_u : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_w : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_x : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_y : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_s : oFracXSqr_uid58_fpHypot3dTest_im9_cma_ptype(0 to 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena0 : std_logic;
    signal oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0 : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0 : prodXY_uid250_pT1_uid220_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0 : signal is true;
    type multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_l : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ltype(0 to 1);
    type multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(36 downto 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_p : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(37 downto 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_u : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_w : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_x : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_y : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_s : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0 : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0 : prodXY_uid250_pT1_uid220_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_l : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ltype(0 to 1);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_p : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_u : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_w : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_x : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_y : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_s : multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0 : oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0 : sm0_uid317_pT4_uid238_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0 : signal is true;
    type multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(27 downto 0);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_l : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ltype(0 to 1);
    type multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(54 downto 0);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_p : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(55 downto 0);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_u : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_w : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_x : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_y : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_s : multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena1 : std_logic;
    signal expX_uid6_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expX_uid6_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (51 downto 0);
    signal expY_uid7_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expY_uid7_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (51 downto 0);
    signal expZ_uid8_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expZ_uid8_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (51 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (72 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (18 downto 0);
    signal oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (32 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (18 downto 0);
    signal oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (32 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (18 downto 0);
    signal oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (32 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_d : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_e : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_f : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_g : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_h : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_i : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist1_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist2_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist3_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist4_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist5_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist6_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist7_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist8_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist9_rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist10_rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist11_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist12_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist13_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist14_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist18_multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist19_multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist20_multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist21_oFracZSqr_uid60_fpHypot3dTest_im9_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist22_oFracZSqr_uid60_fpHypot3dTest_im6_cma_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist23_oFracZSqr_uid60_fpHypot3dTest_im3_cma_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist24_oFracZSqr_uid60_fpHypot3dTest_im0_cma_q_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist25_oFracYSqr_uid59_fpHypot3dTest_im9_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist26_oFracYSqr_uid59_fpHypot3dTest_im6_cma_q_2_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist27_oFracYSqr_uid59_fpHypot3dTest_im3_cma_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist28_oFracYSqr_uid59_fpHypot3dTest_im0_cma_q_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist29_oFracXSqr_uid58_fpHypot3dTest_im9_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist30_oFracXSqr_uid58_fpHypot3dTest_im6_cma_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist31_oFracXSqr_uid58_fpHypot3dTest_im3_cma_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist32_oFracXSqr_uid58_fpHypot3dTest_im0_cma_q_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist33_sm0_uid354_pT5_uid244_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist34_sm0_uid317_pT4_uid238_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (53 downto 0);
    signal redist35_sm0_uid282_pT3_uid232_invPolyEval_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist36_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (72 downto 0);
    signal redist37_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (72 downto 0);
    signal redist38_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q : STD_LOGIC_VECTOR (72 downto 0);
    signal redist39_memoryC5_uid210_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist40_memoryC4_uid207_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist41_memoryC3_uid204_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist42_memoryC2_uid201_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist43_memoryC1_uid198_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist44_memoryC1_uid197_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist45_memoryC0_uid194_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist46_memoryC0_uid193_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist47_and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_sm0_uid357_pT5_uid244_invPolyEval_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist51_aboveLeftY_uid353_pT5_uid244_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_aboveLeftX_uid352_pT5_uid244_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist53_rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist54_topRangeY_uid341_pT5_uid244_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist55_topRangeX_uid340_pT5_uid244_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist56_os_uid324_pT4_uid238_invPolyEval_b_1_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist57_os_uid289_pT3_uid232_invPolyEval_b_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist58_osig_uid254_pT2_uid226_invPolyEval_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist59_osig_uid251_pT1_uid220_invPolyEval_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist60_highBBits_uid246_invPolyEval_b_1_q : STD_LOGIC_VECTOR (49 downto 0);
    signal redist61_lowRangeB_uid245_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist62_lowRangeB_uid239_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_lowRangeB_uid233_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_lowRangeB_uid227_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_lowRangeB_uid221_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_expRPreExc_uid188_fpHypot3dTest_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist67_onIsReg_uid171_fpHypot3dTest_q_41_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_oneIsInf_uid169_fpHypot3dTest_q_41_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist69_excXYZ_uid168_fpHypot3dTest_q_39_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_fracRPostIncMSBU_uid163_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_fracR_uid162_fpHypot3dTest_b_4_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist72_fracRPreInc_uid158_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (54 downto 0);
    signal redist73_yy_uid156_fpHypot3dTest_b_3_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist74_yy_uid156_fpHypot3dTest_b_7_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist75_yy_uid156_fpHypot3dTest_b_11_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist78_yAddr_uid155_fpHypot3dTest_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist79_yAddr_uid155_fpHypot3dTest_b_7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist80_yAddr_uid155_fpHypot3dTest_b_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist81_yAddr_uid155_fpHypot3dTest_b_17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist82_yAddr_uid155_fpHypot3dTest_b_23_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist84_expOddSelect_uid151_fpHypot3dTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist85_expROdd_uid148_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist86_expREven_uid145_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist88_fracRPreSqrt_uid142_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist90_excCZero_uid112_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist91_excBZero_uid111_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist92_expDiffShiftRangeC_uid108_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist93_expDiffShiftRangeB_uid106_fpHypot3dTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist94_oFracC_uid104_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist95_oFracB_uid103_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist97_ofracS_uid82_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist98_ofracQ_uid79_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist99_ofracP_uid76_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist100_expS_uid73_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist101_expQ_uid72_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist102_expP_uid71_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist103_excN_z_uid50_fpHypot3dTest_q_41_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist104_excZ_z_uid45_fpHypot3dTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist105_excZ_z_uid45_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist106_excN_y_uid36_fpHypot3dTest_q_41_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist107_excZ_y_uid31_fpHypot3dTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist108_excZ_y_uid31_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist109_excN_x_uid22_fpHypot3dTest_q_41_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist110_excZ_x_uid17_fpHypot3dTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_reset0 : std_logic;
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i : signal is true;
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq : std_logic;
    attribute preserve of redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq : signal is true;
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q : signal is true;
    signal redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_reset0 : std_logic;
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i : signal is true;
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq : std_logic;
    attribute preserve of redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq : signal is true;
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q : signal is true;
    signal redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_reset0 : std_logic;
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i : signal is true;
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq : std_logic;
    attribute preserve of redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq : signal is true;
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q : signal is true;
    signal redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_fracR_uid162_fpHypot3dTest_b_4_inputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist71_fracR_uid162_fpHypot3dTest_b_4_outputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist73_yy_uid156_fpHypot3dTest_b_3_inputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist74_yy_uid156_fpHypot3dTest_b_7_inputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist74_yy_uid156_fpHypot3dTest_b_7_outputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist75_yy_uid156_fpHypot3dTest_b_11_inputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist75_yy_uid156_fpHypot3dTest_b_11_outputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_inputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_outputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_mem_reset0 : std_logic;
    signal redist76_yy_uid156_fpHypot3dTest_b_16_mem_ia : STD_LOGIC_VECTOR (44 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_mem_iq : STD_LOGIC_VECTOR (44 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_mem_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_i : signal is true;
    signal redist76_yy_uid156_fpHypot3dTest_b_16_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_q : signal is true;
    signal redist76_yy_uid156_fpHypot3dTest_b_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_inputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_outputreg_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_mem_reset0 : std_logic;
    signal redist77_yy_uid156_fpHypot3dTest_b_21_mem_ia : STD_LOGIC_VECTOR (44 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_mem_iq : STD_LOGIC_VECTOR (44 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_mem_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_i : signal is true;
    signal redist77_yy_uid156_fpHypot3dTest_b_21_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_q : signal is true;
    signal redist77_yy_uid156_fpHypot3dTest_b_21_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_yAddr_uid155_fpHypot3dTest_b_12_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist81_yAddr_uid155_fpHypot3dTest_b_17_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist82_yAddr_uid155_fpHypot3dTest_b_23_inputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist82_yAddr_uid155_fpHypot3dTest_b_23_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_inputreg_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_outputreg_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_reset0 : std_logic;
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_iq : STD_LOGIC_VECTOR (12 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i : signal is true;
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_eq : std_logic;
    attribute preserve of redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_eq : signal is true;
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_q : signal is true;
    signal redist83_expRMux_uid152_fpHypot3dTest_q_27_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_inputreg_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_outputreg_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_inputreg_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_outputreg_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_reset0 : std_logic;
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_ia : STD_LOGIC_VECTOR (12 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_iq : STD_LOGIC_VECTOR (12 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_i : signal is true;
    signal redist96_expA_uid93_fpHypot3dTest_q_8_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_q : signal is true;
    signal redist96_expA_uid93_fpHypot3dTest_q_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllOWE_uid12_fpHypot3dTest(CONSTANT,11)
    cstAllOWE_uid12_fpHypot3dTest_q <= "11111111111";

    -- redist77_yy_uid156_fpHypot3dTest_b_21_notEnable(LOGICAL,921)
    redist77_yy_uid156_fpHypot3dTest_b_21_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist77_yy_uid156_fpHypot3dTest_b_21_nor(LOGICAL,922)
    redist77_yy_uid156_fpHypot3dTest_b_21_nor_q <= not (redist77_yy_uid156_fpHypot3dTest_b_21_notEnable_q or redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_q);

    -- redist77_yy_uid156_fpHypot3dTest_b_21_cmpReg(REG,920)
    redist77_yy_uid156_fpHypot3dTest_b_21_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena(REG,923)
    redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist77_yy_uid156_fpHypot3dTest_b_21_nor_q = "1") THEN
                redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_q <= STD_LOGIC_VECTOR(redist77_yy_uid156_fpHypot3dTest_b_21_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist77_yy_uid156_fpHypot3dTest_b_21_enaAnd(LOGICAL,924)
    redist77_yy_uid156_fpHypot3dTest_b_21_enaAnd_q <= redist77_yy_uid156_fpHypot3dTest_b_21_sticky_ena_q and VCC_q;

    -- redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt(COUNTER,918)
    -- low=0, high=1, step=1, init=0
    redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_i <= redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_i, 1)));

    -- redist76_yy_uid156_fpHypot3dTest_b_16_notEnable(LOGICAL,911)
    redist76_yy_uid156_fpHypot3dTest_b_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist76_yy_uid156_fpHypot3dTest_b_16_nor(LOGICAL,912)
    redist76_yy_uid156_fpHypot3dTest_b_16_nor_q <= not (redist76_yy_uid156_fpHypot3dTest_b_16_notEnable_q or redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_q);

    -- redist76_yy_uid156_fpHypot3dTest_b_16_cmpReg(REG,910)
    redist76_yy_uid156_fpHypot3dTest_b_16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena(REG,913)
    redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist76_yy_uid156_fpHypot3dTest_b_16_nor_q = "1") THEN
                redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist76_yy_uid156_fpHypot3dTest_b_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist76_yy_uid156_fpHypot3dTest_b_16_enaAnd(LOGICAL,914)
    redist76_yy_uid156_fpHypot3dTest_b_16_enaAnd_q <= redist76_yy_uid156_fpHypot3dTest_b_16_sticky_ena_q and VCC_q;

    -- redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt(COUNTER,908)
    -- low=0, high=1, step=1, init=0
    redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_i <= redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_i, 1)));

    -- cst10_2_uid137_fpHypot3dTest(CONSTANT,136)
    cst10_2_uid137_fpHypot3dTest_q <= "10";

    -- cst01_2_uid136_fpHypot3dTest(CONSTANT,135)
    cst01_2_uid136_fpHypot3dTest_q <= "01";

    -- cstZ2_uid119_fpHypot3dTest(CONSTANT,118)
    cstZ2_uid119_fpHypot3dTest_q <= "00";

    -- aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval(CONSTANT,307)
    aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid578_alignFracC_uid125_fpHypot3dTest(BITSELECT,577)@14
    rightShiftStage2Idx3Rng3_uid578_alignFracC_uid125_fpHypot3dTest_b <= rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q(54 downto 3);

    -- rightShiftStage2Idx3_uid580_alignFracC_uid125_fpHypot3dTest(BITJOIN,579)@14
    rightShiftStage2Idx3_uid580_alignFracC_uid125_fpHypot3dTest_q <= aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval_q & rightShiftStage2Idx3Rng3_uid578_alignFracC_uid125_fpHypot3dTest_b;

    -- rightShiftStage2Idx2Rng2_uid575_alignFracC_uid125_fpHypot3dTest(BITSELECT,574)@14
    rightShiftStage2Idx2Rng2_uid575_alignFracC_uid125_fpHypot3dTest_b <= rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q(54 downto 2);

    -- rightShiftStage2Idx2_uid577_alignFracC_uid125_fpHypot3dTest(BITJOIN,576)@14
    rightShiftStage2Idx2_uid577_alignFracC_uid125_fpHypot3dTest_q <= cstZ2_uid119_fpHypot3dTest_q & rightShiftStage2Idx2Rng2_uid575_alignFracC_uid125_fpHypot3dTest_b;

    -- rightShiftStage2Idx1Rng1_uid572_alignFracC_uid125_fpHypot3dTest(BITSELECT,571)@14
    rightShiftStage2Idx1Rng1_uid572_alignFracC_uid125_fpHypot3dTest_b <= rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q(54 downto 1);

    -- rightShiftStage2Idx1_uid574_alignFracC_uid125_fpHypot3dTest(BITJOIN,573)@14
    rightShiftStage2Idx1_uid574_alignFracC_uid125_fpHypot3dTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid572_alignFracC_uid125_fpHypot3dTest_b;

    -- rightShiftStage1Idx3Pad12_uid532_alignFracB_uid124_fpHypot3dTest(CONSTANT,531)
    rightShiftStage1Idx3Pad12_uid532_alignFracB_uid124_fpHypot3dTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid567_alignFracC_uid125_fpHypot3dTest(BITSELECT,566)@13
    rightShiftStage1Idx3Rng12_uid567_alignFracC_uid125_fpHypot3dTest_b <= rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q(54 downto 12);

    -- rightShiftStage1Idx3_uid569_alignFracC_uid125_fpHypot3dTest(BITJOIN,568)@13
    rightShiftStage1Idx3_uid569_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage1Idx3Pad12_uid532_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage1Idx3Rng12_uid567_alignFracC_uid125_fpHypot3dTest_b;

    -- rightBottomX_bottomExtension_uid347_pT5_uid244_invPolyEval(CONSTANT,346)
    rightBottomX_bottomExtension_uid347_pT5_uid244_invPolyEval_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid564_alignFracC_uid125_fpHypot3dTest(BITSELECT,563)@13
    rightShiftStage1Idx2Rng8_uid564_alignFracC_uid125_fpHypot3dTest_b <= rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q(54 downto 8);

    -- rightShiftStage1Idx2_uid566_alignFracC_uid125_fpHypot3dTest(BITJOIN,565)@13
    rightShiftStage1Idx2_uid566_alignFracC_uid125_fpHypot3dTest_q <= rightBottomX_bottomExtension_uid347_pT5_uid244_invPolyEval_q & rightShiftStage1Idx2Rng8_uid564_alignFracC_uid125_fpHypot3dTest_b;

    -- rightBottomX_bottomExtension_uid312_pT4_uid238_invPolyEval(CONSTANT,311)
    rightBottomX_bottomExtension_uid312_pT4_uid238_invPolyEval_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid561_alignFracC_uid125_fpHypot3dTest(BITSELECT,560)@13
    rightShiftStage1Idx1Rng4_uid561_alignFracC_uid125_fpHypot3dTest_b <= rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q(54 downto 4);

    -- rightShiftStage1Idx1_uid563_alignFracC_uid125_fpHypot3dTest(BITJOIN,562)@13
    rightShiftStage1Idx1_uid563_alignFracC_uid125_fpHypot3dTest_q <= rightBottomX_bottomExtension_uid312_pT4_uid238_invPolyEval_q & rightShiftStage1Idx1Rng4_uid561_alignFracC_uid125_fpHypot3dTest_b;

    -- rightShiftStage0Idx3Pad48_uid521_alignFracB_uid124_fpHypot3dTest(CONSTANT,520)
    rightShiftStage0Idx3Pad48_uid521_alignFracB_uid124_fpHypot3dTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid556_alignFracC_uid125_fpHypot3dTest(BITSELECT,555)@13
    rightShiftStage0Idx3Rng48_uid556_alignFracC_uid125_fpHypot3dTest_b <= oFracBPostExcG_uid122_fpHypot3dTest_q(54 downto 48);

    -- rightShiftStage0Idx3_uid558_alignFracC_uid125_fpHypot3dTest(BITJOIN,557)@13
    rightShiftStage0Idx3_uid558_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0Idx3Pad48_uid521_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage0Idx3Rng48_uid556_alignFracC_uid125_fpHypot3dTest_b;

    -- rightShiftStage0Idx2Pad32_uid518_alignFracB_uid124_fpHypot3dTest(CONSTANT,517)
    rightShiftStage0Idx2Pad32_uid518_alignFracB_uid124_fpHypot3dTest_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng32_uid553_alignFracC_uid125_fpHypot3dTest(BITSELECT,552)@13
    rightShiftStage0Idx2Rng32_uid553_alignFracC_uid125_fpHypot3dTest_b <= oFracBPostExcG_uid122_fpHypot3dTest_q(54 downto 32);

    -- rightShiftStage0Idx2_uid555_alignFracC_uid125_fpHypot3dTest(BITJOIN,554)@13
    rightShiftStage0Idx2_uid555_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0Idx2Pad32_uid518_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage0Idx2Rng32_uid553_alignFracC_uid125_fpHypot3dTest_b;

    -- rightShiftStage0Idx1Pad16_uid515_alignFracB_uid124_fpHypot3dTest(CONSTANT,514)
    rightShiftStage0Idx1Pad16_uid515_alignFracB_uid124_fpHypot3dTest_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid550_alignFracC_uid125_fpHypot3dTest(BITSELECT,549)@13
    rightShiftStage0Idx1Rng16_uid550_alignFracC_uid125_fpHypot3dTest_b <= oFracBPostExcG_uid122_fpHypot3dTest_q(54 downto 16);

    -- rightShiftStage0Idx1_uid552_alignFracC_uid125_fpHypot3dTest(BITJOIN,551)@13
    rightShiftStage0Idx1_uid552_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0Idx1Pad16_uid515_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage0Idx1Rng16_uid550_alignFracC_uid125_fpHypot3dTest_b;

    -- zerosWFp1_uid115_fpHypot3dTest(CONSTANT,114)
    zerosWFp1_uid115_fpHypot3dTest_q <= "00000000000000000000000000000000000000000000000000000";

    -- expZ_uid8_fpHypot3dTest_merged_bit_select(BITSELECT,730)@0
    expZ_uid8_fpHypot3dTest_merged_bit_select_b <= STD_LOGIC_VECTOR(c(62 downto 52));
    expZ_uid8_fpHypot3dTest_merged_bit_select_c <= STD_LOGIC_VECTOR(c(51 downto 0));

    -- oFracZ_uid57_fpHypot3dTest(BITJOIN,56)@0
    oFracZ_uid57_fpHypot3dTest_q <= VCC_q & expZ_uid8_fpHypot3dTest_merged_bit_select_c;

    -- oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select(BITSELECT,734)@0
    oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b <= oFracZ_uid57_fpHypot3dTest_q(52 downto 27);
    oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c <= oFracZ_uid57_fpHypot3dTest_q(26 downto 0);

    -- redist11_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b_1(DELAY,762)
    redist11_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b, xout => redist11_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- redist12_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c_1(DELAY,763)
    redist12_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c, xout => redist12_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_im6_cma(CHAINMULTADD,723)@1 + 2
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_reset <= areset;
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena0 <= '1';
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena1 <= oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena0;
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_p(0) <= oFracZSqr_uid60_fpHypot3dTest_im6_cma_a0(0) * oFracZSqr_uid60_fpHypot3dTest_im6_cma_c0(0);
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_u(0) <= RESIZE(oFracZSqr_uid60_fpHypot3dTest_im6_cma_p(0),53);
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_w(0) <= oFracZSqr_uid60_fpHypot3dTest_im6_cma_u(0);
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_x(0) <= oFracZSqr_uid60_fpHypot3dTest_im6_cma_w(0);
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_y(0) <= oFracZSqr_uid60_fpHypot3dTest_im6_cma_x(0);
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im6_cma_a0 <= (others => (others => '0'));
            oFracZSqr_uid60_fpHypot3dTest_im6_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena0 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im6_cma_a0(0) <= RESIZE(UNSIGNED(redist12_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c_1_q),27);
                oFracZSqr_uid60_fpHypot3dTest_im6_cma_c0(0) <= RESIZE(UNSIGNED(redist11_oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b_1_q),26);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im6_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im6_cma_ena1 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im6_cma_s(0) <= oFracZSqr_uid60_fpHypot3dTest_im6_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im6_cma_s(0)(52 downto 0)), xout => oFracZSqr_uid60_fpHypot3dTest_im6_cma_qq, clk => clk, aclr => areset );
    oFracZSqr_uid60_fpHypot3dTest_im6_cma_q <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im6_cma_qq(52 downto 0));

    -- redist22_oFracZSqr_uid60_fpHypot3dTest_im6_cma_q_1(DELAY,773)
    redist22_oFracZSqr_uid60_fpHypot3dTest_im6_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_im6_cma_q, xout => redist22_oFracZSqr_uid60_fpHypot3dTest_im6_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_align_15(BITSHIFT,507)@4
    oFracZSqr_uid60_fpHypot3dTest_align_15_qint <= redist22_oFracZSqr_uid60_fpHypot3dTest_im6_cma_q_1_q & "000000000000000000000000000";
    oFracZSqr_uid60_fpHypot3dTest_align_15_q <= oFracZSqr_uid60_fpHypot3dTest_align_15_qint(79 downto 0);

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,744)@4
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_align_15_q(72 downto 0));
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_align_15_q(79 downto 73));

    -- oFracZSqr_uid60_fpHypot3dTest_im3_cma(CHAINMULTADD,722)@0 + 2
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_reset <= areset;
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena0 <= '1';
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena1 <= oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena0;
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_p(0) <= oFracZSqr_uid60_fpHypot3dTest_im3_cma_a0(0) * oFracZSqr_uid60_fpHypot3dTest_im3_cma_c0(0);
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_u(0) <= RESIZE(oFracZSqr_uid60_fpHypot3dTest_im3_cma_p(0),53);
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_w(0) <= oFracZSqr_uid60_fpHypot3dTest_im3_cma_u(0);
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_x(0) <= oFracZSqr_uid60_fpHypot3dTest_im3_cma_w(0);
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_y(0) <= oFracZSqr_uid60_fpHypot3dTest_im3_cma_x(0);
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im3_cma_a0 <= (others => (others => '0'));
            oFracZSqr_uid60_fpHypot3dTest_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena0 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im3_cma_a0(0) <= RESIZE(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracZSqr_uid60_fpHypot3dTest_im3_cma_c0(0) <= RESIZE(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im3_cma_ena1 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im3_cma_s(0) <= oFracZSqr_uid60_fpHypot3dTest_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im3_cma_s(0)(52 downto 0)), xout => oFracZSqr_uid60_fpHypot3dTest_im3_cma_qq, clk => clk, aclr => areset );
    oFracZSqr_uid60_fpHypot3dTest_im3_cma_q <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im3_cma_qq(52 downto 0));

    -- redist23_oFracZSqr_uid60_fpHypot3dTest_im3_cma_q_1(DELAY,774)
    redist23_oFracZSqr_uid60_fpHypot3dTest_im3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_im3_cma_q, xout => redist23_oFracZSqr_uid60_fpHypot3dTest_im3_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_align_13(BITSHIFT,505)@3
    oFracZSqr_uid60_fpHypot3dTest_align_13_qint <= redist23_oFracZSqr_uid60_fpHypot3dTest_im3_cma_q_1_q & "000000000000000000000000000";
    oFracZSqr_uid60_fpHypot3dTest_align_13_q <= oFracZSqr_uid60_fpHypot3dTest_align_13_qint(79 downto 0);

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,743)@3
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_align_13_q(72 downto 0));
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_align_13_q(79 downto 73));

    -- oFracZSqr_uid60_fpHypot3dTest_im0_cma(CHAINMULTADD,721)@0 + 2
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_reset <= areset;
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena0 <= '1';
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena1 <= oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena0;
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_p(0) <= oFracZSqr_uid60_fpHypot3dTest_im0_cma_a0(0) * oFracZSqr_uid60_fpHypot3dTest_im0_cma_c0(0);
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_u(0) <= RESIZE(oFracZSqr_uid60_fpHypot3dTest_im0_cma_p(0),52);
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_w(0) <= oFracZSqr_uid60_fpHypot3dTest_im0_cma_u(0);
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_x(0) <= oFracZSqr_uid60_fpHypot3dTest_im0_cma_w(0);
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_y(0) <= oFracZSqr_uid60_fpHypot3dTest_im0_cma_x(0);
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im0_cma_a0 <= (others => (others => '0'));
            oFracZSqr_uid60_fpHypot3dTest_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena0 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im0_cma_a0(0) <= RESIZE(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b),26);
                oFracZSqr_uid60_fpHypot3dTest_im0_cma_c0(0) <= RESIZE(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im0_cma_ena1 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im0_cma_s(0) <= oFracZSqr_uid60_fpHypot3dTest_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 52, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im0_cma_s(0)(51 downto 0)), xout => oFracZSqr_uid60_fpHypot3dTest_im0_cma_qq, clk => clk, aclr => areset );
    oFracZSqr_uid60_fpHypot3dTest_im0_cma_q <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im0_cma_qq(51 downto 0));

    -- redist24_oFracZSqr_uid60_fpHypot3dTest_im0_cma_q_1(DELAY,775)
    redist24_oFracZSqr_uid60_fpHypot3dTest_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_im0_cma_q, xout => redist24_oFracZSqr_uid60_fpHypot3dTest_im0_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,747)@3
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist24_oFracZSqr_uid60_fpHypot3dTest_im0_cma_q_1_q(18 downto 0));
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist24_oFracZSqr_uid60_fpHypot3dTest_im0_cma_q_1_q(51 downto 19));

    -- oFracZSqr_uid60_fpHypot3dTest_im9_cma(CHAINMULTADD,724)@0 + 2
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_reset <= areset;
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena0 <= '1';
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena1 <= oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena0;
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_p(0) <= oFracZSqr_uid60_fpHypot3dTest_im9_cma_a0(0) * oFracZSqr_uid60_fpHypot3dTest_im9_cma_c0(0);
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_u(0) <= RESIZE(oFracZSqr_uid60_fpHypot3dTest_im9_cma_p(0),54);
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_w(0) <= oFracZSqr_uid60_fpHypot3dTest_im9_cma_u(0);
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_x(0) <= oFracZSqr_uid60_fpHypot3dTest_im9_cma_w(0);
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_y(0) <= oFracZSqr_uid60_fpHypot3dTest_im9_cma_x(0);
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im9_cma_a0 <= (others => (others => '0'));
            oFracZSqr_uid60_fpHypot3dTest_im9_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena0 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im9_cma_a0(0) <= RESIZE(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracZSqr_uid60_fpHypot3dTest_im9_cma_c0(0) <= RESIZE(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_bs1_merged_bit_select_c),27);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_im9_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracZSqr_uid60_fpHypot3dTest_im9_cma_ena1 = '1') THEN
                oFracZSqr_uid60_fpHypot3dTest_im9_cma_s(0) <= oFracZSqr_uid60_fpHypot3dTest_im9_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im9_cma_s(0)(53 downto 0)), xout => oFracZSqr_uid60_fpHypot3dTest_im9_cma_qq, clk => clk, aclr => areset );
    oFracZSqr_uid60_fpHypot3dTest_im9_cma_q <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_im9_cma_qq(53 downto 0));

    -- redist21_oFracZSqr_uid60_fpHypot3dTest_im9_cma_q_1(DELAY,772)
    redist21_oFracZSqr_uid60_fpHypot3dTest_im9_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_im9_cma_q, xout => redist21_oFracZSqr_uid60_fpHypot3dTest_im9_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,689)@3
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q <= oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist21_oFracZSqr_uid60_fpHypot3dTest_im9_cma_q_1_q;

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2(ADD,633)@3 + 1
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q);
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_a) + UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_c(0) <= oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_o(73);
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_q <= oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_o(72 downto 0);

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2(ADD,642)@4 + 1
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_q);
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_a) + UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_c(0) <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_o(73);
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_o(72 downto 0);

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_UpperBits_for_b(CONSTANT,603)
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_UpperBits_for_b_q <= "0000000000000000000000000000";

    -- redist3_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,754)
    redist3_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist3_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,707)@5
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_UpperBits_for_b_q & redist3_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_UpperBits_for_b(CONSTANT,594)
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_UpperBits_for_b_q <= "000000000000000000000000000";

    -- redist4_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,755)
    redist4_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist4_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,697)@4
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_UpperBits_for_b_q & redist4_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist0_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,751)
    redist0_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist0_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,692)@4
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist0_oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2(ADD,634)@4 + 1
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_cin <= oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p1_of_2_c;
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q) & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_cin(0);
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_a) + UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_q <= oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_o(34 downto 1);

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,702)@5
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & oFracZSqr_uid60_fpHypot3dTest_result_add_0_0_p2_of_2_q;

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2(ADD,643)@5 + 1
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_cin <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_c;
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q) & oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_cin(0);
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_a) + UNSIGNED(oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_q <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_o(35 downto 1);

    -- redist36_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q_1(DELAY,787)
    redist36_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 73, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q, xout => redist36_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q, clk => clk, aclr => areset );

    -- oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitJoin_for_q(BITJOIN,644)@6
    oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p2_of_2_q & redist36_oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q;

    -- normFracZSqrHigh_uid80_fpHypot3dTest(BITSELECT,79)@6
    normFracZSqrHigh_uid80_fpHypot3dTest_in <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(105 downto 0);
    normFracZSqrHigh_uid80_fpHypot3dTest_b <= normFracZSqrHigh_uid80_fpHypot3dTest_in(105 downto 53);

    -- normFracZSqrLow_uid81_fpHypot3dTest(BITSELECT,80)@6
    normFracZSqrLow_uid81_fpHypot3dTest_in <= oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(104 downto 0);
    normFracZSqrLow_uid81_fpHypot3dTest_b <= normFracZSqrLow_uid81_fpHypot3dTest_in(104 downto 52);

    -- normBitZSqr_uid64_fpHypot3dTest(BITSELECT,63)@6
    normBitZSqr_uid64_fpHypot3dTest_in <= STD_LOGIC_VECTOR(oFracZSqr_uid60_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(105 downto 0));
    normBitZSqr_uid64_fpHypot3dTest_b <= STD_LOGIC_VECTOR(normBitZSqr_uid64_fpHypot3dTest_in(105 downto 105));

    -- ofracS_uid82_fpHypot3dTest(MUX,81)@6 + 1
    ofracS_uid82_fpHypot3dTest_s <= normBitZSqr_uid64_fpHypot3dTest_b;
    ofracS_uid82_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ofracS_uid82_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (ofracS_uid82_fpHypot3dTest_s) IS
                WHEN "0" => ofracS_uid82_fpHypot3dTest_q <= normFracZSqrLow_uid81_fpHypot3dTest_b;
                WHEN "1" => ofracS_uid82_fpHypot3dTest_q <= normFracZSqrHigh_uid80_fpHypot3dTest_b;
                WHEN OTHERS => ofracS_uid82_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist97_ofracS_uid82_fpHypot3dTest_q_3(DELAY,848)
    redist97_ofracS_uid82_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => ofracS_uid82_fpHypot3dTest_q, xout => redist97_ofracS_uid82_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- expY_uid7_fpHypot3dTest_merged_bit_select(BITSELECT,729)@0
    expY_uid7_fpHypot3dTest_merged_bit_select_b <= STD_LOGIC_VECTOR(b(62 downto 52));
    expY_uid7_fpHypot3dTest_merged_bit_select_c <= STD_LOGIC_VECTOR(b(51 downto 0));

    -- oFracY_uid56_fpHypot3dTest(BITJOIN,55)@0
    oFracY_uid56_fpHypot3dTest_q <= VCC_q & expY_uid7_fpHypot3dTest_merged_bit_select_c;

    -- oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select(BITSELECT,733)@0
    oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_b <= oFracY_uid56_fpHypot3dTest_q(52 downto 27);
    oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_c <= oFracY_uid56_fpHypot3dTest_q(26 downto 0);

    -- oFracYSqr_uid59_fpHypot3dTest_im6_cma(CHAINMULTADD,719)@0 + 2
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_reset <= areset;
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena0 <= '1';
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena1 <= oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena0;
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_p(0) <= oFracYSqr_uid59_fpHypot3dTest_im6_cma_a0(0) * oFracYSqr_uid59_fpHypot3dTest_im6_cma_c0(0);
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_u(0) <= RESIZE(oFracYSqr_uid59_fpHypot3dTest_im6_cma_p(0),53);
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_w(0) <= oFracYSqr_uid59_fpHypot3dTest_im6_cma_u(0);
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_x(0) <= oFracYSqr_uid59_fpHypot3dTest_im6_cma_w(0);
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_y(0) <= oFracYSqr_uid59_fpHypot3dTest_im6_cma_x(0);
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im6_cma_a0 <= (others => (others => '0'));
            oFracYSqr_uid59_fpHypot3dTest_im6_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena0 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im6_cma_a0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracYSqr_uid59_fpHypot3dTest_im6_cma_c0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im6_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im6_cma_ena1 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im6_cma_s(0) <= oFracYSqr_uid59_fpHypot3dTest_im6_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im6_cma_s(0)(52 downto 0)), xout => oFracYSqr_uid59_fpHypot3dTest_im6_cma_qq, clk => clk, aclr => areset );
    oFracYSqr_uid59_fpHypot3dTest_im6_cma_q <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im6_cma_qq(52 downto 0));

    -- redist26_oFracYSqr_uid59_fpHypot3dTest_im6_cma_q_2(DELAY,777)
    redist26_oFracYSqr_uid59_fpHypot3dTest_im6_cma_q_2 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_im6_cma_q, xout => redist26_oFracYSqr_uid59_fpHypot3dTest_im6_cma_q_2_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_align_15(BITSHIFT,488)@4
    oFracYSqr_uid59_fpHypot3dTest_align_15_qint <= redist26_oFracYSqr_uid59_fpHypot3dTest_im6_cma_q_2_q & "000000000000000000000000000";
    oFracYSqr_uid59_fpHypot3dTest_align_15_q <= oFracYSqr_uid59_fpHypot3dTest_align_15_qint(79 downto 0);

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,742)@4
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_align_15_q(72 downto 0));
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_align_15_q(79 downto 73));

    -- oFracYSqr_uid59_fpHypot3dTest_im3_cma(CHAINMULTADD,718)@0 + 2
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_reset <= areset;
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena0 <= '1';
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena1 <= oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena0;
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_p(0) <= oFracYSqr_uid59_fpHypot3dTest_im3_cma_a0(0) * oFracYSqr_uid59_fpHypot3dTest_im3_cma_c0(0);
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_u(0) <= RESIZE(oFracYSqr_uid59_fpHypot3dTest_im3_cma_p(0),53);
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_w(0) <= oFracYSqr_uid59_fpHypot3dTest_im3_cma_u(0);
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_x(0) <= oFracYSqr_uid59_fpHypot3dTest_im3_cma_w(0);
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_y(0) <= oFracYSqr_uid59_fpHypot3dTest_im3_cma_x(0);
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im3_cma_a0 <= (others => (others => '0'));
            oFracYSqr_uid59_fpHypot3dTest_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena0 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im3_cma_a0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracYSqr_uid59_fpHypot3dTest_im3_cma_c0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im3_cma_ena1 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im3_cma_s(0) <= oFracYSqr_uid59_fpHypot3dTest_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im3_cma_s(0)(52 downto 0)), xout => oFracYSqr_uid59_fpHypot3dTest_im3_cma_qq, clk => clk, aclr => areset );
    oFracYSqr_uid59_fpHypot3dTest_im3_cma_q <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im3_cma_qq(52 downto 0));

    -- redist27_oFracYSqr_uid59_fpHypot3dTest_im3_cma_q_1(DELAY,778)
    redist27_oFracYSqr_uid59_fpHypot3dTest_im3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_im3_cma_q, xout => redist27_oFracYSqr_uid59_fpHypot3dTest_im3_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_align_13(BITSHIFT,486)@3
    oFracYSqr_uid59_fpHypot3dTest_align_13_qint <= redist27_oFracYSqr_uid59_fpHypot3dTest_im3_cma_q_1_q & "000000000000000000000000000";
    oFracYSqr_uid59_fpHypot3dTest_align_13_q <= oFracYSqr_uid59_fpHypot3dTest_align_13_qint(79 downto 0);

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,741)@3
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_align_13_q(72 downto 0));
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_align_13_q(79 downto 73));

    -- oFracYSqr_uid59_fpHypot3dTest_im0_cma(CHAINMULTADD,717)@0 + 2
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_reset <= areset;
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena0 <= '1';
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena1 <= oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena0;
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_p(0) <= oFracYSqr_uid59_fpHypot3dTest_im0_cma_a0(0) * oFracYSqr_uid59_fpHypot3dTest_im0_cma_c0(0);
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_u(0) <= RESIZE(oFracYSqr_uid59_fpHypot3dTest_im0_cma_p(0),52);
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_w(0) <= oFracYSqr_uid59_fpHypot3dTest_im0_cma_u(0);
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_x(0) <= oFracYSqr_uid59_fpHypot3dTest_im0_cma_w(0);
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_y(0) <= oFracYSqr_uid59_fpHypot3dTest_im0_cma_x(0);
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im0_cma_a0 <= (others => (others => '0'));
            oFracYSqr_uid59_fpHypot3dTest_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena0 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im0_cma_a0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_b),26);
                oFracYSqr_uid59_fpHypot3dTest_im0_cma_c0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im0_cma_ena1 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im0_cma_s(0) <= oFracYSqr_uid59_fpHypot3dTest_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 52, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im0_cma_s(0)(51 downto 0)), xout => oFracYSqr_uid59_fpHypot3dTest_im0_cma_qq, clk => clk, aclr => areset );
    oFracYSqr_uid59_fpHypot3dTest_im0_cma_q <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im0_cma_qq(51 downto 0));

    -- redist28_oFracYSqr_uid59_fpHypot3dTest_im0_cma_q_1(DELAY,779)
    redist28_oFracYSqr_uid59_fpHypot3dTest_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_im0_cma_q, xout => redist28_oFracYSqr_uid59_fpHypot3dTest_im0_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,746)@3
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist28_oFracYSqr_uid59_fpHypot3dTest_im0_cma_q_1_q(18 downto 0));
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist28_oFracYSqr_uid59_fpHypot3dTest_im0_cma_q_1_q(51 downto 19));

    -- oFracYSqr_uid59_fpHypot3dTest_im9_cma(CHAINMULTADD,720)@0 + 2
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_reset <= areset;
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena0 <= '1';
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena1 <= oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena0;
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_p(0) <= oFracYSqr_uid59_fpHypot3dTest_im9_cma_a0(0) * oFracYSqr_uid59_fpHypot3dTest_im9_cma_c0(0);
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_u(0) <= RESIZE(oFracYSqr_uid59_fpHypot3dTest_im9_cma_p(0),54);
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_w(0) <= oFracYSqr_uid59_fpHypot3dTest_im9_cma_u(0);
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_x(0) <= oFracYSqr_uid59_fpHypot3dTest_im9_cma_w(0);
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_y(0) <= oFracYSqr_uid59_fpHypot3dTest_im9_cma_x(0);
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im9_cma_a0 <= (others => (others => '0'));
            oFracYSqr_uid59_fpHypot3dTest_im9_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena0 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im9_cma_a0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracYSqr_uid59_fpHypot3dTest_im9_cma_c0(0) <= RESIZE(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_bs1_merged_bit_select_c),27);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_im9_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracYSqr_uid59_fpHypot3dTest_im9_cma_ena1 = '1') THEN
                oFracYSqr_uid59_fpHypot3dTest_im9_cma_s(0) <= oFracYSqr_uid59_fpHypot3dTest_im9_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im9_cma_s(0)(53 downto 0)), xout => oFracYSqr_uid59_fpHypot3dTest_im9_cma_qq, clk => clk, aclr => areset );
    oFracYSqr_uid59_fpHypot3dTest_im9_cma_q <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_im9_cma_qq(53 downto 0));

    -- redist25_oFracYSqr_uid59_fpHypot3dTest_im9_cma_q_1(DELAY,776)
    redist25_oFracYSqr_uid59_fpHypot3dTest_im9_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_im9_cma_q, xout => redist25_oFracYSqr_uid59_fpHypot3dTest_im9_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,668)@3
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q <= oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist25_oFracYSqr_uid59_fpHypot3dTest_im9_cma_q_1_q;

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2(ADD,615)@3 + 1
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q);
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_a) + UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_c(0) <= oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_o(73);
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_q <= oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_o(72 downto 0);

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2(ADD,624)@4 + 1
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_q);
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_a) + UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_c(0) <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_o(73);
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_o(72 downto 0);

    -- redist5_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,756)
    redist5_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist5_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,686)@5
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_UpperBits_for_b_q & redist5_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist6_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,757)
    redist6_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist6_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,676)@4
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_UpperBits_for_b_q & redist6_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist1_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,752)
    redist1_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist1_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,671)@4
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist1_oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2(ADD,616)@4 + 1
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_cin <= oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p1_of_2_c;
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q) & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_cin(0);
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_a) + UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_q <= oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_o(34 downto 1);

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,681)@5
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & oFracYSqr_uid59_fpHypot3dTest_result_add_0_0_p2_of_2_q;

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2(ADD,625)@5 + 1
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_cin <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_c;
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q) & oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_cin(0);
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_a) + UNSIGNED(oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_q <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_o(35 downto 1);

    -- redist37_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q_1(DELAY,788)
    redist37_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 73, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q, xout => redist37_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q, clk => clk, aclr => areset );

    -- oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitJoin_for_q(BITJOIN,626)@6
    oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p2_of_2_q & redist37_oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q;

    -- normFracYSqrHigh_uid77_fpHypot3dTest(BITSELECT,76)@6
    normFracYSqrHigh_uid77_fpHypot3dTest_in <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(105 downto 0);
    normFracYSqrHigh_uid77_fpHypot3dTest_b <= normFracYSqrHigh_uid77_fpHypot3dTest_in(105 downto 53);

    -- normFracYSqrLow_uid78_fpHypot3dTest(BITSELECT,77)@6
    normFracYSqrLow_uid78_fpHypot3dTest_in <= oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(104 downto 0);
    normFracYSqrLow_uid78_fpHypot3dTest_b <= normFracYSqrLow_uid78_fpHypot3dTest_in(104 downto 52);

    -- normBitYSqr_uid63_fpHypot3dTest(BITSELECT,62)@6
    normBitYSqr_uid63_fpHypot3dTest_in <= STD_LOGIC_VECTOR(oFracYSqr_uid59_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(105 downto 0));
    normBitYSqr_uid63_fpHypot3dTest_b <= STD_LOGIC_VECTOR(normBitYSqr_uid63_fpHypot3dTest_in(105 downto 105));

    -- ofracQ_uid79_fpHypot3dTest(MUX,78)@6 + 1
    ofracQ_uid79_fpHypot3dTest_s <= normBitYSqr_uid63_fpHypot3dTest_b;
    ofracQ_uid79_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ofracQ_uid79_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (ofracQ_uid79_fpHypot3dTest_s) IS
                WHEN "0" => ofracQ_uid79_fpHypot3dTest_q <= normFracYSqrLow_uid78_fpHypot3dTest_b;
                WHEN "1" => ofracQ_uid79_fpHypot3dTest_q <= normFracYSqrHigh_uid77_fpHypot3dTest_b;
                WHEN OTHERS => ofracQ_uid79_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist98_ofracQ_uid79_fpHypot3dTest_q_3(DELAY,849)
    redist98_ofracQ_uid79_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => ofracQ_uid79_fpHypot3dTest_q, xout => redist98_ofracQ_uid79_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- expX_uid6_fpHypot3dTest_merged_bit_select(BITSELECT,728)@0
    expX_uid6_fpHypot3dTest_merged_bit_select_b <= STD_LOGIC_VECTOR(a(62 downto 52));
    expX_uid6_fpHypot3dTest_merged_bit_select_c <= STD_LOGIC_VECTOR(a(51 downto 0));

    -- oFracX_uid55_fpHypot3dTest(BITJOIN,54)@0
    oFracX_uid55_fpHypot3dTest_q <= VCC_q & expX_uid6_fpHypot3dTest_merged_bit_select_c;

    -- oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select(BITSELECT,732)@0
    oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b <= oFracX_uid55_fpHypot3dTest_q(52 downto 27);
    oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c <= oFracX_uid55_fpHypot3dTest_q(26 downto 0);

    -- redist13_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b_1(DELAY,764)
    redist13_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b, xout => redist13_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- redist14_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c_1(DELAY,765)
    redist14_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c, xout => redist14_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_im6_cma(CHAINMULTADD,715)@1 + 2
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_reset <= areset;
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena0 <= '1';
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena1 <= oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena0;
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_p(0) <= oFracXSqr_uid58_fpHypot3dTest_im6_cma_a0(0) * oFracXSqr_uid58_fpHypot3dTest_im6_cma_c0(0);
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_u(0) <= RESIZE(oFracXSqr_uid58_fpHypot3dTest_im6_cma_p(0),53);
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_w(0) <= oFracXSqr_uid58_fpHypot3dTest_im6_cma_u(0);
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_x(0) <= oFracXSqr_uid58_fpHypot3dTest_im6_cma_w(0);
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_y(0) <= oFracXSqr_uid58_fpHypot3dTest_im6_cma_x(0);
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im6_cma_a0 <= (others => (others => '0'));
            oFracXSqr_uid58_fpHypot3dTest_im6_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena0 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im6_cma_a0(0) <= RESIZE(UNSIGNED(redist14_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c_1_q),27);
                oFracXSqr_uid58_fpHypot3dTest_im6_cma_c0(0) <= RESIZE(UNSIGNED(redist13_oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b_1_q),26);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im6_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im6_cma_ena1 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im6_cma_s(0) <= oFracXSqr_uid58_fpHypot3dTest_im6_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im6_cma_s(0)(52 downto 0)), xout => oFracXSqr_uid58_fpHypot3dTest_im6_cma_qq, clk => clk, aclr => areset );
    oFracXSqr_uid58_fpHypot3dTest_im6_cma_q <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im6_cma_qq(52 downto 0));

    -- redist30_oFracXSqr_uid58_fpHypot3dTest_im6_cma_q_1(DELAY,781)
    redist30_oFracXSqr_uid58_fpHypot3dTest_im6_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_im6_cma_q, xout => redist30_oFracXSqr_uid58_fpHypot3dTest_im6_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_align_15(BITSHIFT,469)@4
    oFracXSqr_uid58_fpHypot3dTest_align_15_qint <= redist30_oFracXSqr_uid58_fpHypot3dTest_im6_cma_q_1_q & "000000000000000000000000000";
    oFracXSqr_uid58_fpHypot3dTest_align_15_q <= oFracXSqr_uid58_fpHypot3dTest_align_15_qint(79 downto 0);

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,740)@4
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_align_15_q(72 downto 0));
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_align_15_q(79 downto 73));

    -- oFracXSqr_uid58_fpHypot3dTest_im3_cma(CHAINMULTADD,714)@0 + 2
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_reset <= areset;
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena0 <= '1';
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena1 <= oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena0;
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_p(0) <= oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0(0) * oFracXSqr_uid58_fpHypot3dTest_im3_cma_c0(0);
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_u(0) <= RESIZE(oFracXSqr_uid58_fpHypot3dTest_im3_cma_p(0),53);
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_w(0) <= oFracXSqr_uid58_fpHypot3dTest_im3_cma_u(0);
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_x(0) <= oFracXSqr_uid58_fpHypot3dTest_im3_cma_w(0);
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_y(0) <= oFracXSqr_uid58_fpHypot3dTest_im3_cma_x(0);
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0 <= (others => (others => '0'));
            oFracXSqr_uid58_fpHypot3dTest_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena0 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im3_cma_a0(0) <= RESIZE(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracXSqr_uid58_fpHypot3dTest_im3_cma_c0(0) <= RESIZE(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im3_cma_ena1 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im3_cma_s(0) <= oFracXSqr_uid58_fpHypot3dTest_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im3_cma_s(0)(52 downto 0)), xout => oFracXSqr_uid58_fpHypot3dTest_im3_cma_qq, clk => clk, aclr => areset );
    oFracXSqr_uid58_fpHypot3dTest_im3_cma_q <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im3_cma_qq(52 downto 0));

    -- redist31_oFracXSqr_uid58_fpHypot3dTest_im3_cma_q_1(DELAY,782)
    redist31_oFracXSqr_uid58_fpHypot3dTest_im3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_im3_cma_q, xout => redist31_oFracXSqr_uid58_fpHypot3dTest_im3_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_align_13(BITSHIFT,467)@3
    oFracXSqr_uid58_fpHypot3dTest_align_13_qint <= redist31_oFracXSqr_uid58_fpHypot3dTest_im3_cma_q_1_q & "000000000000000000000000000";
    oFracXSqr_uid58_fpHypot3dTest_align_13_q <= oFracXSqr_uid58_fpHypot3dTest_align_13_qint(79 downto 0);

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select(BITSELECT,739)@3
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_align_13_q(72 downto 0));
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_align_13_q(79 downto 73));

    -- oFracXSqr_uid58_fpHypot3dTest_im0_cma(CHAINMULTADD,713)@0 + 2
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_reset <= areset;
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena0 <= '1';
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena1 <= oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena0;
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_p(0) <= oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0(0) * oFracXSqr_uid58_fpHypot3dTest_im0_cma_c0(0);
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_u(0) <= RESIZE(oFracXSqr_uid58_fpHypot3dTest_im0_cma_p(0),52);
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_w(0) <= oFracXSqr_uid58_fpHypot3dTest_im0_cma_u(0);
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_x(0) <= oFracXSqr_uid58_fpHypot3dTest_im0_cma_w(0);
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_y(0) <= oFracXSqr_uid58_fpHypot3dTest_im0_cma_x(0);
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0 <= (others => (others => '0'));
            oFracXSqr_uid58_fpHypot3dTest_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena0 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im0_cma_a0(0) <= RESIZE(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b),26);
                oFracXSqr_uid58_fpHypot3dTest_im0_cma_c0(0) <= RESIZE(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_b),26);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im0_cma_ena1 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im0_cma_s(0) <= oFracXSqr_uid58_fpHypot3dTest_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 52, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im0_cma_s(0)(51 downto 0)), xout => oFracXSqr_uid58_fpHypot3dTest_im0_cma_qq, clk => clk, aclr => areset );
    oFracXSqr_uid58_fpHypot3dTest_im0_cma_q <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im0_cma_qq(51 downto 0));

    -- redist32_oFracXSqr_uid58_fpHypot3dTest_im0_cma_q_1(DELAY,783)
    redist32_oFracXSqr_uid58_fpHypot3dTest_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_im0_cma_q, xout => redist32_oFracXSqr_uid58_fpHypot3dTest_im0_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,745)@3
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(redist32_oFracXSqr_uid58_fpHypot3dTest_im0_cma_q_1_q(18 downto 0));
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(redist32_oFracXSqr_uid58_fpHypot3dTest_im0_cma_q_1_q(51 downto 19));

    -- oFracXSqr_uid58_fpHypot3dTest_im9_cma(CHAINMULTADD,716)@0 + 2
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_reset <= areset;
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena0 <= '1';
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena1 <= oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena0;
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_p(0) <= oFracXSqr_uid58_fpHypot3dTest_im9_cma_a0(0) * oFracXSqr_uid58_fpHypot3dTest_im9_cma_c0(0);
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_u(0) <= RESIZE(oFracXSqr_uid58_fpHypot3dTest_im9_cma_p(0),54);
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_w(0) <= oFracXSqr_uid58_fpHypot3dTest_im9_cma_u(0);
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_x(0) <= oFracXSqr_uid58_fpHypot3dTest_im9_cma_w(0);
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_y(0) <= oFracXSqr_uid58_fpHypot3dTest_im9_cma_x(0);
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im9_cma_a0 <= (others => (others => '0'));
            oFracXSqr_uid58_fpHypot3dTest_im9_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena0 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im9_cma_a0(0) <= RESIZE(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c),27);
                oFracXSqr_uid58_fpHypot3dTest_im9_cma_c0(0) <= RESIZE(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_bs1_merged_bit_select_c),27);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_im9_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (oFracXSqr_uid58_fpHypot3dTest_im9_cma_ena1 = '1') THEN
                oFracXSqr_uid58_fpHypot3dTest_im9_cma_s(0) <= oFracXSqr_uid58_fpHypot3dTest_im9_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im9_cma_s(0)(53 downto 0)), xout => oFracXSqr_uid58_fpHypot3dTest_im9_cma_qq, clk => clk, aclr => areset );
    oFracXSqr_uid58_fpHypot3dTest_im9_cma_q <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_im9_cma_qq(53 downto 0));

    -- redist29_oFracXSqr_uid58_fpHypot3dTest_im9_cma_q_1(DELAY,780)
    redist29_oFracXSqr_uid58_fpHypot3dTest_im9_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_im9_cma_q, xout => redist29_oFracXSqr_uid58_fpHypot3dTest_im9_cma_q_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,647)@3
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b & redist29_oFracXSqr_uid58_fpHypot3dTest_im9_cma_q_1_q;

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2(ADD,597)@3 + 1
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q);
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_a) + UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_c(0) <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_o(73);
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_o(72 downto 0);

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2(ADD,606)@4 + 1
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_q);
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_b);
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_a) + UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_c(0) <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_o(73);
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_o(72 downto 0);

    -- redist7_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,758)
    redist7_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist7_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,665)@5
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_UpperBits_for_b_q & redist7_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist8_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1(DELAY,759)
    redist8_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c, xout => redist8_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,655)@4
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_UpperBits_for_b_q & redist8_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_tessel0_0_merged_bit_select_c_1_q;

    -- redist2_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,753)
    redist2_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist2_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,650)@4
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & redist2_oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2(ADD,598)@4 + 1
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_cin <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p1_of_2_c;
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_BitSelect_for_b_BitJoin_for_c_q) & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_cin(0);
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_a) + UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_o(34 downto 1);

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,660)@5
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= GND_q & oFracXSqr_uid58_fpHypot3dTest_result_add_0_0_p2_of_2_q;

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2(ADD,607)@5 + 1
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_cin <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_c;
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1';
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR("0" & oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitSelect_for_b_BitJoin_for_c_q) & oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_cin(0);
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_a) + UNSIGNED(oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_o(35 downto 1);

    -- redist38_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q_1(DELAY,789)
    redist38_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 73, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q, xout => redist38_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q, clk => clk, aclr => areset );

    -- oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitJoin_for_q(BITJOIN,608)@6
    oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p2_of_2_q & redist38_oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_p1_of_2_q_1_q;

    -- normFracXSqrHigh_uid74_fpHypot3dTest(BITSELECT,73)@6
    normFracXSqrHigh_uid74_fpHypot3dTest_in <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(105 downto 0);
    normFracXSqrHigh_uid74_fpHypot3dTest_b <= normFracXSqrHigh_uid74_fpHypot3dTest_in(105 downto 53);

    -- normFracXSqrLow_uid75_fpHypot3dTest(BITSELECT,74)@6
    normFracXSqrLow_uid75_fpHypot3dTest_in <= oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(104 downto 0);
    normFracXSqrLow_uid75_fpHypot3dTest_b <= normFracXSqrLow_uid75_fpHypot3dTest_in(104 downto 52);

    -- normBitXSqr_uid62_fpHypot3dTest(BITSELECT,61)@6
    normBitXSqr_uid62_fpHypot3dTest_in <= STD_LOGIC_VECTOR(oFracXSqr_uid58_fpHypot3dTest_result_add_1_0_BitJoin_for_q_q(105 downto 0));
    normBitXSqr_uid62_fpHypot3dTest_b <= STD_LOGIC_VECTOR(normBitXSqr_uid62_fpHypot3dTest_in(105 downto 105));

    -- ofracP_uid76_fpHypot3dTest(MUX,75)@6 + 1
    ofracP_uid76_fpHypot3dTest_s <= normBitXSqr_uid62_fpHypot3dTest_b;
    ofracP_uid76_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ofracP_uid76_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (ofracP_uid76_fpHypot3dTest_s) IS
                WHEN "0" => ofracP_uid76_fpHypot3dTest_q <= normFracXSqrLow_uid75_fpHypot3dTest_b;
                WHEN "1" => ofracP_uid76_fpHypot3dTest_q <= normFracXSqrHigh_uid74_fpHypot3dTest_b;
                WHEN OTHERS => ofracP_uid76_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist99_ofracP_uid76_fpHypot3dTest_q_3(DELAY,850)
    redist99_ofracP_uid76_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => ofracP_uid76_fpHypot3dTest_q, xout => redist99_ofracP_uid76_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_notEnable(LOGICAL,882)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_nor(LOGICAL,883)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_nor_q <= not (redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_notEnable_q or redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q);

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_last(CONSTANT,879)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_last_q <= "01";

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmp(LOGICAL,880)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmp_q <= "1" WHEN redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_last_q = redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q ELSE "0";

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmpReg(REG,881)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q <= STD_LOGIC_VECTOR(redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena(REG,884)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_nor_q = "1") THEN
                redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_enaAnd(LOGICAL,885)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q and VCC_q;

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt(COUNTER,877)
    -- low=0, high=2, step=1, init=0
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '1';
            ELSE
                redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '0';
            END IF;
            IF (redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq = '1') THEN
                redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i + 2;
            ELSE
                redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i, 2)));

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_inputreg(DELAY,874)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expY_uid7_fpHypot3dTest_merged_bit_select_b, xout => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_inputreg_q, clk => clk, aclr => areset );

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_wraddr(REG,878)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_wraddr_q <= STD_LOGIC_VECTOR(redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem(DUALMEM,876)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_ia <= STD_LOGIC_VECTOR(redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_inputreg_q);
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_aa <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_wraddr_q;
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_ab <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q;
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_reset0 <= areset;
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_dmem : altera_syncram
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
        clocken1 => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_reset0,
        clock1 => clk,
        address_a => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_aa,
        data_a => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_ab,
        q_b => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_iq
    );
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_q <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_iq(10 downto 0);

    -- redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg(DELAY,875)
    redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_mem_q, xout => redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg_q, clk => clk, aclr => areset );

    -- excZ_y_uid31_fpHypot3dTest(LOGICAL,30)@6 + 1
    excZ_y_uid31_fpHypot3dTest_qi <= "1" WHEN redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg_q = cstAllZWE_uid14_fpHypot3dTest_q ELSE "0";
    excZ_y_uid31_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid31_fpHypot3dTest_qi, xout => excZ_y_uid31_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist107_excZ_y_uid31_fpHypot3dTest_q_2(DELAY,858)
    redist107_excZ_y_uid31_fpHypot3dTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid31_fpHypot3dTest_q, xout => redist107_excZ_y_uid31_fpHypot3dTest_q_2_q, clk => clk, aclr => areset );

    -- bias_uid61_fpHypot3dTest(CONSTANT,60)
    bias_uid61_fpHypot3dTest_q <= "1111111111";

    -- expYTimes2_uid67_fpHypot3dTest(BITJOIN,66)@6
    expYTimes2_uid67_fpHypot3dTest_q <= redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg_q & normBitYSqr_uid63_fpHypot3dTest_b;

    -- expQ_uid72_fpHypot3dTest(SUB,71)@6 + 1
    expQ_uid72_fpHypot3dTest_a <= STD_LOGIC_VECTOR("0" & expYTimes2_uid67_fpHypot3dTest_q);
    expQ_uid72_fpHypot3dTest_b <= STD_LOGIC_VECTOR("000" & bias_uid61_fpHypot3dTest_q);
    expQ_uid72_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expQ_uid72_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expQ_uid72_fpHypot3dTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expQ_uid72_fpHypot3dTest_a) - UNSIGNED(expQ_uid72_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    expQ_uid72_fpHypot3dTest_q <= expQ_uid72_fpHypot3dTest_o(12 downto 0);

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_notEnable(LOGICAL,894)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_nor(LOGICAL,895)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_nor_q <= not (redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_notEnable_q or redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q);

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_last(CONSTANT,891)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_last_q <= "01";

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmp(LOGICAL,892)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmp_q <= "1" WHEN redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_last_q = redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q ELSE "0";

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmpReg(REG,893)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q <= STD_LOGIC_VECTOR(redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena(REG,896)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_nor_q = "1") THEN
                redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_enaAnd(LOGICAL,897)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q and VCC_q;

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt(COUNTER,889)
    -- low=0, high=2, step=1, init=0
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '1';
            ELSE
                redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '0';
            END IF;
            IF (redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq = '1') THEN
                redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i + 2;
            ELSE
                redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i, 2)));

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_inputreg(DELAY,886)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid6_fpHypot3dTest_merged_bit_select_b, xout => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_inputreg_q, clk => clk, aclr => areset );

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_wraddr(REG,890)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_wraddr_q <= STD_LOGIC_VECTOR(redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem(DUALMEM,888)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_ia <= STD_LOGIC_VECTOR(redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_inputreg_q);
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_aa <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_wraddr_q;
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_ab <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q;
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_reset0 <= areset;
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_dmem : altera_syncram
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
        clocken1 => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_reset0,
        clock1 => clk,
        address_a => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_aa,
        data_a => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_ab,
        q_b => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_iq
    );
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_q <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_iq(10 downto 0);

    -- redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg(DELAY,887)
    redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_mem_q, xout => redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg_q, clk => clk, aclr => areset );

    -- expXTimes2_uid65_fpHypot3dTest(BITJOIN,64)@6
    expXTimes2_uid65_fpHypot3dTest_q <= redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg_q & normBitXSqr_uid62_fpHypot3dTest_b;

    -- expP_uid71_fpHypot3dTest(SUB,70)@6 + 1
    expP_uid71_fpHypot3dTest_a <= STD_LOGIC_VECTOR("0" & expXTimes2_uid65_fpHypot3dTest_q);
    expP_uid71_fpHypot3dTest_b <= STD_LOGIC_VECTOR("000" & bias_uid61_fpHypot3dTest_q);
    expP_uid71_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expP_uid71_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expP_uid71_fpHypot3dTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expP_uid71_fpHypot3dTest_a) - UNSIGNED(expP_uid71_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    expP_uid71_fpHypot3dTest_q <= expP_uid71_fpHypot3dTest_o(12 downto 0);

    -- pGTEq_uid83_fpHypot3dTest(COMPARE,82)@7 + 1
    pGTEq_uid83_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expP_uid71_fpHypot3dTest_q(12)) & expP_uid71_fpHypot3dTest_q));
    pGTEq_uid83_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expQ_uid72_fpHypot3dTest_q(12)) & expQ_uid72_fpHypot3dTest_q));
    pGTEq_uid83_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            pGTEq_uid83_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            pGTEq_uid83_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(pGTEq_uid83_fpHypot3dTest_a) - SIGNED(pGTEq_uid83_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    pGTEq_uid83_fpHypot3dTest_n(0) <= not (pGTEq_uid83_fpHypot3dTest_o(14));

    -- expCmpGtePQ_uid84_fpHypot3dTest(LOGICAL,83)@8 + 1
    expCmpGtePQ_uid84_fpHypot3dTest_qi <= pGTEq_uid83_fpHypot3dTest_n or redist107_excZ_y_uid31_fpHypot3dTest_q_2_q;
    expCmpGtePQ_uid84_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expCmpGtePQ_uid84_fpHypot3dTest_qi, xout => expCmpGtePQ_uid84_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_notEnable(LOGICAL,870)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_nor(LOGICAL,871)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_nor_q <= not (redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_notEnable_q or redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q);

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_last(CONSTANT,867)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_last_q <= "01";

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmp(LOGICAL,868)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmp_q <= "1" WHEN redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_last_q = redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q ELSE "0";

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmpReg(REG,869)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q <= STD_LOGIC_VECTOR(redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena(REG,872)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_nor_q = "1") THEN
                redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_enaAnd(LOGICAL,873)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_sticky_ena_q and VCC_q;

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt(COUNTER,865)
    -- low=0, high=2, step=1, init=0
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '1';
            ELSE
                redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq <= '0';
            END IF;
            IF (redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_eq = '1') THEN
                redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i + 2;
            ELSE
                redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_i, 2)));

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_inputreg(DELAY,862)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expZ_uid8_fpHypot3dTest_merged_bit_select_b, xout => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_inputreg_q, clk => clk, aclr => areset );

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_wraddr(REG,866)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_wraddr_q <= STD_LOGIC_VECTOR(redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem(DUALMEM,864)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_ia <= STD_LOGIC_VECTOR(redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_inputreg_q);
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_aa <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_wraddr_q;
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_ab <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_rdcnt_q;
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_reset0 <= areset;
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_dmem : altera_syncram
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
        clocken1 => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_reset0,
        clock1 => clk,
        address_a => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_aa,
        data_a => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_ab,
        q_b => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_iq
    );
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_q <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_iq(10 downto 0);

    -- redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg(DELAY,863)
    redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_mem_q, xout => redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg_q, clk => clk, aclr => areset );

    -- excZ_z_uid45_fpHypot3dTest(LOGICAL,44)@6 + 1
    excZ_z_uid45_fpHypot3dTest_qi <= "1" WHEN redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg_q = cstAllZWE_uid14_fpHypot3dTest_q ELSE "0";
    excZ_z_uid45_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_z_uid45_fpHypot3dTest_qi, xout => excZ_z_uid45_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist104_excZ_z_uid45_fpHypot3dTest_q_2(DELAY,855)
    redist104_excZ_z_uid45_fpHypot3dTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_z_uid45_fpHypot3dTest_q, xout => redist104_excZ_z_uid45_fpHypot3dTest_q_2_q, clk => clk, aclr => areset );

    -- expZTimes2_uid69_fpHypot3dTest(BITJOIN,68)@6
    expZTimes2_uid69_fpHypot3dTest_q <= redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg_q & normBitZSqr_uid64_fpHypot3dTest_b;

    -- expS_uid73_fpHypot3dTest(SUB,72)@6 + 1
    expS_uid73_fpHypot3dTest_a <= STD_LOGIC_VECTOR("0" & expZTimes2_uid69_fpHypot3dTest_q);
    expS_uid73_fpHypot3dTest_b <= STD_LOGIC_VECTOR("000" & bias_uid61_fpHypot3dTest_q);
    expS_uid73_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expS_uid73_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expS_uid73_fpHypot3dTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expS_uid73_fpHypot3dTest_a) - UNSIGNED(expS_uid73_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    expS_uid73_fpHypot3dTest_q <= expS_uid73_fpHypot3dTest_o(12 downto 0);

    -- qGTEs_uid87_fpHypot3dTest(COMPARE,86)@7 + 1
    qGTEs_uid87_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expQ_uid72_fpHypot3dTest_q(12)) & expQ_uid72_fpHypot3dTest_q));
    qGTEs_uid87_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expS_uid73_fpHypot3dTest_q(12)) & expS_uid73_fpHypot3dTest_q));
    qGTEs_uid87_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qGTEs_uid87_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            qGTEs_uid87_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(qGTEs_uid87_fpHypot3dTest_a) - SIGNED(qGTEs_uid87_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    qGTEs_uid87_fpHypot3dTest_n(0) <= not (qGTEs_uid87_fpHypot3dTest_o(14));

    -- expCmpGteQS_uid88_fpHypot3dTest(LOGICAL,87)@8 + 1
    expCmpGteQS_uid88_fpHypot3dTest_qi <= qGTEs_uid87_fpHypot3dTest_n or redist104_excZ_z_uid45_fpHypot3dTest_q_2_q;
    expCmpGteQS_uid88_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expCmpGteQS_uid88_fpHypot3dTest_qi, xout => expCmpGteQS_uid88_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- pGTEs_uid85_fpHypot3dTest(COMPARE,84)@7 + 1
    pGTEs_uid85_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expP_uid71_fpHypot3dTest_q(12)) & expP_uid71_fpHypot3dTest_q));
    pGTEs_uid85_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expS_uid73_fpHypot3dTest_q(12)) & expS_uid73_fpHypot3dTest_q));
    pGTEs_uid85_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            pGTEs_uid85_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            pGTEs_uid85_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(pGTEs_uid85_fpHypot3dTest_a) - SIGNED(pGTEs_uid85_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    pGTEs_uid85_fpHypot3dTest_n(0) <= not (pGTEs_uid85_fpHypot3dTest_o(14));

    -- expCmpGtePS_uid86_fpHypot3dTest(LOGICAL,85)@8 + 1
    expCmpGtePS_uid86_fpHypot3dTest_qi <= pGTEs_uid85_fpHypot3dTest_n or redist104_excZ_z_uid45_fpHypot3dTest_q_2_q;
    expCmpGtePS_uid86_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expCmpGtePS_uid86_fpHypot3dTest_qi, xout => expCmpGtePS_uid86_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- concCompareExpRes_uid89_fpHypot3dTest(BITJOIN,88)@9
    concCompareExpRes_uid89_fpHypot3dTest_q <= expCmpGtePQ_uid84_fpHypot3dTest_q & expCmpGteQS_uid88_fpHypot3dTest_q & expCmpGtePS_uid86_fpHypot3dTest_q;

    -- selCTab_uid92_fpHypot3dTest(LOOKUP,91)@9
    selCTab_uid92_fpHypot3dTest_combproc: PROCESS (concCompareExpRes_uid89_fpHypot3dTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concCompareExpRes_uid89_fpHypot3dTest_q) IS
            WHEN "000" => selCTab_uid92_fpHypot3dTest_q <= "00";
            WHEN "001" => selCTab_uid92_fpHypot3dTest_q <= "00";
            WHEN "010" => selCTab_uid92_fpHypot3dTest_q <= "00";
            WHEN "011" => selCTab_uid92_fpHypot3dTest_q <= "10";
            WHEN "100" => selCTab_uid92_fpHypot3dTest_q <= "01";
            WHEN "101" => selCTab_uid92_fpHypot3dTest_q <= "01";
            WHEN "110" => selCTab_uid92_fpHypot3dTest_q <= "00";
            WHEN "111" => selCTab_uid92_fpHypot3dTest_q <= "10";
            WHEN OTHERS => -- unreachable
                           selCTab_uid92_fpHypot3dTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- oFracC_uid104_fpHypot3dTest(MUX,103)@9 + 1
    oFracC_uid104_fpHypot3dTest_s <= selCTab_uid92_fpHypot3dTest_q;
    oFracC_uid104_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracC_uid104_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (oFracC_uid104_fpHypot3dTest_s) IS
                WHEN "00" => oFracC_uid104_fpHypot3dTest_q <= redist99_ofracP_uid76_fpHypot3dTest_q_3_q;
                WHEN "01" => oFracC_uid104_fpHypot3dTest_q <= redist98_ofracQ_uid79_fpHypot3dTest_q_3_q;
                WHEN "10" => oFracC_uid104_fpHypot3dTest_q <= redist97_ofracS_uid82_fpHypot3dTest_q_3_q;
                WHEN "11" => oFracC_uid104_fpHypot3dTest_q <= redist99_ofracP_uid76_fpHypot3dTest_q_3_q;
                WHEN OTHERS => oFracC_uid104_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist94_oFracC_uid104_fpHypot3dTest_q_3(DELAY,845)
    redist94_oFracC_uid104_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracC_uid104_fpHypot3dTest_q, xout => redist94_oFracC_uid104_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- cWFP2_uid98_fpHypot3dTest(CONSTANT,97)
    cWFP2_uid98_fpHypot3dTest_q <= "0110110";

    -- redist100_expS_uid73_fpHypot3dTest_q_3(DELAY,851)
    redist100_expS_uid73_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 13, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expS_uid73_fpHypot3dTest_q, xout => redist100_expS_uid73_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- redist101_expQ_uid72_fpHypot3dTest_q_3(DELAY,852)
    redist101_expQ_uid72_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 13, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expQ_uid72_fpHypot3dTest_q, xout => redist101_expQ_uid72_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- redist102_expP_uid71_fpHypot3dTest_q_3(DELAY,853)
    redist102_expP_uid71_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 13, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expP_uid71_fpHypot3dTest_q, xout => redist102_expP_uid71_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- expC_uid95_fpHypot3dTest(MUX,94)@9 + 1
    expC_uid95_fpHypot3dTest_s <= selCTab_uid92_fpHypot3dTest_q;
    expC_uid95_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expC_uid95_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expC_uid95_fpHypot3dTest_s) IS
                WHEN "00" => expC_uid95_fpHypot3dTest_q <= redist102_expP_uid71_fpHypot3dTest_q_3_q;
                WHEN "01" => expC_uid95_fpHypot3dTest_q <= redist101_expQ_uid72_fpHypot3dTest_q_3_q;
                WHEN "10" => expC_uid95_fpHypot3dTest_q <= redist100_expS_uid73_fpHypot3dTest_q_3_q;
                WHEN "11" => expC_uid95_fpHypot3dTest_q <= redist102_expP_uid71_fpHypot3dTest_q_3_q;
                WHEN OTHERS => expC_uid95_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- selATab_uid90_fpHypot3dTest(LOOKUP,89)@9
    selATab_uid90_fpHypot3dTest_combproc: PROCESS (concCompareExpRes_uid89_fpHypot3dTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concCompareExpRes_uid89_fpHypot3dTest_q) IS
            WHEN "000" => selATab_uid90_fpHypot3dTest_q <= "10";
            WHEN "001" => selATab_uid90_fpHypot3dTest_q <= "00";
            WHEN "010" => selATab_uid90_fpHypot3dTest_q <= "01";
            WHEN "011" => selATab_uid90_fpHypot3dTest_q <= "01";
            WHEN "100" => selATab_uid90_fpHypot3dTest_q <= "10";
            WHEN "101" => selATab_uid90_fpHypot3dTest_q <= "00";
            WHEN "110" => selATab_uid90_fpHypot3dTest_q <= "00";
            WHEN "111" => selATab_uid90_fpHypot3dTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           selATab_uid90_fpHypot3dTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expA_uid93_fpHypot3dTest(MUX,92)@9 + 1
    expA_uid93_fpHypot3dTest_s <= selATab_uid90_fpHypot3dTest_q;
    expA_uid93_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expA_uid93_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expA_uid93_fpHypot3dTest_s) IS
                WHEN "00" => expA_uid93_fpHypot3dTest_q <= redist102_expP_uid71_fpHypot3dTest_q_3_q;
                WHEN "01" => expA_uid93_fpHypot3dTest_q <= redist101_expQ_uid72_fpHypot3dTest_q_3_q;
                WHEN "10" => expA_uid93_fpHypot3dTest_q <= redist100_expS_uid73_fpHypot3dTest_q_3_q;
                WHEN "11" => expA_uid93_fpHypot3dTest_q <= redist102_expP_uid71_fpHypot3dTest_q_3_q;
                WHEN OTHERS => expA_uid93_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expAmC_uid97_fpHypot3dTest(SUB,96)@10 + 1
    expAmC_uid97_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => expA_uid93_fpHypot3dTest_q(12)) & expA_uid93_fpHypot3dTest_q));
    expAmC_uid97_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => expC_uid95_fpHypot3dTest_q(12)) & expC_uid95_fpHypot3dTest_q));
    expAmC_uid97_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmC_uid97_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmC_uid97_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(expAmC_uid97_fpHypot3dTest_a) - SIGNED(expAmC_uid97_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    expAmC_uid97_fpHypot3dTest_q <= expAmC_uid97_fpHypot3dTest_o(13 downto 0);

    -- shiftedOutC_uid101_fpHypot3dTest(COMPARE,100)@11 + 1
    shiftedOutC_uid101_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expAmC_uid97_fpHypot3dTest_q(13)) & expAmC_uid97_fpHypot3dTest_q));
    shiftedOutC_uid101_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 7 => cWFP2_uid98_fpHypot3dTest_q(6)) & cWFP2_uid98_fpHypot3dTest_q));
    shiftedOutC_uid101_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOutC_uid101_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOutC_uid101_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftedOutC_uid101_fpHypot3dTest_a) - SIGNED(shiftedOutC_uid101_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    shiftedOutC_uid101_fpHypot3dTest_n(0) <= not (shiftedOutC_uid101_fpHypot3dTest_o(15));

    -- redist105_excZ_z_uid45_fpHypot3dTest_q_3(DELAY,856)
    redist105_excZ_z_uid45_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist104_excZ_z_uid45_fpHypot3dTest_q_2_q, xout => redist105_excZ_z_uid45_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- redist108_excZ_y_uid31_fpHypot3dTest_q_3(DELAY,859)
    redist108_excZ_y_uid31_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist107_excZ_y_uid31_fpHypot3dTest_q_2_q, xout => redist108_excZ_y_uid31_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- excZ_x_uid17_fpHypot3dTest(LOGICAL,16)@6 + 1
    excZ_x_uid17_fpHypot3dTest_qi <= "1" WHEN redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg_q = cstAllZWE_uid14_fpHypot3dTest_q ELSE "0";
    excZ_x_uid17_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid17_fpHypot3dTest_qi, xout => excZ_x_uid17_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist110_excZ_x_uid17_fpHypot3dTest_q_3(DELAY,861)
    redist110_excZ_x_uid17_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid17_fpHypot3dTest_q, xout => redist110_excZ_x_uid17_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- excCZero_uid112_fpHypot3dTest(MUX,111)@9 + 1
    excCZero_uid112_fpHypot3dTest_s <= selCTab_uid92_fpHypot3dTest_q;
    excCZero_uid112_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excCZero_uid112_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excCZero_uid112_fpHypot3dTest_s) IS
                WHEN "00" => excCZero_uid112_fpHypot3dTest_q <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q;
                WHEN "01" => excCZero_uid112_fpHypot3dTest_q <= redist108_excZ_y_uid31_fpHypot3dTest_q_3_q;
                WHEN "10" => excCZero_uid112_fpHypot3dTest_q <= redist105_excZ_z_uid45_fpHypot3dTest_q_3_q;
                WHEN "11" => excCZero_uid112_fpHypot3dTest_q <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q;
                WHEN OTHERS => excCZero_uid112_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist90_excCZero_uid112_fpHypot3dTest_q_3(DELAY,841)
    redist90_excCZero_uid112_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excCZero_uid112_fpHypot3dTest_q, xout => redist90_excCZero_uid112_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- oFracCFlushToZero_uid114_fpHypot3dTest(LOGICAL,113)@12
    oFracCFlushToZero_uid114_fpHypot3dTest_q <= redist90_excCZero_uid112_fpHypot3dTest_q_3_q or shiftedOutC_uid101_fpHypot3dTest_n;

    -- oFracCPostExc_uid116_fpHypot3dTest(MUX,115)@12 + 1
    oFracCPostExc_uid116_fpHypot3dTest_s <= oFracCFlushToZero_uid114_fpHypot3dTest_q;
    oFracCPostExc_uid116_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracCPostExc_uid116_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (oFracCPostExc_uid116_fpHypot3dTest_s) IS
                WHEN "0" => oFracCPostExc_uid116_fpHypot3dTest_q <= redist94_oFracC_uid104_fpHypot3dTest_q_3_q;
                WHEN "1" => oFracCPostExc_uid116_fpHypot3dTest_q <= zerosWFp1_uid115_fpHypot3dTest_q;
                WHEN OTHERS => oFracCPostExc_uid116_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracBPostExcG_uid122_fpHypot3dTest(BITJOIN,121)@13
    oFracBPostExcG_uid122_fpHypot3dTest_q <= oFracCPostExc_uid116_fpHypot3dTest_q & cstZ2_uid119_fpHypot3dTest_q;

    -- rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest(MUX,559)@13
    rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_s <= rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_b;
    rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_combproc: PROCESS (rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_s, oFracBPostExcG_uid122_fpHypot3dTest_q, rightShiftStage0Idx1_uid552_alignFracC_uid125_fpHypot3dTest_q, rightShiftStage0Idx2_uid555_alignFracC_uid125_fpHypot3dTest_q, rightShiftStage0Idx3_uid558_alignFracC_uid125_fpHypot3dTest_q)
    BEGIN
        CASE (rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_s) IS
            WHEN "00" => rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q <= oFracBPostExcG_uid122_fpHypot3dTest_q;
            WHEN "01" => rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0Idx1_uid552_alignFracC_uid125_fpHypot3dTest_q;
            WHEN "10" => rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0Idx2_uid555_alignFracC_uid125_fpHypot3dTest_q;
            WHEN "11" => rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0Idx3_uid558_alignFracC_uid125_fpHypot3dTest_q;
            WHEN OTHERS => rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstbfvZwfp1_uid105_fpHypot3dTest(CONSTANT,104)
    cstbfvZwfp1_uid105_fpHypot3dTest_q <= "000000";

    -- expDiffShiftRangeC_uid108_fpHypot3dTest(BITSELECT,107)@11
    expDiffShiftRangeC_uid108_fpHypot3dTest_in <= expAmC_uid97_fpHypot3dTest_q(5 downto 0);
    expDiffShiftRangeC_uid108_fpHypot3dTest_b <= expDiffShiftRangeC_uid108_fpHypot3dTest_in(5 downto 0);

    -- redist92_expDiffShiftRangeC_uid108_fpHypot3dTest_b_1(DELAY,843)
    redist92_expDiffShiftRangeC_uid108_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expDiffShiftRangeC_uid108_fpHypot3dTest_b, xout => redist92_expDiffShiftRangeC_uid108_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- selBTab_uid91_fpHypot3dTest(LOOKUP,90)@9
    selBTab_uid91_fpHypot3dTest_combproc: PROCESS (concCompareExpRes_uid89_fpHypot3dTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concCompareExpRes_uid89_fpHypot3dTest_q) IS
            WHEN "000" => selBTab_uid91_fpHypot3dTest_q <= "01";
            WHEN "001" => selBTab_uid91_fpHypot3dTest_q <= "00";
            WHEN "010" => selBTab_uid91_fpHypot3dTest_q <= "10";
            WHEN "011" => selBTab_uid91_fpHypot3dTest_q <= "00";
            WHEN "100" => selBTab_uid91_fpHypot3dTest_q <= "00";
            WHEN "101" => selBTab_uid91_fpHypot3dTest_q <= "10";
            WHEN "110" => selBTab_uid91_fpHypot3dTest_q <= "00";
            WHEN "111" => selBTab_uid91_fpHypot3dTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           selBTab_uid91_fpHypot3dTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expB_uid94_fpHypot3dTest(MUX,93)@9 + 1
    expB_uid94_fpHypot3dTest_s <= selBTab_uid91_fpHypot3dTest_q;
    expB_uid94_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expB_uid94_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expB_uid94_fpHypot3dTest_s) IS
                WHEN "00" => expB_uid94_fpHypot3dTest_q <= redist102_expP_uid71_fpHypot3dTest_q_3_q;
                WHEN "01" => expB_uid94_fpHypot3dTest_q <= redist101_expQ_uid72_fpHypot3dTest_q_3_q;
                WHEN "10" => expB_uid94_fpHypot3dTest_q <= redist100_expS_uid73_fpHypot3dTest_q_3_q;
                WHEN "11" => expB_uid94_fpHypot3dTest_q <= redist102_expP_uid71_fpHypot3dTest_q_3_q;
                WHEN OTHERS => expB_uid94_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expAmB_uid96_fpHypot3dTest(SUB,95)@10 + 1
    expAmB_uid96_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => expA_uid93_fpHypot3dTest_q(12)) & expA_uid93_fpHypot3dTest_q));
    expAmB_uid96_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => expB_uid94_fpHypot3dTest_q(12)) & expB_uid94_fpHypot3dTest_q));
    expAmB_uid96_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expAmB_uid96_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expAmB_uid96_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(expAmB_uid96_fpHypot3dTest_a) - SIGNED(expAmB_uid96_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    expAmB_uid96_fpHypot3dTest_q <= expAmB_uid96_fpHypot3dTest_o(13 downto 0);

    -- shiftedOutB_uid99_fpHypot3dTest(COMPARE,98)@11 + 1
    shiftedOutB_uid99_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expAmB_uid96_fpHypot3dTest_q(13)) & expAmB_uid96_fpHypot3dTest_q));
    shiftedOutB_uid99_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 7 => cWFP2_uid98_fpHypot3dTest_q(6)) & cWFP2_uid98_fpHypot3dTest_q));
    shiftedOutB_uid99_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOutB_uid99_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOutB_uid99_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftedOutB_uid99_fpHypot3dTest_a) - SIGNED(shiftedOutB_uid99_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    shiftedOutB_uid99_fpHypot3dTest_n(0) <= not (shiftedOutB_uid99_fpHypot3dTest_o(15));

    -- shiftValueC_uid109_fpHypot3dTest(MUX,108)@12 + 1
    shiftValueC_uid109_fpHypot3dTest_s <= shiftedOutB_uid99_fpHypot3dTest_n;
    shiftValueC_uid109_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValueC_uid109_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftValueC_uid109_fpHypot3dTest_s) IS
                WHEN "0" => shiftValueC_uid109_fpHypot3dTest_q <= redist92_expDiffShiftRangeC_uid108_fpHypot3dTest_b_1_q;
                WHEN "1" => shiftValueC_uid109_fpHypot3dTest_q <= cstbfvZwfp1_uid105_fpHypot3dTest_q;
                WHEN OTHERS => shiftValueC_uid109_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select(BITSELECT,736)@13
    rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_b <= shiftValueC_uid109_fpHypot3dTest_q(5 downto 4);
    rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_c <= shiftValueC_uid109_fpHypot3dTest_q(3 downto 2);
    rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d <= shiftValueC_uid109_fpHypot3dTest_q(1 downto 0);

    -- rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest(MUX,570)@13 + 1
    rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_s <= rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_c;
    rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_s) IS
                WHEN "00" => rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage0_uid560_alignFracC_uid125_fpHypot3dTest_q;
                WHEN "01" => rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage1Idx1_uid563_alignFracC_uid125_fpHypot3dTest_q;
                WHEN "10" => rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage1Idx2_uid566_alignFracC_uid125_fpHypot3dTest_q;
                WHEN "11" => rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage1Idx3_uid569_alignFracC_uid125_fpHypot3dTest_q;
                WHEN OTHERS => rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist9_rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d_1(DELAY,760)
    redist9_rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d, xout => redist9_rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest(MUX,581)@14 + 1
    rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_s <= redist9_rightShiftStageSel5Dto4_uid559_alignFracC_uid125_fpHypot3dTest_merged_bit_select_d_1_q;
    rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_s) IS
                WHEN "00" => rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage1_uid571_alignFracC_uid125_fpHypot3dTest_q;
                WHEN "01" => rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage2Idx1_uid574_alignFracC_uid125_fpHypot3dTest_q;
                WHEN "10" => rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage2Idx2_uid577_alignFracC_uid125_fpHypot3dTest_q;
                WHEN "11" => rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q <= rightShiftStage2Idx3_uid580_alignFracC_uid125_fpHypot3dTest_q;
                WHEN OTHERS => rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage2Idx3Rng3_uid542_alignFracB_uid124_fpHypot3dTest(BITSELECT,541)@14
    rightShiftStage2Idx3Rng3_uid542_alignFracB_uid124_fpHypot3dTest_b <= rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q(54 downto 3);

    -- rightShiftStage2Idx3_uid544_alignFracB_uid124_fpHypot3dTest(BITJOIN,543)@14
    rightShiftStage2Idx3_uid544_alignFracB_uid124_fpHypot3dTest_q <= aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval_q & rightShiftStage2Idx3Rng3_uid542_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage2Idx2Rng2_uid539_alignFracB_uid124_fpHypot3dTest(BITSELECT,538)@14
    rightShiftStage2Idx2Rng2_uid539_alignFracB_uid124_fpHypot3dTest_b <= rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q(54 downto 2);

    -- rightShiftStage2Idx2_uid541_alignFracB_uid124_fpHypot3dTest(BITJOIN,540)@14
    rightShiftStage2Idx2_uid541_alignFracB_uid124_fpHypot3dTest_q <= cstZ2_uid119_fpHypot3dTest_q & rightShiftStage2Idx2Rng2_uid539_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage2Idx1Rng1_uid536_alignFracB_uid124_fpHypot3dTest(BITSELECT,535)@14
    rightShiftStage2Idx1Rng1_uid536_alignFracB_uid124_fpHypot3dTest_b <= rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q(54 downto 1);

    -- rightShiftStage2Idx1_uid538_alignFracB_uid124_fpHypot3dTest(BITJOIN,537)@14
    rightShiftStage2Idx1_uid538_alignFracB_uid124_fpHypot3dTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid536_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage1Idx3Rng12_uid531_alignFracB_uid124_fpHypot3dTest(BITSELECT,530)@13
    rightShiftStage1Idx3Rng12_uid531_alignFracB_uid124_fpHypot3dTest_b <= rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q(54 downto 12);

    -- rightShiftStage1Idx3_uid533_alignFracB_uid124_fpHypot3dTest(BITJOIN,532)@13
    rightShiftStage1Idx3_uid533_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage1Idx3Pad12_uid532_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage1Idx3Rng12_uid531_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage1Idx2Rng8_uid528_alignFracB_uid124_fpHypot3dTest(BITSELECT,527)@13
    rightShiftStage1Idx2Rng8_uid528_alignFracB_uid124_fpHypot3dTest_b <= rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q(54 downto 8);

    -- rightShiftStage1Idx2_uid530_alignFracB_uid124_fpHypot3dTest(BITJOIN,529)@13
    rightShiftStage1Idx2_uid530_alignFracB_uid124_fpHypot3dTest_q <= rightBottomX_bottomExtension_uid347_pT5_uid244_invPolyEval_q & rightShiftStage1Idx2Rng8_uid528_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage1Idx1Rng4_uid525_alignFracB_uid124_fpHypot3dTest(BITSELECT,524)@13
    rightShiftStage1Idx1Rng4_uid525_alignFracB_uid124_fpHypot3dTest_b <= rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q(54 downto 4);

    -- rightShiftStage1Idx1_uid527_alignFracB_uid124_fpHypot3dTest(BITJOIN,526)@13
    rightShiftStage1Idx1_uid527_alignFracB_uid124_fpHypot3dTest_q <= rightBottomX_bottomExtension_uid312_pT4_uid238_invPolyEval_q & rightShiftStage1Idx1Rng4_uid525_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage0Idx3Rng48_uid520_alignFracB_uid124_fpHypot3dTest(BITSELECT,519)@13
    rightShiftStage0Idx3Rng48_uid520_alignFracB_uid124_fpHypot3dTest_b <= oFracBPostExcG_uid120_fpHypot3dTest_q(54 downto 48);

    -- rightShiftStage0Idx3_uid522_alignFracB_uid124_fpHypot3dTest(BITJOIN,521)@13
    rightShiftStage0Idx3_uid522_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0Idx3Pad48_uid521_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage0Idx3Rng48_uid520_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage0Idx2Rng32_uid517_alignFracB_uid124_fpHypot3dTest(BITSELECT,516)@13
    rightShiftStage0Idx2Rng32_uid517_alignFracB_uid124_fpHypot3dTest_b <= oFracBPostExcG_uid120_fpHypot3dTest_q(54 downto 32);

    -- rightShiftStage0Idx2_uid519_alignFracB_uid124_fpHypot3dTest(BITJOIN,518)@13
    rightShiftStage0Idx2_uid519_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0Idx2Pad32_uid518_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage0Idx2Rng32_uid517_alignFracB_uid124_fpHypot3dTest_b;

    -- rightShiftStage0Idx1Rng16_uid514_alignFracB_uid124_fpHypot3dTest(BITSELECT,513)@13
    rightShiftStage0Idx1Rng16_uid514_alignFracB_uid124_fpHypot3dTest_b <= oFracBPostExcG_uid120_fpHypot3dTest_q(54 downto 16);

    -- rightShiftStage0Idx1_uid516_alignFracB_uid124_fpHypot3dTest(BITJOIN,515)@13
    rightShiftStage0Idx1_uid516_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0Idx1Pad16_uid515_alignFracB_uid124_fpHypot3dTest_q & rightShiftStage0Idx1Rng16_uid514_alignFracB_uid124_fpHypot3dTest_b;

    -- oFracB_uid103_fpHypot3dTest(MUX,102)@9 + 1
    oFracB_uid103_fpHypot3dTest_s <= selBTab_uid91_fpHypot3dTest_q;
    oFracB_uid103_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracB_uid103_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (oFracB_uid103_fpHypot3dTest_s) IS
                WHEN "00" => oFracB_uid103_fpHypot3dTest_q <= redist99_ofracP_uid76_fpHypot3dTest_q_3_q;
                WHEN "01" => oFracB_uid103_fpHypot3dTest_q <= redist98_ofracQ_uid79_fpHypot3dTest_q_3_q;
                WHEN "10" => oFracB_uid103_fpHypot3dTest_q <= redist97_ofracS_uid82_fpHypot3dTest_q_3_q;
                WHEN "11" => oFracB_uid103_fpHypot3dTest_q <= redist99_ofracP_uid76_fpHypot3dTest_q_3_q;
                WHEN OTHERS => oFracB_uid103_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist95_oFracB_uid103_fpHypot3dTest_q_3(DELAY,846)
    redist95_oFracB_uid103_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracB_uid103_fpHypot3dTest_q, xout => redist95_oFracB_uid103_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- excBZero_uid111_fpHypot3dTest(MUX,110)@9 + 1
    excBZero_uid111_fpHypot3dTest_s <= selBTab_uid91_fpHypot3dTest_q;
    excBZero_uid111_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excBZero_uid111_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excBZero_uid111_fpHypot3dTest_s) IS
                WHEN "00" => excBZero_uid111_fpHypot3dTest_q <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q;
                WHEN "01" => excBZero_uid111_fpHypot3dTest_q <= redist108_excZ_y_uid31_fpHypot3dTest_q_3_q;
                WHEN "10" => excBZero_uid111_fpHypot3dTest_q <= redist105_excZ_z_uid45_fpHypot3dTest_q_3_q;
                WHEN "11" => excBZero_uid111_fpHypot3dTest_q <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q;
                WHEN OTHERS => excBZero_uid111_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist91_excBZero_uid111_fpHypot3dTest_q_3(DELAY,842)
    redist91_excBZero_uid111_fpHypot3dTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excBZero_uid111_fpHypot3dTest_q, xout => redist91_excBZero_uid111_fpHypot3dTest_q_3_q, clk => clk, aclr => areset );

    -- oFracBFlushToZero_uid113_fpHypot3dTest(LOGICAL,112)@12
    oFracBFlushToZero_uid113_fpHypot3dTest_q <= redist91_excBZero_uid111_fpHypot3dTest_q_3_q or shiftedOutB_uid99_fpHypot3dTest_n;

    -- oFracBPostExc_uid117_fpHypot3dTest(MUX,116)@12 + 1
    oFracBPostExc_uid117_fpHypot3dTest_s <= oFracBFlushToZero_uid113_fpHypot3dTest_q;
    oFracBPostExc_uid117_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracBPostExc_uid117_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (oFracBPostExc_uid117_fpHypot3dTest_s) IS
                WHEN "0" => oFracBPostExc_uid117_fpHypot3dTest_q <= redist95_oFracB_uid103_fpHypot3dTest_q_3_q;
                WHEN "1" => oFracBPostExc_uid117_fpHypot3dTest_q <= zerosWFp1_uid115_fpHypot3dTest_q;
                WHEN OTHERS => oFracBPostExc_uid117_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracBPostExcG_uid120_fpHypot3dTest(BITJOIN,119)@13
    oFracBPostExcG_uid120_fpHypot3dTest_q <= oFracBPostExc_uid117_fpHypot3dTest_q & cstZ2_uid119_fpHypot3dTest_q;

    -- rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest(MUX,523)@13
    rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_s <= rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_b;
    rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_combproc: PROCESS (rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_s, oFracBPostExcG_uid120_fpHypot3dTest_q, rightShiftStage0Idx1_uid516_alignFracB_uid124_fpHypot3dTest_q, rightShiftStage0Idx2_uid519_alignFracB_uid124_fpHypot3dTest_q, rightShiftStage0Idx3_uid522_alignFracB_uid124_fpHypot3dTest_q)
    BEGIN
        CASE (rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_s) IS
            WHEN "00" => rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q <= oFracBPostExcG_uid120_fpHypot3dTest_q;
            WHEN "01" => rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0Idx1_uid516_alignFracB_uid124_fpHypot3dTest_q;
            WHEN "10" => rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0Idx2_uid519_alignFracB_uid124_fpHypot3dTest_q;
            WHEN "11" => rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0Idx3_uid522_alignFracB_uid124_fpHypot3dTest_q;
            WHEN OTHERS => rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expDiffShiftRangeB_uid106_fpHypot3dTest(BITSELECT,105)@11
    expDiffShiftRangeB_uid106_fpHypot3dTest_in <= expAmB_uid96_fpHypot3dTest_q(5 downto 0);
    expDiffShiftRangeB_uid106_fpHypot3dTest_b <= expDiffShiftRangeB_uid106_fpHypot3dTest_in(5 downto 0);

    -- redist93_expDiffShiftRangeB_uid106_fpHypot3dTest_b_1(DELAY,844)
    redist93_expDiffShiftRangeB_uid106_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expDiffShiftRangeB_uid106_fpHypot3dTest_b, xout => redist93_expDiffShiftRangeB_uid106_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- shiftValueB_uid107_fpHypot3dTest(MUX,106)@12 + 1
    shiftValueB_uid107_fpHypot3dTest_s <= shiftedOutB_uid99_fpHypot3dTest_n;
    shiftValueB_uid107_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValueB_uid107_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftValueB_uid107_fpHypot3dTest_s) IS
                WHEN "0" => shiftValueB_uid107_fpHypot3dTest_q <= redist93_expDiffShiftRangeB_uid106_fpHypot3dTest_b_1_q;
                WHEN "1" => shiftValueB_uid107_fpHypot3dTest_q <= cstbfvZwfp1_uid105_fpHypot3dTest_q;
                WHEN OTHERS => shiftValueB_uid107_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select(BITSELECT,735)@13
    rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_b <= shiftValueB_uid107_fpHypot3dTest_q(5 downto 4);
    rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_c <= shiftValueB_uid107_fpHypot3dTest_q(3 downto 2);
    rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d <= shiftValueB_uid107_fpHypot3dTest_q(1 downto 0);

    -- rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest(MUX,534)@13 + 1
    rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_s <= rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_c;
    rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_s) IS
                WHEN "00" => rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage0_uid524_alignFracB_uid124_fpHypot3dTest_q;
                WHEN "01" => rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage1Idx1_uid527_alignFracB_uid124_fpHypot3dTest_q;
                WHEN "10" => rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage1Idx2_uid530_alignFracB_uid124_fpHypot3dTest_q;
                WHEN "11" => rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage1Idx3_uid533_alignFracB_uid124_fpHypot3dTest_q;
                WHEN OTHERS => rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist10_rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d_1(DELAY,761)
    redist10_rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d, xout => redist10_rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest(MUX,545)@14 + 1
    rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_s <= redist10_rightShiftStageSel5Dto4_uid523_alignFracB_uid124_fpHypot3dTest_merged_bit_select_d_1_q;
    rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_s) IS
                WHEN "00" => rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage1_uid535_alignFracB_uid124_fpHypot3dTest_q;
                WHEN "01" => rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage2Idx1_uid538_alignFracB_uid124_fpHypot3dTest_q;
                WHEN "10" => rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage2Idx2_uid541_alignFracB_uid124_fpHypot3dTest_q;
                WHEN "11" => rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q <= rightShiftStage2Idx3_uid544_alignFracB_uid124_fpHypot3dTest_q;
                WHEN OTHERS => rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracA_uid102_fpHypot3dTest(MUX,101)@9 + 1
    oFracA_uid102_fpHypot3dTest_s <= selATab_uid90_fpHypot3dTest_q;
    oFracA_uid102_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracA_uid102_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (oFracA_uid102_fpHypot3dTest_s) IS
                WHEN "00" => oFracA_uid102_fpHypot3dTest_q <= redist99_ofracP_uid76_fpHypot3dTest_q_3_q;
                WHEN "01" => oFracA_uid102_fpHypot3dTest_q <= redist98_ofracQ_uid79_fpHypot3dTest_q_3_q;
                WHEN "10" => oFracA_uid102_fpHypot3dTest_q <= redist97_ofracS_uid82_fpHypot3dTest_q_3_q;
                WHEN "11" => oFracA_uid102_fpHypot3dTest_q <= redist99_ofracP_uid76_fpHypot3dTest_q_3_q;
                WHEN OTHERS => oFracA_uid102_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- excAZero_uid110_fpHypot3dTest(MUX,109)@9 + 1
    excAZero_uid110_fpHypot3dTest_s <= selATab_uid90_fpHypot3dTest_q;
    excAZero_uid110_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excAZero_uid110_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excAZero_uid110_fpHypot3dTest_s) IS
                WHEN "00" => excAZero_uid110_fpHypot3dTest_q <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q;
                WHEN "01" => excAZero_uid110_fpHypot3dTest_q <= redist108_excZ_y_uid31_fpHypot3dTest_q_3_q;
                WHEN "10" => excAZero_uid110_fpHypot3dTest_q <= redist105_excZ_z_uid45_fpHypot3dTest_q_3_q;
                WHEN "11" => excAZero_uid110_fpHypot3dTest_q <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q;
                WHEN OTHERS => excAZero_uid110_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracAPostExc_uid118_fpHypot3dTest(MUX,117)@10 + 1
    oFracAPostExc_uid118_fpHypot3dTest_s <= excAZero_uid110_fpHypot3dTest_q;
    oFracAPostExc_uid118_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracAPostExc_uid118_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (oFracAPostExc_uid118_fpHypot3dTest_s) IS
                WHEN "0" => oFracAPostExc_uid118_fpHypot3dTest_q <= oFracA_uid102_fpHypot3dTest_q;
                WHEN "1" => oFracAPostExc_uid118_fpHypot3dTest_q <= zerosWFp1_uid115_fpHypot3dTest_q;
                WHEN OTHERS => oFracAPostExc_uid118_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_inputreg(DELAY,941)
    redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_inputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracAPostExc_uid118_fpHypot3dTest_q, xout => redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_inputreg_q, clk => clk, aclr => areset );

    -- redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5(DELAY,840)
    redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_inputreg_q, xout => redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_q, clk => clk, aclr => areset );

    -- redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_outputreg(DELAY,942)
    redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_outputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_q, xout => redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_outputreg_q, clk => clk, aclr => areset );

    -- pad_oFracAPostExc_uid118_uid126_fpHypot3dTest(BITJOIN,125)@15
    pad_oFracAPostExc_uid118_uid126_fpHypot3dTest_q <= redist89_oFracAPostExc_uid118_fpHypot3dTest_q_5_outputreg_q & STD_LOGIC_VECTOR((1 downto 1 => GND_q(0)) & GND_q);

    -- soSPreNorm_uid126_fpHypot3dTest(ADDSUB3,126)@15 + 1
    soSPreNorm_uid126_fpHypot3dTest_a <= STD_LOGIC_VECTOR("00" & pad_oFracAPostExc_uid118_uid126_fpHypot3dTest_q);
    soSPreNorm_uid126_fpHypot3dTest_b <= STD_LOGIC_VECTOR("00" & rightShiftStage2_uid546_alignFracB_uid124_fpHypot3dTest_q);
    soSPreNorm_uid126_fpHypot3dTest_c <= STD_LOGIC_VECTOR("00" & rightShiftStage2_uid582_alignFracC_uid125_fpHypot3dTest_q);
    soSPreNorm_uid126_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            soSPreNorm_uid126_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            soSPreNorm_uid126_fpHypot3dTest_o <= STD_LOGIC_VECTOR(UNSIGNED(soSPreNorm_uid126_fpHypot3dTest_a) + UNSIGNED(soSPreNorm_uid126_fpHypot3dTest_b) + UNSIGNED(soSPreNorm_uid126_fpHypot3dTest_c));
        END IF;
    END PROCESS;
    soSPreNorm_uid126_fpHypot3dTest_q <= soSPreNorm_uid126_fpHypot3dTest_o(56 downto 0);


    -- sumOfSquareNormBits_uid128_fpHypot3dTest(BITSELECT,127)@16
    sumOfSquareNormBits_uid128_fpHypot3dTest_b <= soSPreNorm_uid126_fpHypot3dTest_q(56 downto 55);

    -- expUpdateVal_uid138_fpHypot3dTest(MUX,137)@16 + 1
    expUpdateVal_uid138_fpHypot3dTest_s <= sumOfSquareNormBits_uid128_fpHypot3dTest_b;
    expUpdateVal_uid138_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUpdateVal_uid138_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expUpdateVal_uid138_fpHypot3dTest_s) IS
                WHEN "00" => expUpdateVal_uid138_fpHypot3dTest_q <= cstZ2_uid119_fpHypot3dTest_q;
                WHEN "01" => expUpdateVal_uid138_fpHypot3dTest_q <= cst01_2_uid136_fpHypot3dTest_q;
                WHEN "10" => expUpdateVal_uid138_fpHypot3dTest_q <= cst10_2_uid137_fpHypot3dTest_q;
                WHEN "11" => expUpdateVal_uid138_fpHypot3dTest_q <= cst10_2_uid137_fpHypot3dTest_q;
                WHEN OTHERS => expUpdateVal_uid138_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- soSRangeHigh_uid129_fpHypot3dTest(BITSELECT,128)@16
    soSRangeHigh_uid129_fpHypot3dTest_in <= soSPreNorm_uid126_fpHypot3dTest_q(55 downto 0);
    soSRangeHigh_uid129_fpHypot3dTest_b <= soSRangeHigh_uid129_fpHypot3dTest_in(55 downto 3);

    -- soSRangeMed_uid130_fpHypot3dTest(BITSELECT,129)@16
    soSRangeMed_uid130_fpHypot3dTest_in <= soSPreNorm_uid126_fpHypot3dTest_q(54 downto 0);
    soSRangeMed_uid130_fpHypot3dTest_b <= soSRangeMed_uid130_fpHypot3dTest_in(54 downto 2);

    -- soSRangeLow_uid131_fpHypot3dTest(BITSELECT,130)@16
    soSRangeLow_uid131_fpHypot3dTest_in <= soSPreNorm_uid126_fpHypot3dTest_q(53 downto 0);
    soSRangeLow_uid131_fpHypot3dTest_b <= soSRangeLow_uid131_fpHypot3dTest_in(53 downto 1);

    -- resFracNorm_uid132_fpHypot3dTest(MUX,131)@16 + 1
    resFracNorm_uid132_fpHypot3dTest_s <= sumOfSquareNormBits_uid128_fpHypot3dTest_b;
    resFracNorm_uid132_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            resFracNorm_uid132_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (resFracNorm_uid132_fpHypot3dTest_s) IS
                WHEN "00" => resFracNorm_uid132_fpHypot3dTest_q <= soSRangeLow_uid131_fpHypot3dTest_b;
                WHEN "01" => resFracNorm_uid132_fpHypot3dTest_q <= soSRangeMed_uid130_fpHypot3dTest_b;
                WHEN "10" => resFracNorm_uid132_fpHypot3dTest_q <= soSRangeHigh_uid129_fpHypot3dTest_b;
                WHEN "11" => resFracNorm_uid132_fpHypot3dTest_q <= soSRangeHigh_uid129_fpHypot3dTest_b;
                WHEN OTHERS => resFracNorm_uid132_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- normCatFracSoS_uid140_fpHypot3dTest(BITJOIN,139)@17
    normCatFracSoS_uid140_fpHypot3dTest_q <= expUpdateVal_uid138_fpHypot3dTest_q & resFracNorm_uid132_fpHypot3dTest_q;

    -- redist96_expA_uid93_fpHypot3dTest_q_8_notEnable(LOGICAL,951)
    redist96_expA_uid93_fpHypot3dTest_q_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist96_expA_uid93_fpHypot3dTest_q_8_nor(LOGICAL,952)
    redist96_expA_uid93_fpHypot3dTest_q_8_nor_q <= not (redist96_expA_uid93_fpHypot3dTest_q_8_notEnable_q or redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_q);

    -- redist96_expA_uid93_fpHypot3dTest_q_8_mem_last(CONSTANT,948)
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_last_q <= "010";

    -- redist96_expA_uid93_fpHypot3dTest_q_8_cmp(LOGICAL,949)
    redist96_expA_uid93_fpHypot3dTest_q_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_q);
    redist96_expA_uid93_fpHypot3dTest_q_8_cmp_q <= "1" WHEN redist96_expA_uid93_fpHypot3dTest_q_8_mem_last_q = redist96_expA_uid93_fpHypot3dTest_q_8_cmp_b ELSE "0";

    -- redist96_expA_uid93_fpHypot3dTest_q_8_cmpReg(REG,950)
    redist96_expA_uid93_fpHypot3dTest_q_8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_cmpReg_q <= STD_LOGIC_VECTOR(redist96_expA_uid93_fpHypot3dTest_q_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena(REG,953)
    redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist96_expA_uid93_fpHypot3dTest_q_8_nor_q = "1") THEN
                redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist96_expA_uid93_fpHypot3dTest_q_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist96_expA_uid93_fpHypot3dTest_q_8_enaAnd(LOGICAL,954)
    redist96_expA_uid93_fpHypot3dTest_q_8_enaAnd_q <= redist96_expA_uid93_fpHypot3dTest_q_8_sticky_ena_q and VCC_q;

    -- redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt(COUNTER,946)
    -- low=0, high=3, step=1, init=0
    redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_i <= redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_i, 2)));

    -- redist96_expA_uid93_fpHypot3dTest_q_8_inputreg(DELAY,943)
    redist96_expA_uid93_fpHypot3dTest_q_8_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expA_uid93_fpHypot3dTest_q, xout => redist96_expA_uid93_fpHypot3dTest_q_8_inputreg_q, clk => clk, aclr => areset );

    -- redist96_expA_uid93_fpHypot3dTest_q_8_wraddr(REG,947)
    redist96_expA_uid93_fpHypot3dTest_q_8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_wraddr_q <= "11";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist96_expA_uid93_fpHypot3dTest_q_8_wraddr_q <= STD_LOGIC_VECTOR(redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist96_expA_uid93_fpHypot3dTest_q_8_mem(DUALMEM,945)
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_ia <= STD_LOGIC_VECTOR(redist96_expA_uid93_fpHypot3dTest_q_8_inputreg_q);
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_aa <= redist96_expA_uid93_fpHypot3dTest_q_8_wraddr_q;
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_ab <= redist96_expA_uid93_fpHypot3dTest_q_8_rdcnt_q;
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_reset0 <= areset;
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 13,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 13,
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
        clocken1 => redist96_expA_uid93_fpHypot3dTest_q_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist96_expA_uid93_fpHypot3dTest_q_8_mem_reset0,
        clock1 => clk,
        address_a => redist96_expA_uid93_fpHypot3dTest_q_8_mem_aa,
        data_a => redist96_expA_uid93_fpHypot3dTest_q_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist96_expA_uid93_fpHypot3dTest_q_8_mem_ab,
        q_b => redist96_expA_uid93_fpHypot3dTest_q_8_mem_iq
    );
    redist96_expA_uid93_fpHypot3dTest_q_8_mem_q <= redist96_expA_uid93_fpHypot3dTest_q_8_mem_iq(12 downto 0);

    -- redist96_expA_uid93_fpHypot3dTest_q_8_outputreg(DELAY,944)
    redist96_expA_uid93_fpHypot3dTest_q_8_outputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist96_expA_uid93_fpHypot3dTest_q_8_mem_q, xout => redist96_expA_uid93_fpHypot3dTest_q_8_outputreg_q, clk => clk, aclr => areset );

    -- cstZeroWF_uid13_fpHypot3dTest(CONSTANT,12)
    cstZeroWF_uid13_fpHypot3dTest_q <= "0000000000000000000000000000000000000000000000000000";

    -- expCatRndBit_uid135_fpHypot3dTest(BITJOIN,134)@17
    expCatRndBit_uid135_fpHypot3dTest_q <= redist96_expA_uid93_fpHypot3dTest_q_8_outputreg_q & cstZeroWF_uid13_fpHypot3dTest_q & VCC_q;

    -- expFracPostNorm_uid141_fpHypot3dTest(ADD,140)@17
    expFracPostNorm_uid141_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((67 downto 66 => expCatRndBit_uid135_fpHypot3dTest_q(65)) & expCatRndBit_uid135_fpHypot3dTest_q));
    expFracPostNorm_uid141_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & normCatFracSoS_uid140_fpHypot3dTest_q));
    expFracPostNorm_uid141_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostNorm_uid141_fpHypot3dTest_a) + SIGNED(expFracPostNorm_uid141_fpHypot3dTest_b));
    expFracPostNorm_uid141_fpHypot3dTest_q <= expFracPostNorm_uid141_fpHypot3dTest_o(66 downto 0);

    -- fracRPreSqrt_uid142_fpHypot3dTest(BITSELECT,141)@17
    fracRPreSqrt_uid142_fpHypot3dTest_in <= expFracPostNorm_uid141_fpHypot3dTest_q(52 downto 0);
    fracRPreSqrt_uid142_fpHypot3dTest_b <= fracRPreSqrt_uid142_fpHypot3dTest_in(52 downto 1);

    -- redist88_fracRPreSqrt_uid142_fpHypot3dTest_b_1(DELAY,839)
    redist88_fracRPreSqrt_uid142_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreSqrt_uid142_fpHypot3dTest_b, xout => redist88_fracRPreSqrt_uid142_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- yy_uid156_fpHypot3dTest(BITSELECT,155)@18
    yy_uid156_fpHypot3dTest_in <= redist88_fracRPreSqrt_uid142_fpHypot3dTest_b_1_q(44 downto 0);
    yy_uid156_fpHypot3dTest_b <= yy_uid156_fpHypot3dTest_in(44 downto 0);

    -- redist73_yy_uid156_fpHypot3dTest_b_3_inputreg(DELAY,900)
    redist73_yy_uid156_fpHypot3dTest_b_3_inputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yy_uid156_fpHypot3dTest_b, xout => redist73_yy_uid156_fpHypot3dTest_b_3_inputreg_q, clk => clk, aclr => areset );

    -- redist73_yy_uid156_fpHypot3dTest_b_3(DELAY,824)
    redist73_yy_uid156_fpHypot3dTest_b_3 : dspba_delay
    GENERIC MAP ( width => 45, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist73_yy_uid156_fpHypot3dTest_b_3_inputreg_q, xout => redist73_yy_uid156_fpHypot3dTest_b_3_q, clk => clk, aclr => areset );

    -- redist74_yy_uid156_fpHypot3dTest_b_7_inputreg(DELAY,901)
    redist74_yy_uid156_fpHypot3dTest_b_7_inputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist73_yy_uid156_fpHypot3dTest_b_3_q, xout => redist74_yy_uid156_fpHypot3dTest_b_7_inputreg_q, clk => clk, aclr => areset );

    -- redist74_yy_uid156_fpHypot3dTest_b_7(DELAY,825)
    redist74_yy_uid156_fpHypot3dTest_b_7 : dspba_delay
    GENERIC MAP ( width => 45, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist74_yy_uid156_fpHypot3dTest_b_7_inputreg_q, xout => redist74_yy_uid156_fpHypot3dTest_b_7_q, clk => clk, aclr => areset );

    -- redist74_yy_uid156_fpHypot3dTest_b_7_outputreg(DELAY,902)
    redist74_yy_uid156_fpHypot3dTest_b_7_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist74_yy_uid156_fpHypot3dTest_b_7_q, xout => redist74_yy_uid156_fpHypot3dTest_b_7_outputreg_q, clk => clk, aclr => areset );

    -- redist75_yy_uid156_fpHypot3dTest_b_11_inputreg(DELAY,903)
    redist75_yy_uid156_fpHypot3dTest_b_11_inputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist74_yy_uid156_fpHypot3dTest_b_7_outputreg_q, xout => redist75_yy_uid156_fpHypot3dTest_b_11_inputreg_q, clk => clk, aclr => areset );

    -- redist75_yy_uid156_fpHypot3dTest_b_11(DELAY,826)
    redist75_yy_uid156_fpHypot3dTest_b_11 : dspba_delay
    GENERIC MAP ( width => 45, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist75_yy_uid156_fpHypot3dTest_b_11_inputreg_q, xout => redist75_yy_uid156_fpHypot3dTest_b_11_q, clk => clk, aclr => areset );

    -- redist75_yy_uid156_fpHypot3dTest_b_11_outputreg(DELAY,904)
    redist75_yy_uid156_fpHypot3dTest_b_11_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist75_yy_uid156_fpHypot3dTest_b_11_q, xout => redist75_yy_uid156_fpHypot3dTest_b_11_outputreg_q, clk => clk, aclr => areset );

    -- redist76_yy_uid156_fpHypot3dTest_b_16_inputreg(DELAY,905)
    redist76_yy_uid156_fpHypot3dTest_b_16_inputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist75_yy_uid156_fpHypot3dTest_b_11_outputreg_q, xout => redist76_yy_uid156_fpHypot3dTest_b_16_inputreg_q, clk => clk, aclr => areset );

    -- redist76_yy_uid156_fpHypot3dTest_b_16_wraddr(REG,909)
    redist76_yy_uid156_fpHypot3dTest_b_16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist76_yy_uid156_fpHypot3dTest_b_16_wraddr_q <= STD_LOGIC_VECTOR(redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist76_yy_uid156_fpHypot3dTest_b_16_mem(DUALMEM,907)
    redist76_yy_uid156_fpHypot3dTest_b_16_mem_ia <= STD_LOGIC_VECTOR(redist76_yy_uid156_fpHypot3dTest_b_16_inputreg_q);
    redist76_yy_uid156_fpHypot3dTest_b_16_mem_aa <= redist76_yy_uid156_fpHypot3dTest_b_16_wraddr_q;
    redist76_yy_uid156_fpHypot3dTest_b_16_mem_ab <= redist76_yy_uid156_fpHypot3dTest_b_16_rdcnt_q;
    redist76_yy_uid156_fpHypot3dTest_b_16_mem_reset0 <= areset;
    redist76_yy_uid156_fpHypot3dTest_b_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 45,
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
        clocken1 => redist76_yy_uid156_fpHypot3dTest_b_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist76_yy_uid156_fpHypot3dTest_b_16_mem_reset0,
        clock1 => clk,
        address_a => redist76_yy_uid156_fpHypot3dTest_b_16_mem_aa,
        data_a => redist76_yy_uid156_fpHypot3dTest_b_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist76_yy_uid156_fpHypot3dTest_b_16_mem_ab,
        q_b => redist76_yy_uid156_fpHypot3dTest_b_16_mem_iq
    );
    redist76_yy_uid156_fpHypot3dTest_b_16_mem_q <= redist76_yy_uid156_fpHypot3dTest_b_16_mem_iq(44 downto 0);

    -- redist76_yy_uid156_fpHypot3dTest_b_16_outputreg(DELAY,906)
    redist76_yy_uid156_fpHypot3dTest_b_16_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist76_yy_uid156_fpHypot3dTest_b_16_mem_q, xout => redist76_yy_uid156_fpHypot3dTest_b_16_outputreg_q, clk => clk, aclr => areset );

    -- redist77_yy_uid156_fpHypot3dTest_b_21_inputreg(DELAY,915)
    redist77_yy_uid156_fpHypot3dTest_b_21_inputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist76_yy_uid156_fpHypot3dTest_b_16_outputreg_q, xout => redist77_yy_uid156_fpHypot3dTest_b_21_inputreg_q, clk => clk, aclr => areset );

    -- redist77_yy_uid156_fpHypot3dTest_b_21_wraddr(REG,919)
    redist77_yy_uid156_fpHypot3dTest_b_21_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_yy_uid156_fpHypot3dTest_b_21_wraddr_q <= STD_LOGIC_VECTOR(redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist77_yy_uid156_fpHypot3dTest_b_21_mem(DUALMEM,917)
    redist77_yy_uid156_fpHypot3dTest_b_21_mem_ia <= STD_LOGIC_VECTOR(redist77_yy_uid156_fpHypot3dTest_b_21_inputreg_q);
    redist77_yy_uid156_fpHypot3dTest_b_21_mem_aa <= redist77_yy_uid156_fpHypot3dTest_b_21_wraddr_q;
    redist77_yy_uid156_fpHypot3dTest_b_21_mem_ab <= redist77_yy_uid156_fpHypot3dTest_b_21_rdcnt_q;
    redist77_yy_uid156_fpHypot3dTest_b_21_mem_reset0 <= areset;
    redist77_yy_uid156_fpHypot3dTest_b_21_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 45,
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
        clocken1 => redist77_yy_uid156_fpHypot3dTest_b_21_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist77_yy_uid156_fpHypot3dTest_b_21_mem_reset0,
        clock1 => clk,
        address_a => redist77_yy_uid156_fpHypot3dTest_b_21_mem_aa,
        data_a => redist77_yy_uid156_fpHypot3dTest_b_21_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist77_yy_uid156_fpHypot3dTest_b_21_mem_ab,
        q_b => redist77_yy_uid156_fpHypot3dTest_b_21_mem_iq
    );
    redist77_yy_uid156_fpHypot3dTest_b_21_mem_q <= redist77_yy_uid156_fpHypot3dTest_b_21_mem_iq(44 downto 0);

    -- redist77_yy_uid156_fpHypot3dTest_b_21_outputreg(DELAY,916)
    redist77_yy_uid156_fpHypot3dTest_b_21_outputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist77_yy_uid156_fpHypot3dTest_b_21_mem_q, xout => redist77_yy_uid156_fpHypot3dTest_b_21_outputreg_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid338_pT5_uid244_invPolyEval(BITJOIN,337)@39
    nx_mergedSignalTM_uid338_pT5_uid244_invPolyEval_q <= GND_q & redist77_yy_uid156_fpHypot3dTest_b_21_outputreg_q;

    -- topRangeX_uid340_pT5_uid244_invPolyEval(BITSELECT,339)@39
    topRangeX_uid340_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid338_pT5_uid244_invPolyEval_q(45 downto 19));

    -- yT4_uid237_invPolyEval(BITSELECT,236)@34
    yT4_uid237_invPolyEval_b <= redist76_yy_uid156_fpHypot3dTest_b_16_outputreg_q(44 downto 5);

    -- nx_mergedSignalTM_uid303_pT4_uid238_invPolyEval(BITJOIN,302)@34
    nx_mergedSignalTM_uid303_pT4_uid238_invPolyEval_q <= GND_q & yT4_uid237_invPolyEval_b;

    -- aboveLeftX_uid307_pT4_uid238_invPolyEval(BITSELECT,306)@34
    aboveLeftX_uid307_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid303_pT4_uid238_invPolyEval_q(40 downto 23));

    -- yT3_uid231_invPolyEval(BITSELECT,230)@29
    yT3_uid231_invPolyEval_b <= redist75_yy_uid156_fpHypot3dTest_b_11_outputreg_q(44 downto 12);

    -- nx_mergedSignalTM_uid268_pT3_uid232_invPolyEval(BITJOIN,267)@29
    nx_mergedSignalTM_uid268_pT3_uid232_invPolyEval_q <= GND_q & yT3_uid231_invPolyEval_b;

    -- topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select(BITSELECT,738)@29
    topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid268_pT3_uid232_invPolyEval_q(33 downto 16));
    topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid268_pT3_uid232_invPolyEval_q(15 downto 0));

    -- aboveLeftY_mergedSignalTM_uid275_pT3_uid232_invPolyEval(BITJOIN,274)@29
    aboveLeftY_mergedSignalTM_uid275_pT3_uid232_invPolyEval_q <= topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_c & GND_q;

    -- expRPreSqrt_uid143_fpHypot3dTest(BITSELECT,142)@17
    expRPreSqrt_uid143_fpHypot3dTest_in <= STD_LOGIC_VECTOR(expFracPostNorm_uid141_fpHypot3dTest_q(65 downto 0));
    expRPreSqrt_uid143_fpHypot3dTest_b <= STD_LOGIC_VECTOR(expRPreSqrt_uid143_fpHypot3dTest_in(65 downto 53));

    -- redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1(DELAY,838)
    redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreSqrt_uid143_fpHypot3dTest_b, xout => redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- x0_uid149_fpHypot3dTest(BITSELECT,148)@18
    x0_uid149_fpHypot3dTest_in <= STD_LOGIC_VECTOR(redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q(0 downto 0));
    x0_uid149_fpHypot3dTest_b <= STD_LOGIC_VECTOR(x0_uid149_fpHypot3dTest_in(0 downto 0));

    -- expOddSelect_uid151_fpHypot3dTest(LOGICAL,150)@18
    expOddSelect_uid151_fpHypot3dTest_q <= not (x0_uid149_fpHypot3dTest_b);

    -- addrFull_uid153_fpHypot3dTest(BITJOIN,152)@18
    addrFull_uid153_fpHypot3dTest_q <= expOddSelect_uid151_fpHypot3dTest_q & redist88_fracRPreSqrt_uid142_fpHypot3dTest_b_1_q;

    -- yAddr_uid155_fpHypot3dTest(BITSELECT,154)@18
    yAddr_uid155_fpHypot3dTest_b <= addrFull_uid153_fpHypot3dTest_q(52 downto 45);

    -- memoryC5_uid210_sqrtTables_lutmem(DUALMEM,590)@18 + 2
    -- in j@20000000
    memoryC5_uid210_sqrtTables_lutmem_aa <= yAddr_uid155_fpHypot3dTest_b;
    memoryC5_uid210_sqrtTables_lutmem_reset0 <= areset;
    memoryC5_uid210_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC5_uid210_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC5_uid210_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC5_uid210_sqrtTables_lutmem_aa,
        q_a => memoryC5_uid210_sqrtTables_lutmem_ir
    );
    memoryC5_uid210_sqrtTables_lutmem_r <= memoryC5_uid210_sqrtTables_lutmem_ir(16 downto 0);

    -- redist39_memoryC5_uid210_sqrtTables_lutmem_r_1(DELAY,790)
    redist39_memoryC5_uid210_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC5_uid210_sqrtTables_lutmem_r, xout => redist39_memoryC5_uid210_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- yT1_uid219_invPolyEval(BITSELECT,218)@21
    yT1_uid219_invPolyEval_b <= redist73_yy_uid156_fpHypot3dTest_b_3_q(44 downto 28);

    -- prodXY_uid250_pT1_uid220_invPolyEval_cma(CHAINMULTADD,708)@21 + 2
    prodXY_uid250_pT1_uid220_invPolyEval_cma_reset <= areset;
    prodXY_uid250_pT1_uid220_invPolyEval_cma_ena0 <= '1';
    prodXY_uid250_pT1_uid220_invPolyEval_cma_ena1 <= prodXY_uid250_pT1_uid220_invPolyEval_cma_ena0;
    prodXY_uid250_pT1_uid220_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid250_pT1_uid220_invPolyEval_cma_a0(0),18));
    prodXY_uid250_pT1_uid220_invPolyEval_cma_p(0) <= prodXY_uid250_pT1_uid220_invPolyEval_cma_l(0) * prodXY_uid250_pT1_uid220_invPolyEval_cma_c0(0);
    prodXY_uid250_pT1_uid220_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid250_pT1_uid220_invPolyEval_cma_p(0),35);
    prodXY_uid250_pT1_uid220_invPolyEval_cma_w(0) <= prodXY_uid250_pT1_uid220_invPolyEval_cma_u(0);
    prodXY_uid250_pT1_uid220_invPolyEval_cma_x(0) <= prodXY_uid250_pT1_uid220_invPolyEval_cma_w(0);
    prodXY_uid250_pT1_uid220_invPolyEval_cma_y(0) <= prodXY_uid250_pT1_uid220_invPolyEval_cma_x(0);
    prodXY_uid250_pT1_uid220_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid250_pT1_uid220_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid250_pT1_uid220_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid250_pT1_uid220_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid250_pT1_uid220_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid219_invPolyEval_b),17);
                prodXY_uid250_pT1_uid220_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist39_memoryC5_uid210_sqrtTables_lutmem_r_1_q),17);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid250_pT1_uid220_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid250_pT1_uid220_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid250_pT1_uid220_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid250_pT1_uid220_invPolyEval_cma_s(0) <= prodXY_uid250_pT1_uid220_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid250_pT1_uid220_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid250_pT1_uid220_invPolyEval_cma_s(0)(33 downto 0)), xout => prodXY_uid250_pT1_uid220_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid250_pT1_uid220_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid250_pT1_uid220_invPolyEval_cma_qq(33 downto 0));

    -- osig_uid251_pT1_uid220_invPolyEval(BITSELECT,250)@23
    osig_uid251_pT1_uid220_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid250_pT1_uid220_invPolyEval_cma_q(33 downto 16));

    -- redist59_osig_uid251_pT1_uid220_invPolyEval_b_1(DELAY,810)
    redist59_osig_uid251_pT1_uid220_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid251_pT1_uid220_invPolyEval_b, xout => redist59_osig_uid251_pT1_uid220_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid222_invPolyEval(BITSELECT,221)@24
    highBBits_uid222_invPolyEval_b <= STD_LOGIC_VECTOR(redist59_osig_uid251_pT1_uid220_invPolyEval_b_1_q(17 downto 1));

    -- redist78_yAddr_uid155_fpHypot3dTest_b_3(DELAY,829)
    redist78_yAddr_uid155_fpHypot3dTest_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid155_fpHypot3dTest_b, xout => redist78_yAddr_uid155_fpHypot3dTest_b_3_q, clk => clk, aclr => areset );

    -- memoryC4_uid207_sqrtTables_lutmem(DUALMEM,589)@21 + 2
    -- in j@20000000
    memoryC4_uid207_sqrtTables_lutmem_aa <= redist78_yAddr_uid155_fpHypot3dTest_b_3_q;
    memoryC4_uid207_sqrtTables_lutmem_reset0 <= areset;
    memoryC4_uid207_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 24,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC4_uid207_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid207_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid207_sqrtTables_lutmem_aa,
        q_a => memoryC4_uid207_sqrtTables_lutmem_ir
    );
    memoryC4_uid207_sqrtTables_lutmem_r <= memoryC4_uid207_sqrtTables_lutmem_ir(23 downto 0);

    -- redist40_memoryC4_uid207_sqrtTables_lutmem_r_1(DELAY,791)
    redist40_memoryC4_uid207_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC4_uid207_sqrtTables_lutmem_r, xout => redist40_memoryC4_uid207_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- s1sumAHighB_uid223_invPolyEval(ADD,222)@24 + 1
    s1sumAHighB_uid223_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => redist40_memoryC4_uid207_sqrtTables_lutmem_r_1_q(23)) & redist40_memoryC4_uid207_sqrtTables_lutmem_r_1_q));
    s1sumAHighB_uid223_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => highBBits_uid222_invPolyEval_b(16)) & highBBits_uid222_invPolyEval_b));
    s1sumAHighB_uid223_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s1sumAHighB_uid223_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1sumAHighB_uid223_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid223_invPolyEval_a) + SIGNED(s1sumAHighB_uid223_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid223_invPolyEval_q <= s1sumAHighB_uid223_invPolyEval_o(24 downto 0);

    -- lowRangeB_uid221_invPolyEval(BITSELECT,220)@24
    lowRangeB_uid221_invPolyEval_in <= redist59_osig_uid251_pT1_uid220_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid221_invPolyEval_b <= lowRangeB_uid221_invPolyEval_in(0 downto 0);

    -- redist65_lowRangeB_uid221_invPolyEval_b_1(DELAY,816)
    redist65_lowRangeB_uid221_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid221_invPolyEval_b, xout => redist65_lowRangeB_uid221_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s1_uid224_invPolyEval(BITJOIN,223)@25
    s1_uid224_invPolyEval_q <= s1sumAHighB_uid223_invPolyEval_q & redist65_lowRangeB_uid221_invPolyEval_b_1_q;

    -- yT2_uid225_invPolyEval(BITSELECT,224)@25
    yT2_uid225_invPolyEval_b <= redist74_yy_uid156_fpHypot3dTest_b_7_outputreg_q(44 downto 21);

    -- prodXY_uid253_pT2_uid226_invPolyEval_cma(CHAINMULTADD,709)@25 + 2
    prodXY_uid253_pT2_uid226_invPolyEval_cma_reset <= areset;
    prodXY_uid253_pT2_uid226_invPolyEval_cma_ena0 <= '1';
    prodXY_uid253_pT2_uid226_invPolyEval_cma_ena1 <= prodXY_uid253_pT2_uid226_invPolyEval_cma_ena0;
    prodXY_uid253_pT2_uid226_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid253_pT2_uid226_invPolyEval_cma_a0(0),25));
    prodXY_uid253_pT2_uid226_invPolyEval_cma_p(0) <= prodXY_uid253_pT2_uid226_invPolyEval_cma_l(0) * prodXY_uid253_pT2_uid226_invPolyEval_cma_c0(0);
    prodXY_uid253_pT2_uid226_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid253_pT2_uid226_invPolyEval_cma_p(0),51);
    prodXY_uid253_pT2_uid226_invPolyEval_cma_w(0) <= prodXY_uid253_pT2_uid226_invPolyEval_cma_u(0);
    prodXY_uid253_pT2_uid226_invPolyEval_cma_x(0) <= prodXY_uid253_pT2_uid226_invPolyEval_cma_w(0);
    prodXY_uid253_pT2_uid226_invPolyEval_cma_y(0) <= prodXY_uid253_pT2_uid226_invPolyEval_cma_x(0);
    prodXY_uid253_pT2_uid226_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid253_pT2_uid226_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid253_pT2_uid226_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid253_pT2_uid226_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid253_pT2_uid226_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT2_uid225_invPolyEval_b),24);
                prodXY_uid253_pT2_uid226_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid224_invPolyEval_q),26);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid253_pT2_uid226_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid253_pT2_uid226_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid253_pT2_uid226_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid253_pT2_uid226_invPolyEval_cma_s(0) <= prodXY_uid253_pT2_uid226_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid253_pT2_uid226_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid253_pT2_uid226_invPolyEval_cma_s(0)(49 downto 0)), xout => prodXY_uid253_pT2_uid226_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid253_pT2_uid226_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid253_pT2_uid226_invPolyEval_cma_qq(49 downto 0));

    -- osig_uid254_pT2_uid226_invPolyEval(BITSELECT,253)@27
    osig_uid254_pT2_uid226_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid253_pT2_uid226_invPolyEval_cma_q(49 downto 23));

    -- redist58_osig_uid254_pT2_uid226_invPolyEval_b_1(DELAY,809)
    redist58_osig_uid254_pT2_uid226_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid254_pT2_uid226_invPolyEval_b, xout => redist58_osig_uid254_pT2_uid226_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid228_invPolyEval(BITSELECT,227)@28
    highBBits_uid228_invPolyEval_b <= STD_LOGIC_VECTOR(redist58_osig_uid254_pT2_uid226_invPolyEval_b_1_q(26 downto 1));

    -- redist79_yAddr_uid155_fpHypot3dTest_b_7(DELAY,830)
    redist79_yAddr_uid155_fpHypot3dTest_b_7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist78_yAddr_uid155_fpHypot3dTest_b_3_q, xout => redist79_yAddr_uid155_fpHypot3dTest_b_7_q, clk => clk, aclr => areset );

    -- memoryC3_uid204_sqrtTables_lutmem(DUALMEM,588)@25 + 2
    -- in j@20000000
    memoryC3_uid204_sqrtTables_lutmem_aa <= redist79_yAddr_uid155_fpHypot3dTest_b_7_q;
    memoryC3_uid204_sqrtTables_lutmem_reset0 <= areset;
    memoryC3_uid204_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 33,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC3_uid204_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid204_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid204_sqrtTables_lutmem_aa,
        q_a => memoryC3_uid204_sqrtTables_lutmem_ir
    );
    memoryC3_uid204_sqrtTables_lutmem_r <= memoryC3_uid204_sqrtTables_lutmem_ir(32 downto 0);

    -- redist41_memoryC3_uid204_sqrtTables_lutmem_r_1(DELAY,792)
    redist41_memoryC3_uid204_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC3_uid204_sqrtTables_lutmem_r, xout => redist41_memoryC3_uid204_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- s2sumAHighB_uid229_invPolyEval(ADD,228)@28 + 1
    s2sumAHighB_uid229_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => redist41_memoryC3_uid204_sqrtTables_lutmem_r_1_q(32)) & redist41_memoryC3_uid204_sqrtTables_lutmem_r_1_q));
    s2sumAHighB_uid229_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 26 => highBBits_uid228_invPolyEval_b(25)) & highBBits_uid228_invPolyEval_b));
    s2sumAHighB_uid229_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s2sumAHighB_uid229_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s2sumAHighB_uid229_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid229_invPolyEval_a) + SIGNED(s2sumAHighB_uid229_invPolyEval_b));
        END IF;
    END PROCESS;
    s2sumAHighB_uid229_invPolyEval_q <= s2sumAHighB_uid229_invPolyEval_o(33 downto 0);

    -- lowRangeB_uid227_invPolyEval(BITSELECT,226)@28
    lowRangeB_uid227_invPolyEval_in <= redist58_osig_uid254_pT2_uid226_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid227_invPolyEval_b <= lowRangeB_uid227_invPolyEval_in(0 downto 0);

    -- redist64_lowRangeB_uid227_invPolyEval_b_1(DELAY,815)
    redist64_lowRangeB_uid227_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid227_invPolyEval_b, xout => redist64_lowRangeB_uid227_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s2_uid230_invPolyEval(BITJOIN,229)@29
    s2_uid230_invPolyEval_q <= s2sumAHighB_uid229_invPolyEval_q & redist64_lowRangeB_uid227_invPolyEval_b_1_q;

    -- topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select(BITSELECT,737)@29
    topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid230_invPolyEval_q(34 downto 17));
    topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid230_invPolyEval_q(16 downto 0));

    -- rightBottomX_mergedSignalTM_uid279_pT3_uid232_invPolyEval(BITJOIN,278)@29
    rightBottomX_mergedSignalTM_uid279_pT3_uid232_invPolyEval_q <= topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_c & cstZ2_uid119_fpHypot3dTest_q;

    -- multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma(CHAINMULTADD,725)@29 + 2
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_l(0) * multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_l(1) * multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_u(0) + multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid279_pT3_uid232_invPolyEval_q),18);
                multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid275_pT3_uid232_invPolyEval_q),18);
                multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_b),18);
                multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_qq(36 downto 0));

    -- redist20_multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q_1(DELAY,771)
    redist20_multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q, xout => redist20_multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- highBBits_uid286_pT3_uid232_invPolyEval(BITSELECT,285)@32
    highBBits_uid286_pT3_uid232_invPolyEval_b <= STD_LOGIC_VECTOR(redist20_multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q_1_q(36 downto 18));

    -- sm0_uid282_pT3_uid232_invPolyEval_cma(CHAINMULTADD,710)@29 + 2
    sm0_uid282_pT3_uid232_invPolyEval_cma_reset <= areset;
    sm0_uid282_pT3_uid232_invPolyEval_cma_ena0 <= '1';
    sm0_uid282_pT3_uid232_invPolyEval_cma_ena1 <= sm0_uid282_pT3_uid232_invPolyEval_cma_ena0;
    sm0_uid282_pT3_uid232_invPolyEval_cma_p(0) <= sm0_uid282_pT3_uid232_invPolyEval_cma_a0(0) * sm0_uid282_pT3_uid232_invPolyEval_cma_c0(0);
    sm0_uid282_pT3_uid232_invPolyEval_cma_u(0) <= RESIZE(sm0_uid282_pT3_uid232_invPolyEval_cma_p(0),36);
    sm0_uid282_pT3_uid232_invPolyEval_cma_w(0) <= sm0_uid282_pT3_uid232_invPolyEval_cma_u(0);
    sm0_uid282_pT3_uid232_invPolyEval_cma_x(0) <= sm0_uid282_pT3_uid232_invPolyEval_cma_w(0);
    sm0_uid282_pT3_uid232_invPolyEval_cma_y(0) <= sm0_uid282_pT3_uid232_invPolyEval_cma_x(0);
    sm0_uid282_pT3_uid232_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid282_pT3_uid232_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid282_pT3_uid232_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid282_pT3_uid232_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid282_pT3_uid232_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid270_pT3_uid232_invPolyEval_merged_bit_select_b),18);
                sm0_uid282_pT3_uid232_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid271_pT3_uid232_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid282_pT3_uid232_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid282_pT3_uid232_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid282_pT3_uid232_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid282_pT3_uid232_invPolyEval_cma_s(0) <= sm0_uid282_pT3_uid232_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid282_pT3_uid232_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid282_pT3_uid232_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid282_pT3_uid232_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid282_pT3_uid232_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid282_pT3_uid232_invPolyEval_cma_qq(35 downto 0));

    -- redist35_sm0_uid282_pT3_uid232_invPolyEval_cma_q_1(DELAY,786)
    redist35_sm0_uid282_pT3_uid232_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid282_pT3_uid232_invPolyEval_cma_q, xout => redist35_sm0_uid282_pT3_uid232_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval(ADD,286)@32
    lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => redist35_sm0_uid282_pT3_uid232_invPolyEval_cma_q_1_q(35)) & redist35_sm0_uid282_pT3_uid232_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid286_pT3_uid232_invPolyEval_b(18)) & highBBits_uid286_pT3_uid232_invPolyEval_b));
    lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_b));
    lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_q <= lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid285_pT3_uid232_invPolyEval(BITSELECT,284)@32
    lowRangeB_uid285_pT3_uid232_invPolyEval_in <= redist20_multSumOfTwoTS_uid283_pT3_uid232_invPolyEval_cma_q_1_q(17 downto 0);
    lowRangeB_uid285_pT3_uid232_invPolyEval_b <= lowRangeB_uid285_pT3_uid232_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid288_pT3_uid232_invPolyEval(BITJOIN,287)@32
    lev1_a0_uid288_pT3_uid232_invPolyEval_q <= lev1_a0sumAHighB_uid287_pT3_uid232_invPolyEval_q & lowRangeB_uid285_pT3_uid232_invPolyEval_b;

    -- os_uid289_pT3_uid232_invPolyEval(BITSELECT,288)@32
    os_uid289_pT3_uid232_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid288_pT3_uid232_invPolyEval_q(52 downto 0));
    os_uid289_pT3_uid232_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid289_pT3_uid232_invPolyEval_in(52 downto 19));

    -- redist57_os_uid289_pT3_uid232_invPolyEval_b_1(DELAY,808)
    redist57_os_uid289_pT3_uid232_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid289_pT3_uid232_invPolyEval_b, xout => redist57_os_uid289_pT3_uid232_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid234_invPolyEval(BITSELECT,233)@33
    highBBits_uid234_invPolyEval_b <= STD_LOGIC_VECTOR(redist57_os_uid289_pT3_uid232_invPolyEval_b_1_q(33 downto 1));

    -- redist80_yAddr_uid155_fpHypot3dTest_b_12_inputreg(DELAY,925)
    redist80_yAddr_uid155_fpHypot3dTest_b_12_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist79_yAddr_uid155_fpHypot3dTest_b_7_q, xout => redist80_yAddr_uid155_fpHypot3dTest_b_12_inputreg_q, clk => clk, aclr => areset );

    -- redist80_yAddr_uid155_fpHypot3dTest_b_12(DELAY,831)
    redist80_yAddr_uid155_fpHypot3dTest_b_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist80_yAddr_uid155_fpHypot3dTest_b_12_inputreg_q, xout => redist80_yAddr_uid155_fpHypot3dTest_b_12_q, clk => clk, aclr => areset );

    -- memoryC2_uid201_sqrtTables_lutmem(DUALMEM,587)@30 + 2
    -- in j@20000000
    memoryC2_uid201_sqrtTables_lutmem_aa <= redist80_yAddr_uid155_fpHypot3dTest_b_12_q;
    memoryC2_uid201_sqrtTables_lutmem_reset0 <= areset;
    memoryC2_uid201_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC2_uid201_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid201_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid201_sqrtTables_lutmem_aa,
        q_a => memoryC2_uid201_sqrtTables_lutmem_ir
    );
    memoryC2_uid201_sqrtTables_lutmem_r <= memoryC2_uid201_sqrtTables_lutmem_ir(39 downto 0);

    -- redist42_memoryC2_uid201_sqrtTables_lutmem_r_1(DELAY,793)
    redist42_memoryC2_uid201_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 40, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC2_uid201_sqrtTables_lutmem_r, xout => redist42_memoryC2_uid201_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- s3sumAHighB_uid235_invPolyEval(ADD,234)@33 + 1
    s3sumAHighB_uid235_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => redist42_memoryC2_uid201_sqrtTables_lutmem_r_1_q(39)) & redist42_memoryC2_uid201_sqrtTables_lutmem_r_1_q));
    s3sumAHighB_uid235_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => highBBits_uid234_invPolyEval_b(32)) & highBBits_uid234_invPolyEval_b));
    s3sumAHighB_uid235_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s3sumAHighB_uid235_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s3sumAHighB_uid235_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid235_invPolyEval_a) + SIGNED(s3sumAHighB_uid235_invPolyEval_b));
        END IF;
    END PROCESS;
    s3sumAHighB_uid235_invPolyEval_q <= s3sumAHighB_uid235_invPolyEval_o(40 downto 0);

    -- lowRangeB_uid233_invPolyEval(BITSELECT,232)@33
    lowRangeB_uid233_invPolyEval_in <= redist57_os_uid289_pT3_uid232_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid233_invPolyEval_b <= lowRangeB_uid233_invPolyEval_in(0 downto 0);

    -- redist63_lowRangeB_uid233_invPolyEval_b_1(DELAY,814)
    redist63_lowRangeB_uid233_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid233_invPolyEval_b, xout => redist63_lowRangeB_uid233_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s3_uid236_invPolyEval(BITJOIN,235)@34
    s3_uid236_invPolyEval_q <= s3sumAHighB_uid235_invPolyEval_q & redist63_lowRangeB_uid233_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval(BITSELECT,308)@34
    aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid236_invPolyEval_q(14 downto 0));
    aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval_in(14 downto 0));

    -- aboveLeftY_mergedSignalTM_uid310_pT4_uid238_invPolyEval(BITJOIN,309)@34
    aboveLeftY_mergedSignalTM_uid310_pT4_uid238_invPolyEval_q <= aboveLeftY_bottomRange_uid309_pT4_uid238_invPolyEval_b & aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval_q;

    -- rightBottomY_uid316_pT4_uid238_invPolyEval(BITSELECT,315)@34
    rightBottomY_uid316_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid236_invPolyEval_q(41 downto 24));

    -- rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval(BITSELECT,312)@34
    rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid303_pT4_uid238_invPolyEval_q(13 downto 0));
    rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval_in(13 downto 0));

    -- rightBottomX_mergedSignalTM_uid314_pT4_uid238_invPolyEval(BITJOIN,313)@34
    rightBottomX_mergedSignalTM_uid314_pT4_uid238_invPolyEval_q <= rightBottomX_bottomRange_uid313_pT4_uid238_invPolyEval_b & rightBottomX_bottomExtension_uid312_pT4_uid238_invPolyEval_q;

    -- multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma(CHAINMULTADD,726)@34 + 2
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_l(0) * multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_l(1) * multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_u(0) + multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid314_pT4_uid238_invPolyEval_q),18);
                multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid310_pT4_uid238_invPolyEval_q),18);
                multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(rightBottomY_uid316_pT4_uid238_invPolyEval_b),18);
                multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(aboveLeftX_uid307_pT4_uid238_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_qq(36 downto 0));

    -- redist19_multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q_1(DELAY,770)
    redist19_multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q, xout => redist19_multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- highBBits_uid321_pT4_uid238_invPolyEval(BITSELECT,320)@37
    highBBits_uid321_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(redist19_multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q_1_q(36 downto 9));

    -- topRangeY_uid306_pT4_uid238_invPolyEval(BITSELECT,305)@34
    topRangeY_uid306_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid236_invPolyEval_q(41 downto 15));

    -- topRangeX_uid305_pT4_uid238_invPolyEval(BITSELECT,304)@34
    topRangeX_uid305_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid303_pT4_uid238_invPolyEval_q(40 downto 14));

    -- sm0_uid317_pT4_uid238_invPolyEval_cma(CHAINMULTADD,711)@34 + 2
    sm0_uid317_pT4_uid238_invPolyEval_cma_reset <= areset;
    sm0_uid317_pT4_uid238_invPolyEval_cma_ena0 <= '1';
    sm0_uid317_pT4_uid238_invPolyEval_cma_ena1 <= sm0_uid317_pT4_uid238_invPolyEval_cma_ena0;
    sm0_uid317_pT4_uid238_invPolyEval_cma_p(0) <= sm0_uid317_pT4_uid238_invPolyEval_cma_a0(0) * sm0_uid317_pT4_uid238_invPolyEval_cma_c0(0);
    sm0_uid317_pT4_uid238_invPolyEval_cma_u(0) <= RESIZE(sm0_uid317_pT4_uid238_invPolyEval_cma_p(0),54);
    sm0_uid317_pT4_uid238_invPolyEval_cma_w(0) <= sm0_uid317_pT4_uid238_invPolyEval_cma_u(0);
    sm0_uid317_pT4_uid238_invPolyEval_cma_x(0) <= sm0_uid317_pT4_uid238_invPolyEval_cma_w(0);
    sm0_uid317_pT4_uid238_invPolyEval_cma_y(0) <= sm0_uid317_pT4_uid238_invPolyEval_cma_x(0);
    sm0_uid317_pT4_uid238_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid317_pT4_uid238_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid317_pT4_uid238_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid317_pT4_uid238_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid317_pT4_uid238_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid305_pT4_uid238_invPolyEval_b),27);
                sm0_uid317_pT4_uid238_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid306_pT4_uid238_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid317_pT4_uid238_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid317_pT4_uid238_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid317_pT4_uid238_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid317_pT4_uid238_invPolyEval_cma_s(0) <= sm0_uid317_pT4_uid238_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid317_pT4_uid238_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid317_pT4_uid238_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid317_pT4_uid238_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid317_pT4_uid238_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid317_pT4_uid238_invPolyEval_cma_qq(53 downto 0));

    -- redist34_sm0_uid317_pT4_uid238_invPolyEval_cma_q_1(DELAY,785)
    redist34_sm0_uid317_pT4_uid238_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid317_pT4_uid238_invPolyEval_cma_q, xout => redist34_sm0_uid317_pT4_uid238_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval(ADD,321)@37
    lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => redist34_sm0_uid317_pT4_uid238_invPolyEval_cma_q_1_q(53)) & redist34_sm0_uid317_pT4_uid238_invPolyEval_cma_q_1_q));
    lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid321_pT4_uid238_invPolyEval_b(27)) & highBBits_uid321_pT4_uid238_invPolyEval_b));
    lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_b));
    lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_q <= lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid320_pT4_uid238_invPolyEval(BITSELECT,319)@37
    lowRangeB_uid320_pT4_uid238_invPolyEval_in <= redist19_multSumOfTwoTS_uid318_pT4_uid238_invPolyEval_cma_q_1_q(8 downto 0);
    lowRangeB_uid320_pT4_uid238_invPolyEval_b <= lowRangeB_uid320_pT4_uid238_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid323_pT4_uid238_invPolyEval(BITJOIN,322)@37
    lev1_a0_uid323_pT4_uid238_invPolyEval_q <= lev1_a0sumAHighB_uid322_pT4_uid238_invPolyEval_q & lowRangeB_uid320_pT4_uid238_invPolyEval_b;

    -- os_uid324_pT4_uid238_invPolyEval(BITSELECT,323)@37
    os_uid324_pT4_uid238_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid323_pT4_uid238_invPolyEval_q(61 downto 0));
    os_uid324_pT4_uid238_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid324_pT4_uid238_invPolyEval_in(61 downto 20));

    -- redist56_os_uid324_pT4_uid238_invPolyEval_b_1(DELAY,807)
    redist56_os_uid324_pT4_uid238_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 42, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => os_uid324_pT4_uid238_invPolyEval_b, xout => redist56_os_uid324_pT4_uid238_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid240_invPolyEval(BITSELECT,239)@38
    highBBits_uid240_invPolyEval_b <= STD_LOGIC_VECTOR(redist56_os_uid324_pT4_uid238_invPolyEval_b_1_q(41 downto 1));

    -- redist81_yAddr_uid155_fpHypot3dTest_b_17_inputreg(DELAY,926)
    redist81_yAddr_uid155_fpHypot3dTest_b_17_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist80_yAddr_uid155_fpHypot3dTest_b_12_q, xout => redist81_yAddr_uid155_fpHypot3dTest_b_17_inputreg_q, clk => clk, aclr => areset );

    -- redist81_yAddr_uid155_fpHypot3dTest_b_17(DELAY,832)
    redist81_yAddr_uid155_fpHypot3dTest_b_17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist81_yAddr_uid155_fpHypot3dTest_b_17_inputreg_q, xout => redist81_yAddr_uid155_fpHypot3dTest_b_17_q, clk => clk, aclr => areset );

    -- memoryC1_uid198_sqrtTables_lutmem(DUALMEM,586)@35 + 2
    -- in j@20000000
    memoryC1_uid198_sqrtTables_lutmem_aa <= redist81_yAddr_uid155_fpHypot3dTest_b_17_q;
    memoryC1_uid198_sqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid198_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC1_uid198_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid198_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid198_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid198_sqrtTables_lutmem_ir
    );
    memoryC1_uid198_sqrtTables_lutmem_r <= memoryC1_uid198_sqrtTables_lutmem_ir(8 downto 0);

    -- redist43_memoryC1_uid198_sqrtTables_lutmem_r_1(DELAY,794)
    redist43_memoryC1_uid198_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC1_uid198_sqrtTables_lutmem_r, xout => redist43_memoryC1_uid198_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC1_uid197_sqrtTables_lutmem(DUALMEM,585)@35 + 2
    -- in j@20000000
    memoryC1_uid197_sqrtTables_lutmem_aa <= redist81_yAddr_uid155_fpHypot3dTest_b_17_q;
    memoryC1_uid197_sqrtTables_lutmem_reset0 <= areset;
    memoryC1_uid197_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC1_uid197_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid197_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid197_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid197_sqrtTables_lutmem_ir
    );
    memoryC1_uid197_sqrtTables_lutmem_r <= memoryC1_uid197_sqrtTables_lutmem_ir(39 downto 0);

    -- redist44_memoryC1_uid197_sqrtTables_lutmem_r_1(DELAY,795)
    redist44_memoryC1_uid197_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 40, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC1_uid197_sqrtTables_lutmem_r, xout => redist44_memoryC1_uid197_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid199_sqrtTables(BITJOIN,198)@38
    os_uid199_sqrtTables_q <= redist43_memoryC1_uid198_sqrtTables_lutmem_r_1_q & redist44_memoryC1_uid197_sqrtTables_lutmem_r_1_q;

    -- s4sumAHighB_uid241_invPolyEval(ADD,240)@38 + 1
    s4sumAHighB_uid241_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => os_uid199_sqrtTables_q(48)) & os_uid199_sqrtTables_q));
    s4sumAHighB_uid241_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 41 => highBBits_uid240_invPolyEval_b(40)) & highBBits_uid240_invPolyEval_b));
    s4sumAHighB_uid241_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s4sumAHighB_uid241_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s4sumAHighB_uid241_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid241_invPolyEval_a) + SIGNED(s4sumAHighB_uid241_invPolyEval_b));
        END IF;
    END PROCESS;
    s4sumAHighB_uid241_invPolyEval_q <= s4sumAHighB_uid241_invPolyEval_o(49 downto 0);

    -- lowRangeB_uid239_invPolyEval(BITSELECT,238)@38
    lowRangeB_uid239_invPolyEval_in <= redist56_os_uid324_pT4_uid238_invPolyEval_b_1_q(0 downto 0);
    lowRangeB_uid239_invPolyEval_b <= lowRangeB_uid239_invPolyEval_in(0 downto 0);

    -- redist62_lowRangeB_uid239_invPolyEval_b_1(DELAY,813)
    redist62_lowRangeB_uid239_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid239_invPolyEval_b, xout => redist62_lowRangeB_uid239_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s4_uid242_invPolyEval(BITJOIN,241)@39
    s4_uid242_invPolyEval_q <= s4sumAHighB_uid241_invPolyEval_q & redist62_lowRangeB_uid239_invPolyEval_b_1_q;

    -- aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval(BITSELECT,343)@39
    aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval_in <= STD_LOGIC_VECTOR(s4_uid242_invPolyEval_q(23 downto 0));
    aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval_in(23 downto 0));

    -- aboveLeftY_mergedSignalTM_uid345_pT5_uid244_invPolyEval(BITJOIN,344)@39
    aboveLeftY_mergedSignalTM_uid345_pT5_uid244_invPolyEval_q <= aboveLeftY_bottomRange_uid344_pT5_uid244_invPolyEval_b & aboveLeftY_bottomExtension_uid308_pT4_uid238_invPolyEval_q;

    -- topRangeY_uid341_pT5_uid244_invPolyEval(BITSELECT,340)@39
    topRangeY_uid341_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(s4_uid242_invPolyEval_q(50 downto 24));

    -- redist54_topRangeY_uid341_pT5_uid244_invPolyEval_b_1(DELAY,805)
    redist54_topRangeY_uid341_pT5_uid244_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeY_uid341_pT5_uid244_invPolyEval_b, xout => redist54_topRangeY_uid341_pT5_uid244_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval(BITSELECT,347)@39
    rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid338_pT5_uid244_invPolyEval_q(18 downto 0));
    rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_in(18 downto 0));

    -- redist53_rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b_1(DELAY,804)
    redist53_rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b, xout => redist53_rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- rightBottomX_mergedSignalTM_uid349_pT5_uid244_invPolyEval(BITJOIN,348)@40
    rightBottomX_mergedSignalTM_uid349_pT5_uid244_invPolyEval_q <= redist53_rightBottomX_bottomRange_uid348_pT5_uid244_invPolyEval_b_1_q & rightBottomX_bottomExtension_uid347_pT5_uid244_invPolyEval_q;

    -- multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma(CHAINMULTADD,727)@39 + 2
    -- in e@40
    -- in g@40
    -- out q@42
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0(0),28));
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0(1),28));
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_l(0) * multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_l(1) * multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_p(0),56);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_p(1),56);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_u(0);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_w(1) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_x(1) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_w(1);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_s(1) + multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_y(1) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_x(1);
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid349_pT5_uid244_invPolyEval_q),27);
                multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid345_pT5_uid244_invPolyEval_q),27);
                multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist54_topRangeY_uid341_pT5_uid244_invPolyEval_b_1_q),27);
                multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid340_pT5_uid244_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_y(0);
                multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_s(1) <= multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_qq(54 downto 0));

    -- redist18_multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q_1(DELAY,769)
    redist18_multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q, xout => redist18_multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- highBBits_uid360_pT5_uid244_invPolyEval(BITSELECT,359)@43
    highBBits_uid360_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(redist18_multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q_1_q(54 downto 23));

    -- redist55_topRangeX_uid340_pT5_uid244_invPolyEval_b_1(DELAY,806)
    redist55_topRangeX_uid340_pT5_uid244_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => topRangeX_uid340_pT5_uid244_invPolyEval_b, xout => redist55_topRangeX_uid340_pT5_uid244_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid354_pT5_uid244_invPolyEval_cma(CHAINMULTADD,712)@40 + 2
    sm0_uid354_pT5_uid244_invPolyEval_cma_reset <= areset;
    sm0_uid354_pT5_uid244_invPolyEval_cma_ena0 <= '1';
    sm0_uid354_pT5_uid244_invPolyEval_cma_ena1 <= sm0_uid354_pT5_uid244_invPolyEval_cma_ena0;
    sm0_uid354_pT5_uid244_invPolyEval_cma_p(0) <= sm0_uid354_pT5_uid244_invPolyEval_cma_a0(0) * sm0_uid354_pT5_uid244_invPolyEval_cma_c0(0);
    sm0_uid354_pT5_uid244_invPolyEval_cma_u(0) <= RESIZE(sm0_uid354_pT5_uid244_invPolyEval_cma_p(0),54);
    sm0_uid354_pT5_uid244_invPolyEval_cma_w(0) <= sm0_uid354_pT5_uid244_invPolyEval_cma_u(0);
    sm0_uid354_pT5_uid244_invPolyEval_cma_x(0) <= sm0_uid354_pT5_uid244_invPolyEval_cma_w(0);
    sm0_uid354_pT5_uid244_invPolyEval_cma_y(0) <= sm0_uid354_pT5_uid244_invPolyEval_cma_x(0);
    sm0_uid354_pT5_uid244_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid354_pT5_uid244_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid354_pT5_uid244_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid354_pT5_uid244_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid354_pT5_uid244_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(redist55_topRangeX_uid340_pT5_uid244_invPolyEval_b_1_q),27);
                sm0_uid354_pT5_uid244_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist54_topRangeY_uid341_pT5_uid244_invPolyEval_b_1_q),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid354_pT5_uid244_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid354_pT5_uid244_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid354_pT5_uid244_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid354_pT5_uid244_invPolyEval_cma_s(0) <= sm0_uid354_pT5_uid244_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid354_pT5_uid244_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid354_pT5_uid244_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid354_pT5_uid244_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid354_pT5_uid244_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid354_pT5_uid244_invPolyEval_cma_qq(53 downto 0));

    -- redist33_sm0_uid354_pT5_uid244_invPolyEval_cma_q_1(DELAY,784)
    redist33_sm0_uid354_pT5_uid244_invPolyEval_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 54, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid354_pT5_uid244_invPolyEval_cma_q, xout => redist33_sm0_uid354_pT5_uid244_invPolyEval_cma_q_1_q, clk => clk, aclr => areset );

    -- aboveLeftY_uid353_pT5_uid244_invPolyEval(BITSELECT,352)@39
    aboveLeftY_uid353_pT5_uid244_invPolyEval_in <= s4_uid242_invPolyEval_q(23 downto 0);
    aboveLeftY_uid353_pT5_uid244_invPolyEval_b <= aboveLeftY_uid353_pT5_uid244_invPolyEval_in(23 downto 22);

    -- redist51_aboveLeftY_uid353_pT5_uid244_invPolyEval_b_1(DELAY,802)
    redist51_aboveLeftY_uid353_pT5_uid244_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftY_uid353_pT5_uid244_invPolyEval_b, xout => redist51_aboveLeftY_uid353_pT5_uid244_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- aboveLeftX_uid352_pT5_uid244_invPolyEval(BITSELECT,351)@39
    aboveLeftX_uid352_pT5_uid244_invPolyEval_in <= nx_mergedSignalTM_uid338_pT5_uid244_invPolyEval_q(18 downto 0);
    aboveLeftX_uid352_pT5_uid244_invPolyEval_b <= aboveLeftX_uid352_pT5_uid244_invPolyEval_in(18 downto 17);

    -- redist52_aboveLeftX_uid352_pT5_uid244_invPolyEval_b_1(DELAY,803)
    redist52_aboveLeftX_uid352_pT5_uid244_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftX_uid352_pT5_uid244_invPolyEval_b, xout => redist52_aboveLeftX_uid352_pT5_uid244_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid357_pT5_uid244_invPolyEval(MULT,356)@40 + 2
    sm0_uid357_pT5_uid244_invPolyEval_pr <= UNSIGNED(sm0_uid357_pT5_uid244_invPolyEval_a0) * UNSIGNED(sm0_uid357_pT5_uid244_invPolyEval_b0);
    sm0_uid357_pT5_uid244_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid357_pT5_uid244_invPolyEval_a0 <= (others => '0');
            sm0_uid357_pT5_uid244_invPolyEval_b0 <= (others => '0');
            sm0_uid357_pT5_uid244_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid357_pT5_uid244_invPolyEval_a0 <= redist52_aboveLeftX_uid352_pT5_uid244_invPolyEval_b_1_q;
            sm0_uid357_pT5_uid244_invPolyEval_b0 <= redist51_aboveLeftY_uid353_pT5_uid244_invPolyEval_b_1_q;
            sm0_uid357_pT5_uid244_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid357_pT5_uid244_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid357_pT5_uid244_invPolyEval_q <= sm0_uid357_pT5_uid244_invPolyEval_s1;

    -- redist50_sm0_uid357_pT5_uid244_invPolyEval_q_1(DELAY,801)
    redist50_sm0_uid357_pT5_uid244_invPolyEval_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sm0_uid357_pT5_uid244_invPolyEval_q, xout => redist50_sm0_uid357_pT5_uid244_invPolyEval_q_1_q, clk => clk, aclr => areset );

    -- sumAb_uid358_pT5_uid244_invPolyEval(BITJOIN,357)@43
    sumAb_uid358_pT5_uid244_invPolyEval_q <= redist33_sm0_uid354_pT5_uid244_invPolyEval_cma_q_1_q & redist50_sm0_uid357_pT5_uid244_invPolyEval_q_1_q;

    -- lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval(ADD,360)@43
    lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => sumAb_uid358_pT5_uid244_invPolyEval_q(57)) & sumAb_uid358_pT5_uid244_invPolyEval_q));
    lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 32 => highBBits_uid360_pT5_uid244_invPolyEval_b(31)) & highBBits_uid360_pT5_uid244_invPolyEval_b));
    lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_b));
    lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_q <= lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid359_pT5_uid244_invPolyEval(BITSELECT,358)@43
    lowRangeB_uid359_pT5_uid244_invPolyEval_in <= redist18_multSumOfTwoTS_uid355_pT5_uid244_invPolyEval_cma_q_1_q(22 downto 0);
    lowRangeB_uid359_pT5_uid244_invPolyEval_b <= lowRangeB_uid359_pT5_uid244_invPolyEval_in(22 downto 0);

    -- lev1_a0_uid362_pT5_uid244_invPolyEval(BITJOIN,361)@43
    lev1_a0_uid362_pT5_uid244_invPolyEval_q <= lev1_a0sumAHighB_uid361_pT5_uid244_invPolyEval_q & lowRangeB_uid359_pT5_uid244_invPolyEval_b;

    -- os_uid363_pT5_uid244_invPolyEval(BITSELECT,362)@43
    os_uid363_pT5_uid244_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid362_pT5_uid244_invPolyEval_q(79 downto 0));
    os_uid363_pT5_uid244_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid363_pT5_uid244_invPolyEval_in(79 downto 28));

    -- highBBits_uid246_invPolyEval(BITSELECT,245)@43
    highBBits_uid246_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid363_pT5_uid244_invPolyEval_b(51 downto 2));

    -- redist60_highBBits_uid246_invPolyEval_b_1(DELAY,811)
    redist60_highBBits_uid246_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 50, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highBBits_uid246_invPolyEval_b, xout => redist60_highBBits_uid246_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- redist82_yAddr_uid155_fpHypot3dTest_b_23_inputreg(DELAY,927)
    redist82_yAddr_uid155_fpHypot3dTest_b_23_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist81_yAddr_uid155_fpHypot3dTest_b_17_q, xout => redist82_yAddr_uid155_fpHypot3dTest_b_23_inputreg_q, clk => clk, aclr => areset );

    -- redist82_yAddr_uid155_fpHypot3dTest_b_23(DELAY,833)
    redist82_yAddr_uid155_fpHypot3dTest_b_23 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist82_yAddr_uid155_fpHypot3dTest_b_23_inputreg_q, xout => redist82_yAddr_uid155_fpHypot3dTest_b_23_q, clk => clk, aclr => areset );

    -- redist82_yAddr_uid155_fpHypot3dTest_b_23_outputreg(DELAY,928)
    redist82_yAddr_uid155_fpHypot3dTest_b_23_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist82_yAddr_uid155_fpHypot3dTest_b_23_q, xout => redist82_yAddr_uid155_fpHypot3dTest_b_23_outputreg_q, clk => clk, aclr => areset );

    -- memoryC0_uid194_sqrtTables_lutmem(DUALMEM,584)@41 + 2
    -- in j@20000000
    memoryC0_uid194_sqrtTables_lutmem_aa <= redist82_yAddr_uid155_fpHypot3dTest_b_23_outputreg_q;
    memoryC0_uid194_sqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid194_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC0_uid194_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid194_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid194_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid194_sqrtTables_lutmem_ir
    );
    memoryC0_uid194_sqrtTables_lutmem_r <= memoryC0_uid194_sqrtTables_lutmem_ir(16 downto 0);

    -- redist45_memoryC0_uid194_sqrtTables_lutmem_r_1(DELAY,796)
    redist45_memoryC0_uid194_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid194_sqrtTables_lutmem_r, xout => redist45_memoryC0_uid194_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid193_sqrtTables_lutmem(DUALMEM,583)@41 + 2
    -- in j@20000000
    memoryC0_uid193_sqrtTables_lutmem_aa <= redist82_yAddr_uid155_fpHypot3dTest_b_23_outputreg_q;
    memoryC0_uid193_sqrtTables_lutmem_reset0 <= areset;
    memoryC0_uid193_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "threeDHyp_0002_memoryC0_uid193_sqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid193_sqrtTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid193_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid193_sqrtTables_lutmem_ir
    );
    memoryC0_uid193_sqrtTables_lutmem_r <= memoryC0_uid193_sqrtTables_lutmem_ir(39 downto 0);

    -- redist46_memoryC0_uid193_sqrtTables_lutmem_r_1(DELAY,797)
    redist46_memoryC0_uid193_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 40, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid193_sqrtTables_lutmem_r, xout => redist46_memoryC0_uid193_sqrtTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid195_sqrtTables(BITJOIN,194)@44
    os_uid195_sqrtTables_q <= redist45_memoryC0_uid194_sqrtTables_lutmem_r_1_q & redist46_memoryC0_uid193_sqrtTables_lutmem_r_1_q;

    -- s5sumAHighB_uid247_invPolyEval(ADD,246)@44
    s5sumAHighB_uid247_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((57 downto 57 => os_uid195_sqrtTables_q(56)) & os_uid195_sqrtTables_q));
    s5sumAHighB_uid247_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((57 downto 50 => redist60_highBBits_uid246_invPolyEval_b_1_q(49)) & redist60_highBBits_uid246_invPolyEval_b_1_q));
    s5sumAHighB_uid247_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s5sumAHighB_uid247_invPolyEval_a) + SIGNED(s5sumAHighB_uid247_invPolyEval_b));
    s5sumAHighB_uid247_invPolyEval_q <= s5sumAHighB_uid247_invPolyEval_o(57 downto 0);

    -- lowRangeB_uid245_invPolyEval(BITSELECT,244)@43
    lowRangeB_uid245_invPolyEval_in <= os_uid363_pT5_uid244_invPolyEval_b(1 downto 0);
    lowRangeB_uid245_invPolyEval_b <= lowRangeB_uid245_invPolyEval_in(1 downto 0);

    -- redist61_lowRangeB_uid245_invPolyEval_b_1(DELAY,812)
    redist61_lowRangeB_uid245_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid245_invPolyEval_b, xout => redist61_lowRangeB_uid245_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s5_uid248_invPolyEval(BITJOIN,247)@44
    s5_uid248_invPolyEval_q <= s5sumAHighB_uid247_invPolyEval_q & redist61_lowRangeB_uid245_invPolyEval_b_1_q;

    -- fracRPreInc_uid158_fpHypot3dTest(BITSELECT,157)@44
    fracRPreInc_uid158_fpHypot3dTest_in <= s5_uid248_invPolyEval_q(58 downto 0);
    fracRPreInc_uid158_fpHypot3dTest_b <= fracRPreInc_uid158_fpHypot3dTest_in(58 downto 4);

    -- redist72_fracRPreInc_uid158_fpHypot3dTest_b_1(DELAY,823)
    redist72_fracRPreInc_uid158_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 55, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreInc_uid158_fpHypot3dTest_b, xout => redist72_fracRPreInc_uid158_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPostInc_uid161_fpHypot3dTest(ADD,160)@45
    fracRPostInc_uid161_fpHypot3dTest_a <= STD_LOGIC_VECTOR("0" & redist72_fracRPreInc_uid158_fpHypot3dTest_b_1_q);
    fracRPostInc_uid161_fpHypot3dTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000000" & VCC_q);
    fracRPostInc_uid161_fpHypot3dTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPostInc_uid161_fpHypot3dTest_a) + UNSIGNED(fracRPostInc_uid161_fpHypot3dTest_b));
    fracRPostInc_uid161_fpHypot3dTest_q <= fracRPostInc_uid161_fpHypot3dTest_o(55 downto 0);

    -- fracRPostIncMSBU_uid163_fpHypot3dTest(BITSELECT,162)@45
    fracRPostIncMSBU_uid163_fpHypot3dTest_in <= STD_LOGIC_VECTOR(fracRPostInc_uid161_fpHypot3dTest_q(54 downto 0));
    fracRPostIncMSBU_uid163_fpHypot3dTest_b <= STD_LOGIC_VECTOR(fracRPostIncMSBU_uid163_fpHypot3dTest_in(54 downto 54));

    -- redist70_fracRPostIncMSBU_uid163_fpHypot3dTest_b_1(DELAY,821)
    redist70_fracRPostIncMSBU_uid163_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostIncMSBU_uid163_fpHypot3dTest_b, xout => redist70_fracRPostIncMSBU_uid163_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_notEnable(LOGICAL,937)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_nor(LOGICAL,938)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_nor_q <= not (redist83_expRMux_uid152_fpHypot3dTest_q_27_notEnable_q or redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_q);

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_last(CONSTANT,934)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_last_q <= "010101";

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp(LOGICAL,935)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp_b <= STD_LOGIC_VECTOR("0" & redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_q);
    redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp_q <= "1" WHEN redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_last_q = redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp_b ELSE "0";

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_cmpReg(REG,936)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist83_expRMux_uid152_fpHypot3dTest_q_27_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist83_expRMux_uid152_fpHypot3dTest_q_27_cmpReg_q <= STD_LOGIC_VECTOR(redist83_expRMux_uid152_fpHypot3dTest_q_27_cmp_q);
        END IF;
    END PROCESS;

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena(REG,939)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist83_expRMux_uid152_fpHypot3dTest_q_27_nor_q = "1") THEN
                redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_q <= STD_LOGIC_VECTOR(redist83_expRMux_uid152_fpHypot3dTest_q_27_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_enaAnd(LOGICAL,940)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_enaAnd_q <= redist83_expRMux_uid152_fpHypot3dTest_q_27_sticky_ena_q and VCC_q;

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt(COUNTER,932)
    -- low=0, high=22, step=1, init=0
    redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i = TO_UNSIGNED(21, 5)) THEN
                redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_eq <= '1';
            ELSE
                redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_eq <= '0';
            END IF;
            IF (redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_eq = '1') THEN
                redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i <= redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i + 10;
            ELSE
                redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i <= redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_i, 5)));

    -- biasP1Signal_uid146_fpHypot3dTest(CONSTANT,145)
    biasP1Signal_uid146_fpHypot3dTest_q <= "1111111110";

    -- expOddSig_uid147_fpHypot3dTest(ADD,146)@18
    expOddSig_uid147_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q(12)) & redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q));
    expOddSig_uid147_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & biasP1Signal_uid146_fpHypot3dTest_q));
    expOddSig_uid147_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(expOddSig_uid147_fpHypot3dTest_a) + SIGNED(expOddSig_uid147_fpHypot3dTest_b));
    expOddSig_uid147_fpHypot3dTest_q <= expOddSig_uid147_fpHypot3dTest_o(13 downto 0);

    -- expROdd_uid148_fpHypot3dTest(BITSELECT,147)@18
    expROdd_uid148_fpHypot3dTest_b <= STD_LOGIC_VECTOR(expOddSig_uid147_fpHypot3dTest_q(13 downto 1));

    -- redist85_expROdd_uid148_fpHypot3dTest_b_1(DELAY,836)
    redist85_expROdd_uid148_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expROdd_uid148_fpHypot3dTest_b, xout => redist85_expROdd_uid148_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- expSumOfSquaresUnbiased_uid144_fpHypot3dTest(ADD,143)@18
    expSumOfSquaresUnbiased_uid144_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q(12)) & redist87_expRPreSqrt_uid143_fpHypot3dTest_b_1_q));
    expSumOfSquaresUnbiased_uid144_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & bias_uid61_fpHypot3dTest_q));
    expSumOfSquaresUnbiased_uid144_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumOfSquaresUnbiased_uid144_fpHypot3dTest_a) + SIGNED(expSumOfSquaresUnbiased_uid144_fpHypot3dTest_b));
    expSumOfSquaresUnbiased_uid144_fpHypot3dTest_q <= expSumOfSquaresUnbiased_uid144_fpHypot3dTest_o(13 downto 0);

    -- expREven_uid145_fpHypot3dTest(BITSELECT,144)@18
    expREven_uid145_fpHypot3dTest_b <= STD_LOGIC_VECTOR(expSumOfSquaresUnbiased_uid144_fpHypot3dTest_q(13 downto 1));

    -- redist86_expREven_uid145_fpHypot3dTest_b_1(DELAY,837)
    redist86_expREven_uid145_fpHypot3dTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expREven_uid145_fpHypot3dTest_b, xout => redist86_expREven_uid145_fpHypot3dTest_b_1_q, clk => clk, aclr => areset );

    -- redist84_expOddSelect_uid151_fpHypot3dTest_q_1(DELAY,835)
    redist84_expOddSelect_uid151_fpHypot3dTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expOddSelect_uid151_fpHypot3dTest_q, xout => redist84_expOddSelect_uid151_fpHypot3dTest_q_1_q, clk => clk, aclr => areset );

    -- expRMux_uid152_fpHypot3dTest(MUX,151)@19 + 1
    expRMux_uid152_fpHypot3dTest_s <= redist84_expOddSelect_uid151_fpHypot3dTest_q_1_q;
    expRMux_uid152_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid152_fpHypot3dTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRMux_uid152_fpHypot3dTest_s) IS
                WHEN "0" => expRMux_uid152_fpHypot3dTest_q <= redist86_expREven_uid145_fpHypot3dTest_b_1_q;
                WHEN "1" => expRMux_uid152_fpHypot3dTest_q <= redist85_expROdd_uid148_fpHypot3dTest_b_1_q;
                WHEN OTHERS => expRMux_uid152_fpHypot3dTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_inputreg(DELAY,929)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRMux_uid152_fpHypot3dTest_q, xout => redist83_expRMux_uid152_fpHypot3dTest_q_27_inputreg_q, clk => clk, aclr => areset );

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_wraddr(REG,933)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist83_expRMux_uid152_fpHypot3dTest_q_27_wraddr_q <= "10110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist83_expRMux_uid152_fpHypot3dTest_q_27_wraddr_q <= STD_LOGIC_VECTOR(redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_mem(DUALMEM,931)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_ia <= STD_LOGIC_VECTOR(redist83_expRMux_uid152_fpHypot3dTest_q_27_inputreg_q);
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_aa <= redist83_expRMux_uid152_fpHypot3dTest_q_27_wraddr_q;
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_ab <= redist83_expRMux_uid152_fpHypot3dTest_q_27_rdcnt_q;
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_reset0 <= areset;
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 13,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 13,
        widthad_b => 5,
        numwords_b => 23,
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
        clocken1 => redist83_expRMux_uid152_fpHypot3dTest_q_27_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_reset0,
        clock1 => clk,
        address_a => redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_aa,
        data_a => redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_ab,
        q_b => redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_iq
    );
    redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_q <= redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_iq(12 downto 0);

    -- redist83_expRMux_uid152_fpHypot3dTest_q_27_outputreg(DELAY,930)
    redist83_expRMux_uid152_fpHypot3dTest_q_27_outputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist83_expRMux_uid152_fpHypot3dTest_q_27_mem_q, xout => redist83_expRMux_uid152_fpHypot3dTest_q_27_outputreg_q, clk => clk, aclr => areset );

    -- expRPostInc_uid164_fpHypot3dTest(ADD,163)@46 + 1
    expRPostInc_uid164_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => redist83_expRMux_uid152_fpHypot3dTest_q_27_outputreg_q(12)) & redist83_expRMux_uid152_fpHypot3dTest_q_27_outputreg_q));
    expRPostInc_uid164_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & redist70_fracRPostIncMSBU_uid163_fpHypot3dTest_b_1_q));
    expRPostInc_uid164_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostInc_uid164_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expRPostInc_uid164_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostInc_uid164_fpHypot3dTest_a) + SIGNED(expRPostInc_uid164_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    expRPostInc_uid164_fpHypot3dTest_q <= expRPostInc_uid164_fpHypot3dTest_o(13 downto 0);

    -- expRPreExc_uid188_fpHypot3dTest(BITSELECT,187)@47
    expRPreExc_uid188_fpHypot3dTest_in <= expRPostInc_uid164_fpHypot3dTest_q(10 downto 0);
    expRPreExc_uid188_fpHypot3dTest_b <= expRPreExc_uid188_fpHypot3dTest_in(10 downto 0);

    -- redist66_expRPreExc_uid188_fpHypot3dTest_b_2(DELAY,817)
    redist66_expRPreExc_uid188_fpHypot3dTest_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid188_fpHypot3dTest_b, xout => redist66_expRPreExc_uid188_fpHypot3dTest_b_2_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid14_fpHypot3dTest(CONSTANT,13)
    cstAllZWE_uid14_fpHypot3dTest_q <= "00000000000";

    -- c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select(BITSELECT,731)
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b <= cstZeroWF_uid13_fpHypot3dTest_q(5 downto 0);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c <= cstZeroWF_uid13_fpHypot3dTest_q(11 downto 6);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d <= cstZeroWF_uid13_fpHypot3dTest_q(17 downto 12);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e <= cstZeroWF_uid13_fpHypot3dTest_q(23 downto 18);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f <= cstZeroWF_uid13_fpHypot3dTest_q(29 downto 24);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g <= cstZeroWF_uid13_fpHypot3dTest_q(35 downto 30);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h <= cstZeroWF_uid13_fpHypot3dTest_q(41 downto 36);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i <= cstZeroWF_uid13_fpHypot3dTest_q(47 downto 42);
    c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j <= cstZeroWF_uid13_fpHypot3dTest_q(51 downto 48);

    -- z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select(BITSELECT,750)@0
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_b <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(5 downto 0);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_c <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(11 downto 6);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_d <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(17 downto 12);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_e <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(23 downto 18);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_f <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(29 downto 24);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_g <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(35 downto 30);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_h <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(41 downto 36);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_i <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(47 downto 42);
    z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_j <= expZ_uid8_fpHypot3dTest_merged_bit_select_c(51 downto 48);

    -- eq8_uid451_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,450)@0
    eq8_uid451_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_j = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j ELSE "0";

    -- eq7_uid448_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,447)@0
    eq7_uid448_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_i = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i ELSE "0";

    -- eq6_uid445_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,444)@0
    eq6_uid445_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_h = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,452)@0 + 1
    and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_qi <= eq6_uid445_fracXIsZero_uid47_fpHypot3dTest_q and eq7_uid448_fracXIsZero_uid47_fpHypot3dTest_q and eq8_uid451_fracXIsZero_uid47_fpHypot3dTest_q;
    and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_qi, xout => and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- eq5_uid442_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,441)@0
    eq5_uid442_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_g = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g ELSE "0";

    -- eq4_uid439_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,438)@0
    eq4_uid439_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_f = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f ELSE "0";

    -- eq3_uid436_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,435)@0
    eq3_uid436_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_e = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e ELSE "0";

    -- eq2_uid433_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,432)@0
    eq2_uid433_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_d = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d ELSE "0";

    -- eq1_uid430_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,429)@0
    eq1_uid430_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_c = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c ELSE "0";

    -- eq0_uid427_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,426)@0
    eq0_uid427_fracXIsZero_uid47_fpHypot3dTest_q <= "1" WHEN z0_uid425_fracXIsZero_uid47_fpHypot3dTest_merged_bit_select_b = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,451)@0 + 1
    and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_qi <= eq0_uid427_fracXIsZero_uid47_fpHypot3dTest_q and eq1_uid430_fracXIsZero_uid47_fpHypot3dTest_q and eq2_uid433_fracXIsZero_uid47_fpHypot3dTest_q and eq3_uid436_fracXIsZero_uid47_fpHypot3dTest_q and eq4_uid439_fracXIsZero_uid47_fpHypot3dTest_q and eq5_uid442_fracXIsZero_uid47_fpHypot3dTest_q;
    and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_qi, xout => and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest(LOGICAL,453)@1 + 1
    and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_qi <= and_lev0_uid452_fracXIsZero_uid47_fpHypot3dTest_q and and_lev0_uid453_fracXIsZero_uid47_fpHypot3dTest_q;
    and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_qi, xout => and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist47_and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q_6(DELAY,798)
    redist47_and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q, xout => redist47_and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q_6_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid48_fpHypot3dTest(LOGICAL,47)@7
    fracXIsNotZero_uid48_fpHypot3dTest_q <= not (redist47_and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q_6_q);

    -- expXIsMax_uid46_fpHypot3dTest(LOGICAL,45)@6 + 1
    expXIsMax_uid46_fpHypot3dTest_qi <= "1" WHEN redist15_expZ_uid8_fpHypot3dTest_merged_bit_select_b_6_outputreg_q = cstAllOWE_uid12_fpHypot3dTest_q ELSE "0";
    expXIsMax_uid46_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid46_fpHypot3dTest_qi, xout => expXIsMax_uid46_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- excN_z_uid50_fpHypot3dTest(LOGICAL,49)@7 + 1
    excN_z_uid50_fpHypot3dTest_qi <= expXIsMax_uid46_fpHypot3dTest_q and fracXIsNotZero_uid48_fpHypot3dTest_q;
    excN_z_uid50_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_z_uid50_fpHypot3dTest_qi, xout => excN_z_uid50_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist103_excN_z_uid50_fpHypot3dTest_q_41(DELAY,854)
    redist103_excN_z_uid50_fpHypot3dTest_q_41 : dspba_delay
    GENERIC MAP ( width => 1, depth => 40, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_z_uid50_fpHypot3dTest_q, xout => redist103_excN_z_uid50_fpHypot3dTest_q_41_q, clk => clk, aclr => areset );

    -- z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select(BITSELECT,749)@0
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_b <= expY_uid7_fpHypot3dTest_merged_bit_select_c(5 downto 0);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_c <= expY_uid7_fpHypot3dTest_merged_bit_select_c(11 downto 6);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_d <= expY_uid7_fpHypot3dTest_merged_bit_select_c(17 downto 12);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_e <= expY_uid7_fpHypot3dTest_merged_bit_select_c(23 downto 18);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_f <= expY_uid7_fpHypot3dTest_merged_bit_select_c(29 downto 24);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_g <= expY_uid7_fpHypot3dTest_merged_bit_select_c(35 downto 30);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_h <= expY_uid7_fpHypot3dTest_merged_bit_select_c(41 downto 36);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_i <= expY_uid7_fpHypot3dTest_merged_bit_select_c(47 downto 42);
    z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_j <= expY_uid7_fpHypot3dTest_merged_bit_select_c(51 downto 48);

    -- eq8_uid421_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,420)@0
    eq8_uid421_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_j = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j ELSE "0";

    -- eq7_uid418_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,417)@0
    eq7_uid418_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_i = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i ELSE "0";

    -- eq6_uid415_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,414)@0
    eq6_uid415_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_h = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,422)@0 + 1
    and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_qi <= eq6_uid415_fracXIsZero_uid33_fpHypot3dTest_q and eq7_uid418_fracXIsZero_uid33_fpHypot3dTest_q and eq8_uid421_fracXIsZero_uid33_fpHypot3dTest_q;
    and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_qi, xout => and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- eq5_uid412_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,411)@0
    eq5_uid412_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_g = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g ELSE "0";

    -- eq4_uid409_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,408)@0
    eq4_uid409_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_f = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f ELSE "0";

    -- eq3_uid406_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,405)@0
    eq3_uid406_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_e = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e ELSE "0";

    -- eq2_uid403_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,402)@0
    eq2_uid403_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_d = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d ELSE "0";

    -- eq1_uid400_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,399)@0
    eq1_uid400_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_c = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c ELSE "0";

    -- eq0_uid397_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,396)@0
    eq0_uid397_fracXIsZero_uid33_fpHypot3dTest_q <= "1" WHEN z0_uid395_fracXIsZero_uid33_fpHypot3dTest_merged_bit_select_b = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,421)@0 + 1
    and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_qi <= eq0_uid397_fracXIsZero_uid33_fpHypot3dTest_q and eq1_uid400_fracXIsZero_uid33_fpHypot3dTest_q and eq2_uid403_fracXIsZero_uid33_fpHypot3dTest_q and eq3_uid406_fracXIsZero_uid33_fpHypot3dTest_q and eq4_uid409_fracXIsZero_uid33_fpHypot3dTest_q and eq5_uid412_fracXIsZero_uid33_fpHypot3dTest_q;
    and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_qi, xout => and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest(LOGICAL,423)@1 + 1
    and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_qi <= and_lev0_uid422_fracXIsZero_uid33_fpHypot3dTest_q and and_lev0_uid423_fracXIsZero_uid33_fpHypot3dTest_q;
    and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_qi, xout => and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist48_and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q_6(DELAY,799)
    redist48_and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q, xout => redist48_and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q_6_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid34_fpHypot3dTest(LOGICAL,33)@7
    fracXIsNotZero_uid34_fpHypot3dTest_q <= not (redist48_and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q_6_q);

    -- expXIsMax_uid32_fpHypot3dTest(LOGICAL,31)@6 + 1
    expXIsMax_uid32_fpHypot3dTest_qi <= "1" WHEN redist16_expY_uid7_fpHypot3dTest_merged_bit_select_b_6_outputreg_q = cstAllOWE_uid12_fpHypot3dTest_q ELSE "0";
    expXIsMax_uid32_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid32_fpHypot3dTest_qi, xout => expXIsMax_uid32_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- excN_y_uid36_fpHypot3dTest(LOGICAL,35)@7 + 1
    excN_y_uid36_fpHypot3dTest_qi <= expXIsMax_uid32_fpHypot3dTest_q and fracXIsNotZero_uid34_fpHypot3dTest_q;
    excN_y_uid36_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid36_fpHypot3dTest_qi, xout => excN_y_uid36_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist106_excN_y_uid36_fpHypot3dTest_q_41(DELAY,857)
    redist106_excN_y_uid36_fpHypot3dTest_q_41 : dspba_delay
    GENERIC MAP ( width => 1, depth => 40, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid36_fpHypot3dTest_q, xout => redist106_excN_y_uid36_fpHypot3dTest_q_41_q, clk => clk, aclr => areset );

    -- z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select(BITSELECT,748)@0
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b <= expX_uid6_fpHypot3dTest_merged_bit_select_c(5 downto 0);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c <= expX_uid6_fpHypot3dTest_merged_bit_select_c(11 downto 6);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d <= expX_uid6_fpHypot3dTest_merged_bit_select_c(17 downto 12);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e <= expX_uid6_fpHypot3dTest_merged_bit_select_c(23 downto 18);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f <= expX_uid6_fpHypot3dTest_merged_bit_select_c(29 downto 24);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g <= expX_uid6_fpHypot3dTest_merged_bit_select_c(35 downto 30);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h <= expX_uid6_fpHypot3dTest_merged_bit_select_c(41 downto 36);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i <= expX_uid6_fpHypot3dTest_merged_bit_select_c(47 downto 42);
    z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j <= expX_uid6_fpHypot3dTest_merged_bit_select_c(51 downto 48);

    -- eq8_uid391_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,390)@0
    eq8_uid391_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_j ELSE "0";

    -- eq7_uid388_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,387)@0
    eq7_uid388_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_i ELSE "0";

    -- eq6_uid385_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,384)@0
    eq6_uid385_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_h ELSE "0";

    -- and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,392)@0 + 1
    and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_qi <= eq6_uid385_fracXIsZero_uid19_fpHypot3dTest_q and eq7_uid388_fracXIsZero_uid19_fpHypot3dTest_q and eq8_uid391_fracXIsZero_uid19_fpHypot3dTest_q;
    and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_qi, xout => and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- eq5_uid382_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,381)@0
    eq5_uid382_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_g ELSE "0";

    -- eq4_uid379_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,378)@0
    eq4_uid379_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_f ELSE "0";

    -- eq3_uid376_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,375)@0
    eq3_uid376_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_e ELSE "0";

    -- eq2_uid373_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,372)@0
    eq2_uid373_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_d ELSE "0";

    -- eq1_uid370_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,369)@0
    eq1_uid370_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_c ELSE "0";

    -- eq0_uid367_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,366)@0
    eq0_uid367_fracXIsZero_uid19_fpHypot3dTest_q <= "1" WHEN z0_uid365_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b = c0_uid366_fracXIsZero_uid19_fpHypot3dTest_merged_bit_select_b ELSE "0";

    -- and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,391)@0 + 1
    and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_qi <= eq0_uid367_fracXIsZero_uid19_fpHypot3dTest_q and eq1_uid370_fracXIsZero_uid19_fpHypot3dTest_q and eq2_uid373_fracXIsZero_uid19_fpHypot3dTest_q and eq3_uid376_fracXIsZero_uid19_fpHypot3dTest_q and eq4_uid379_fracXIsZero_uid19_fpHypot3dTest_q and eq5_uid382_fracXIsZero_uid19_fpHypot3dTest_q;
    and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_qi, xout => and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest(LOGICAL,393)@1 + 1
    and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_qi <= and_lev0_uid392_fracXIsZero_uid19_fpHypot3dTest_q and and_lev0_uid393_fracXIsZero_uid19_fpHypot3dTest_q;
    and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_qi, xout => and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist49_and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q_6(DELAY,800)
    redist49_and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q, xout => redist49_and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q_6_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid20_fpHypot3dTest(LOGICAL,19)@7
    fracXIsNotZero_uid20_fpHypot3dTest_q <= not (redist49_and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q_6_q);

    -- expXIsMax_uid18_fpHypot3dTest(LOGICAL,17)@6 + 1
    expXIsMax_uid18_fpHypot3dTest_qi <= "1" WHEN redist17_expX_uid6_fpHypot3dTest_merged_bit_select_b_6_outputreg_q = cstAllOWE_uid12_fpHypot3dTest_q ELSE "0";
    expXIsMax_uid18_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid18_fpHypot3dTest_qi, xout => expXIsMax_uid18_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- excN_x_uid22_fpHypot3dTest(LOGICAL,21)@7 + 1
    excN_x_uid22_fpHypot3dTest_qi <= expXIsMax_uid18_fpHypot3dTest_q and fracXIsNotZero_uid20_fpHypot3dTest_q;
    excN_x_uid22_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid22_fpHypot3dTest_qi, xout => excN_x_uid22_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist109_excN_x_uid22_fpHypot3dTest_q_41(DELAY,860)
    redist109_excN_x_uid22_fpHypot3dTest_q_41 : dspba_delay
    GENERIC MAP ( width => 1, depth => 40, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid22_fpHypot3dTest_q, xout => redist109_excN_x_uid22_fpHypot3dTest_q_41_q, clk => clk, aclr => areset );

    -- excRNaN_uid178_fpHypot3dTest(LOGICAL,177)@48
    excRNaN_uid178_fpHypot3dTest_q <= redist109_excN_x_uid22_fpHypot3dTest_q_41_q or redist106_excN_y_uid36_fpHypot3dTest_q_41_q or redist103_excN_z_uid50_fpHypot3dTest_q_41_q;

    -- sqrtOverflow_uid167_fpHypot3dTest(COMPARE,166)@47 + 1
    sqrtOverflow_uid167_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRPostInc_uid164_fpHypot3dTest_q(13)) & expRPostInc_uid164_fpHypot3dTest_q));
    sqrtOverflow_uid167_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid12_fpHypot3dTest_q));
    sqrtOverflow_uid167_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sqrtOverflow_uid167_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sqrtOverflow_uid167_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(sqrtOverflow_uid167_fpHypot3dTest_a) - SIGNED(sqrtOverflow_uid167_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    sqrtOverflow_uid167_fpHypot3dTest_n(0) <= not (sqrtOverflow_uid167_fpHypot3dTest_o(15));

    -- invExcZN_uid174_fpHypot3dTest(LOGICAL,173)@48
    invExcZN_uid174_fpHypot3dTest_q <= not (redist103_excN_z_uid50_fpHypot3dTest_q_41_q);

    -- invExcYN_uid175_fpHypot3dTest(LOGICAL,174)@48
    invExcYN_uid175_fpHypot3dTest_q <= not (redist106_excN_y_uid36_fpHypot3dTest_q_41_q);

    -- invExcXN_uid176_fpHypot3dTest(LOGICAL,175)@48
    invExcXN_uid176_fpHypot3dTest_q <= not (redist109_excN_x_uid22_fpHypot3dTest_q_41_q);

    -- excRInf_uid177_fpHypot3dTest(LOGICAL,176)@48
    excRInf_uid177_fpHypot3dTest_q <= invExcXN_uid176_fpHypot3dTest_q and invExcYN_uid175_fpHypot3dTest_q and invExcZN_uid174_fpHypot3dTest_q and sqrtOverflow_uid167_fpHypot3dTest_n;

    -- excI_z_uid49_fpHypot3dTest(LOGICAL,48)@7
    excI_z_uid49_fpHypot3dTest_q <= expXIsMax_uid46_fpHypot3dTest_q and redist47_and_lev1_uid454_fracXIsZero_uid47_fpHypot3dTest_q_6_q;

    -- excI_y_uid35_fpHypot3dTest(LOGICAL,34)@7
    excI_y_uid35_fpHypot3dTest_q <= expXIsMax_uid32_fpHypot3dTest_q and redist48_and_lev1_uid424_fracXIsZero_uid33_fpHypot3dTest_q_6_q;

    -- excI_x_uid21_fpHypot3dTest(LOGICAL,20)@7
    excI_x_uid21_fpHypot3dTest_q <= expXIsMax_uid18_fpHypot3dTest_q and redist49_and_lev1_uid394_fracXIsZero_uid19_fpHypot3dTest_q_6_q;

    -- oneIsInf_uid169_fpHypot3dTest(LOGICAL,168)@7 + 1
    oneIsInf_uid169_fpHypot3dTest_qi <= excI_x_uid21_fpHypot3dTest_q or excI_y_uid35_fpHypot3dTest_q or excI_z_uid49_fpHypot3dTest_q;
    oneIsInf_uid169_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInf_uid169_fpHypot3dTest_qi, xout => oneIsInf_uid169_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist68_oneIsInf_uid169_fpHypot3dTest_q_41(DELAY,819)
    redist68_oneIsInf_uid169_fpHypot3dTest_q_41 : dspba_delay
    GENERIC MAP ( width => 1, depth => 40, reset_kind => "ASYNC" )
    PORT MAP ( xin => oneIsInf_uid169_fpHypot3dTest_q, xout => redist68_oneIsInf_uid169_fpHypot3dTest_q_41_q, clk => clk, aclr => areset );

    -- noneInf_uid170_fpHypot3dTest(LOGICAL,169)@48
    noneInf_uid170_fpHypot3dTest_q <= not (redist68_oneIsInf_uid169_fpHypot3dTest_q_41_q);

    -- invExpXIsMax_uid51_fpHypot3dTest(LOGICAL,50)@7
    invExpXIsMax_uid51_fpHypot3dTest_q <= not (expXIsMax_uid46_fpHypot3dTest_q);

    -- InvExpXIsZero_uid52_fpHypot3dTest(LOGICAL,51)@7
    InvExpXIsZero_uid52_fpHypot3dTest_q <= not (excZ_z_uid45_fpHypot3dTest_q);

    -- excR_z_uid53_fpHypot3dTest(LOGICAL,52)@7
    excR_z_uid53_fpHypot3dTest_q <= InvExpXIsZero_uid52_fpHypot3dTest_q and invExpXIsMax_uid51_fpHypot3dTest_q;

    -- invExpXIsMax_uid37_fpHypot3dTest(LOGICAL,36)@7
    invExpXIsMax_uid37_fpHypot3dTest_q <= not (expXIsMax_uid32_fpHypot3dTest_q);

    -- InvExpXIsZero_uid38_fpHypot3dTest(LOGICAL,37)@7
    InvExpXIsZero_uid38_fpHypot3dTest_q <= not (excZ_y_uid31_fpHypot3dTest_q);

    -- excR_y_uid39_fpHypot3dTest(LOGICAL,38)@7
    excR_y_uid39_fpHypot3dTest_q <= InvExpXIsZero_uid38_fpHypot3dTest_q and invExpXIsMax_uid37_fpHypot3dTest_q;

    -- invExpXIsMax_uid23_fpHypot3dTest(LOGICAL,22)@7
    invExpXIsMax_uid23_fpHypot3dTest_q <= not (expXIsMax_uid18_fpHypot3dTest_q);

    -- InvExpXIsZero_uid24_fpHypot3dTest(LOGICAL,23)@7
    InvExpXIsZero_uid24_fpHypot3dTest_q <= not (excZ_x_uid17_fpHypot3dTest_q);

    -- excR_x_uid25_fpHypot3dTest(LOGICAL,24)@7
    excR_x_uid25_fpHypot3dTest_q <= InvExpXIsZero_uid24_fpHypot3dTest_q and invExpXIsMax_uid23_fpHypot3dTest_q;

    -- onIsReg_uid171_fpHypot3dTest(LOGICAL,170)@7 + 1
    onIsReg_uid171_fpHypot3dTest_qi <= excR_x_uid25_fpHypot3dTest_q or excR_y_uid39_fpHypot3dTest_q or excR_z_uid53_fpHypot3dTest_q;
    onIsReg_uid171_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => onIsReg_uid171_fpHypot3dTest_qi, xout => onIsReg_uid171_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist67_onIsReg_uid171_fpHypot3dTest_q_41(DELAY,818)
    redist67_onIsReg_uid171_fpHypot3dTest_q_41 : dspba_delay
    GENERIC MAP ( width => 1, depth => 40, reset_kind => "ASYNC" )
    PORT MAP ( xin => onIsReg_uid171_fpHypot3dTest_q, xout => redist67_onIsReg_uid171_fpHypot3dTest_q_41_q, clk => clk, aclr => areset );

    -- sqrtUnderflow_uid165_fpHypot3dTest(COMPARE,164)@47 + 1
    sqrtUnderflow_uid165_fpHypot3dTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & GND_q));
    sqrtUnderflow_uid165_fpHypot3dTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRPostInc_uid164_fpHypot3dTest_q(13)) & expRPostInc_uid164_fpHypot3dTest_q));
    sqrtUnderflow_uid165_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sqrtUnderflow_uid165_fpHypot3dTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sqrtUnderflow_uid165_fpHypot3dTest_o <= STD_LOGIC_VECTOR(SIGNED(sqrtUnderflow_uid165_fpHypot3dTest_a) - SIGNED(sqrtUnderflow_uid165_fpHypot3dTest_b));
        END IF;
    END PROCESS;
    sqrtUnderflow_uid165_fpHypot3dTest_n(0) <= not (sqrtUnderflow_uid165_fpHypot3dTest_o(15));

    -- excXYRUdf_uid172_fpHypot3dTest(LOGICAL,171)@48
    excXYRUdf_uid172_fpHypot3dTest_q <= sqrtUnderflow_uid165_fpHypot3dTest_n and redist67_onIsReg_uid171_fpHypot3dTest_q_41_q and noneInf_uid170_fpHypot3dTest_q;

    -- excXYZ_uid168_fpHypot3dTest(LOGICAL,167)@9 + 1
    excXYZ_uid168_fpHypot3dTest_qi <= redist110_excZ_x_uid17_fpHypot3dTest_q_3_q and redist108_excZ_y_uid31_fpHypot3dTest_q_3_q and redist105_excZ_z_uid45_fpHypot3dTest_q_3_q;
    excXYZ_uid168_fpHypot3dTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXYZ_uid168_fpHypot3dTest_qi, xout => excXYZ_uid168_fpHypot3dTest_q, clk => clk, aclr => areset );

    -- redist69_excXYZ_uid168_fpHypot3dTest_q_39(DELAY,820)
    redist69_excXYZ_uid168_fpHypot3dTest_q_39 : dspba_delay
    GENERIC MAP ( width => 1, depth => 38, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXYZ_uid168_fpHypot3dTest_q, xout => redist69_excXYZ_uid168_fpHypot3dTest_q_39_q, clk => clk, aclr => areset );

    -- excRZero_uid173_fpHypot3dTest(LOGICAL,172)@48
    excRZero_uid173_fpHypot3dTest_q <= redist69_excXYZ_uid168_fpHypot3dTest_q_39_q or excXYRUdf_uid172_fpHypot3dTest_q;

    -- excSelBits_uid179_fpHypot3dTest(BITJOIN,178)@48
    excSelBits_uid179_fpHypot3dTest_q <= excRNaN_uid178_fpHypot3dTest_q & excRInf_uid177_fpHypot3dTest_q & excRZero_uid173_fpHypot3dTest_q;

    -- outMuxSelEnc_uid180_fpHypot3dTest(LOOKUP,179)@48 + 1
    outMuxSelEnc_uid180_fpHypot3dTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid180_fpHypot3dTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excSelBits_uid179_fpHypot3dTest_q) IS
                WHEN "000" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "01";
                WHEN "001" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "00";
                WHEN "010" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "10";
                WHEN "011" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "01";
                WHEN "100" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "11";
                WHEN "101" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "01";
                WHEN "110" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "11";
                WHEN "111" => outMuxSelEnc_uid180_fpHypot3dTest_q <= "01";
                WHEN OTHERS => -- unreachable
                               outMuxSelEnc_uid180_fpHypot3dTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expRPostExc_uid190_fpHypot3dTest(MUX,189)@49
    expRPostExc_uid190_fpHypot3dTest_s <= outMuxSelEnc_uid180_fpHypot3dTest_q;
    expRPostExc_uid190_fpHypot3dTest_combproc: PROCESS (expRPostExc_uid190_fpHypot3dTest_s, cstAllZWE_uid14_fpHypot3dTest_q, redist66_expRPreExc_uid188_fpHypot3dTest_b_2_q, cstAllOWE_uid12_fpHypot3dTest_q)
    BEGIN
        CASE (expRPostExc_uid190_fpHypot3dTest_s) IS
            WHEN "00" => expRPostExc_uid190_fpHypot3dTest_q <= cstAllZWE_uid14_fpHypot3dTest_q;
            WHEN "01" => expRPostExc_uid190_fpHypot3dTest_q <= redist66_expRPreExc_uid188_fpHypot3dTest_b_2_q;
            WHEN "10" => expRPostExc_uid190_fpHypot3dTest_q <= cstAllOWE_uid12_fpHypot3dTest_q;
            WHEN "11" => expRPostExc_uid190_fpHypot3dTest_q <= cstAllOWE_uid12_fpHypot3dTest_q;
            WHEN OTHERS => expRPostExc_uid190_fpHypot3dTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- NaNFracRPostExc_uid181_fpHypot3dTest(CONSTANT,180)
    NaNFracRPostExc_uid181_fpHypot3dTest_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracR_uid162_fpHypot3dTest(BITSELECT,161)@45
    fracR_uid162_fpHypot3dTest_in <= fracRPostInc_uid161_fpHypot3dTest_q(52 downto 0);
    fracR_uid162_fpHypot3dTest_b <= fracR_uid162_fpHypot3dTest_in(52 downto 1);

    -- redist71_fracR_uid162_fpHypot3dTest_b_4_inputreg(DELAY,898)
    redist71_fracR_uid162_fpHypot3dTest_b_4_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracR_uid162_fpHypot3dTest_b, xout => redist71_fracR_uid162_fpHypot3dTest_b_4_inputreg_q, clk => clk, aclr => areset );

    -- redist71_fracR_uid162_fpHypot3dTest_b_4(DELAY,822)
    redist71_fracR_uid162_fpHypot3dTest_b_4 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist71_fracR_uid162_fpHypot3dTest_b_4_inputreg_q, xout => redist71_fracR_uid162_fpHypot3dTest_b_4_q, clk => clk, aclr => areset );

    -- redist71_fracR_uid162_fpHypot3dTest_b_4_outputreg(DELAY,899)
    redist71_fracR_uid162_fpHypot3dTest_b_4_outputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist71_fracR_uid162_fpHypot3dTest_b_4_q, xout => redist71_fracR_uid162_fpHypot3dTest_b_4_outputreg_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid185_fpHypot3dTest(MUX,184)@49
    fracRPostExc_uid185_fpHypot3dTest_s <= outMuxSelEnc_uid180_fpHypot3dTest_q;
    fracRPostExc_uid185_fpHypot3dTest_combproc: PROCESS (fracRPostExc_uid185_fpHypot3dTest_s, cstZeroWF_uid13_fpHypot3dTest_q, redist71_fracR_uid162_fpHypot3dTest_b_4_outputreg_q, NaNFracRPostExc_uid181_fpHypot3dTest_q)
    BEGIN
        CASE (fracRPostExc_uid185_fpHypot3dTest_s) IS
            WHEN "00" => fracRPostExc_uid185_fpHypot3dTest_q <= cstZeroWF_uid13_fpHypot3dTest_q;
            WHEN "01" => fracRPostExc_uid185_fpHypot3dTest_q <= redist71_fracR_uid162_fpHypot3dTest_b_4_outputreg_q;
            WHEN "10" => fracRPostExc_uid185_fpHypot3dTest_q <= cstZeroWF_uid13_fpHypot3dTest_q;
            WHEN "11" => fracRPostExc_uid185_fpHypot3dTest_q <= NaNFracRPostExc_uid181_fpHypot3dTest_q;
            WHEN OTHERS => fracRPostExc_uid185_fpHypot3dTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RHypot_uid191_fpHypot3dTest(BITJOIN,190)@49
    RHypot_uid191_fpHypot3dTest_q <= GND_q & expRPostExc_uid190_fpHypot3dTest_q & fracRPostExc_uid185_fpHypot3dTest_q;

    -- xOut(GPOUT,4)@49
    q <= RHypot_uid191_fpHypot3dTest_q;

END normal;
