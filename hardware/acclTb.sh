# Compile the design and testbench with VCS
# Make sure shift_register.sv exists or is also provided by Quartus IP

vcs -full64 -sverilog \
    +define+FUNCTIONAL \
    +incdir+. \
    getAccl.sv \
    shiftreg.sv \
    acclTb.sv \
    -y AddSub_sim/synopsys +libext+.v+.sv \
    -y Mult_sim/synopsys +libext+.v+.sv \
    -y InvSqrt_sim/synopsys +libext+.v+.sv \
    -LDFLAGS -Wl,--no-as-needed \
    -o simv

# Explanation:
# -full64           : Enable 64-bit simulation mode.
# -sverilog         : Enable SystemVerilog language features.
# +define+FUNCTIONAL: Often required by Altera/Intel IP simulation models. Check IP docs.
# +incdir+.         : Add current directory to include search path (if needed).
# getAccl.sv        : Your main module file.
# shift_register.sv : Your shift register module (or path if from IP).
# getAccl_tb.sv     : This testbench file.
# -y <path>         : Add <path> to the library search directories.
# +libext+.v+.sv    : Look for files with .v or .sv extensions in library directories.
#                     (Repeat -y and +libext+ for each IP model directory).
# -LDFLAGS ...      : Linker flags sometimes needed on Linux.
# -o simv           : Name the output executable 'simv'.

# Run the simulation
./simv