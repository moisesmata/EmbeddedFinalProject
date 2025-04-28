# TOP-LEVEL TEMPLATE - BEGIN
#
# QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# construct paths to the files required to simulate the IP in your Quartus
# project. By default, the IP script assumes that you are launching the
# simulator from the IP script location. If launching from another
# location, set QSYS_SIMDIR to the output directory you specified when you
# generated the IP script, relative to the directory from which you launch
# the simulator.
#
# Define the base directory for IP cores if needed, adjust path as necessary
# set IP_BASE_DIR "."

# --- Compile Quartus Libraries ---
# Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>

# Call command to compile the Quartus EDA simulation library.
echo "Compiling Quartus libraries..."
# dev_com

# --- Compile IP Cores ---
# Source and compile each IP core's simulation files

# Multiplier IP
echo "Compiling Multiplier IP (Mult_sim)..."
set QSYS_SIMDIR Mult_sim
source $QSYS_SIMDIR/mentor/msim_setup.tcl
com

# Adder/Subtractor IP
echo "Compiling Adder/Subtractor IP (AddSub_sim)..."
set QSYS_SIMDIR AddSub_sim
source $QSYS_SIMDIR/mentor/msim_setup.tcl
com

# Inverse Square Root IP
echo "Compiling Inverse Square Root IP (InvSqrt_sim)..."
set QSYS_SIMDIR InvSqrt_sim
source $QSYS_SIMDIR/mentor/msim_setup.tcl
com

# --- Compile Design and Testbench Files ---
# Add commands to compile all your custom design files and testbench files.
# Replace <your_design_files.v> and <your_testbench.v> with actual file names/paths.
# Add -L altera_mf_ver etc. if needed for Altera primitives not included by IP cores
echo "Compiling design and testbench files..."
vlog +incdir+./ \
     <your_design_files.v> \
     <your_testbench.v>
# Example:
# vlog +incdir+../src \
#      ../src/my_module1.v \
#      ../src/my_module2.v \
#      ../tb/top_level_tb.v

# --- Elaboration ---
# Set the top-level simulation or testbench module/entity name.
# Replace <your_top_level_tb_module> with the actual name.
echo "Elaborating design..."
set TOP_LEVEL_NAME acclTb.sv

# Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
set USER_DEFINED_ELAB_OPTIONS "-L altera_mf_ver -L lpm_ver" # Example options

# Call command to elaborate your design and testbench.
# The -L options link libraries compiled earlier (Quartus libs, IP libs)
elab $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME

# --- Simulation ---
# Run the simulation.
echo "Running simulation..."
run -a

# Report success to the shell.
echo "Simulation finished successfully."
exit -code 0
#
# TOP-LEVEL TEMPLATE - END