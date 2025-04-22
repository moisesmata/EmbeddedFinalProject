set_global_assignment -entity "threeDHyp" -library "lib_threeDHyp" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "threeDHyp" -library "lib_threeDHyp" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "threeDHyp" -library "lib_threeDHyp" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_threeDHyp" -name SPD_FILE [file join $::quartus(sip_path) "threeDHyp.spd"]

set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC5_uid210_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC4_uid207_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC3_uid204_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC2_uid201_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC1_uid198_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC1_uid197_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC0_uid194_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp_memoryC0_uid193_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_threeDHyp" -name MISC_FILE [file join $::quartus(sip_path) "threeDHyp_sim/threeDHyp.vo"]
