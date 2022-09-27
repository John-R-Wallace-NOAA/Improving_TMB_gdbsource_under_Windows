

# This code fixes the pwd path issue with GDB (currently ver 11.1) installed with MSYS2 pacman, however the result does not
# give a backtrace with line numbers 

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
