set_global_assignment -entity "InvSqrt" -library "lib_InvSqrt" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "InvSqrt" -library "lib_InvSqrt" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "InvSqrt" -library "lib_InvSqrt" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_InvSqrt" -name SPD_FILE [file join $::quartus(sip_path) "InvSqrt.spd"]

set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC5_uid80_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC4_uid77_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC4_uid76_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC3_uid73_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC3_uid72_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC2_uid69_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC2_uid68_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC1_uid65_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC1_uid64_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC1_uid63_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC0_uid60_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC0_uid59_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt_memoryC0_uid58_invSqrtTables_lutmem.hex"]
set_global_assignment -library "lib_InvSqrt" -name MISC_FILE [file join $::quartus(sip_path) "InvSqrt_sim/InvSqrt.vo"]
