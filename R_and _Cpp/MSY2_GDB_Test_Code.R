

# This code fixes the pwd path issue with GDB (currently ver 11.1) installed using MSYS2 pacman, however the result does not
# give (at least for me on 2 different systems) a backtrace with line number information when using the compile options given in 
# the help for TMB::gdbsource().

# The pwd path issue always puts the current working directory on the path of 'Rterm' even when using 'unset environment'. The only way
# this worked for me, without the fix below, is to remove Sys.which() from 'Rterm' and manually set the working directory in R to 
# Sys.which('Rterm') [e.g. C:/R/R-4.2.1/bin/x64].

# Note that in GDB, the pwd path is set with 'cd' but looked with 'pwd'.

file <- 'simpleError.R'
gdbscript <- tempfile()
#  txt <- paste("unset environment\nset breakpoint pending on\nb abort\nrun --vanilla -f", file, "\nbt\n")
Rterm_Path <- paste(rev(rev(strsplit(Sys.which('Rterm'), "\\\\")[[1]])[-1]), collapse = "\\")
txt <- paste("cd ", Rterm_Path, "\nset breakpoint pending on\nb abort\nrun --vanilla -f", file, "\nbt\n")
cat(txt, file = gdbscript)
# cat("quit\n", file = gdbscript, append = TRUE)   # Consistently hangs without the 'quit'. Use <Esc> to exit the hang.
(cmd <- paste0("gdb Rterm -x ", gdbscript))
# cmd <- paste0("gdb ", Sys.which('Rterm')))
# (cmd <- paste0("gdb ", 'Rterm'))
file.show(gdbscript)  # Look at the commands in gdbscript temp file, if desired.
# system(cmd)  
cmd <- paste("start", cmd)   
shell(cmd)
