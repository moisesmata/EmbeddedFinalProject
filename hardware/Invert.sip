set_global_assignment -entity "Invert" -library "lib_Invert" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "Invert" -library "lib_Invert" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "Invert" -library "lib_Invert" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_Invert" -name SPD_FILE [file join $::quartus(sip_path) "Invert.spd"]

set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC5_uid91_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC4_uid88_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC3_uid85_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC2_uid82_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC2_uid81_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC1_uid78_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC1_uid77_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC0_uid74_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert_memoryC0_uid73_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_Invert" -name MISC_FILE [file join $::quartus(sip_path) "Invert_sim/Invert.vo"]
