set_global_assignment -entity "Mult" -library "lib_Mult" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "Mult" -library "lib_Mult" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "Mult" -library "lib_Mult" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_Mult" -name SPD_FILE [file join $::quartus(sip_path) "Mult.spd"]

set_global_assignment -library "lib_Mult" -name MISC_FILE [file join $::quartus(sip_path) "Mult_sim/Mult.vo"]
