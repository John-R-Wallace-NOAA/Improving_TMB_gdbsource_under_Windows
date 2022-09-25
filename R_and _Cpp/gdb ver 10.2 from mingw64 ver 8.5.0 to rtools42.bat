
rem From https://winlibs.com/ download GCC 8.5.0 + MinGW-w64 9.0.0 (MSVCRT) - release 1, Win64 archive (avoid ver 9.4.0 which has viruses)
rem Extract the 'mingw64' folder, put this batch file into the 'bin' folder inside the mingw64 folder, and then run this batch file.

robocopy . W:\rtools42\x86_64-w64-mingw32.static.posix\bin gdb.exe libboost_regex-mt-x64.dll libdl.dll libexpat-1.dll libgcc_s_seh-1.dll libgmp-10.dll libiconv-2.dll liblzma-5.dll libmpfr-6.dll libncurses6.dll libncursesw6.dll libreadline8.dll libsource-highlight-4.dll libstdc++-6.dll libwinpthread-1.dll mman-win.dll xxhash.dll zlib1.dll 

