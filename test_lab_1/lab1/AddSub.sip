set_global_assignment -entity "AddSub" -library "lib_AddSub" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "AddSub" -library "lib_AddSub" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "AddSub" -library "lib_AddSub" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_AddSub" -name SPD_FILE [file join $::quartus(sip_path) "AddSub.spd"]

set_global_assignment -library "lib_AddSub" -name MISC_FILE [file join $::quartus(sip_path) "AddSub_sim/AddSub.vo"]
