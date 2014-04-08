echo "Searching cscope target files on Android"; 
find `pwd` \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.java' -o -name '*.mk' -o -name 'Makefile*' -o -name 'AndroidManifest*' -o -name '*.sh' -o -name '*.rc' -o -name 'Kconfig' -o -path '*/.svn' -prune \) -print > cscope.files
echo "Making cscope DB"; 
cscope -b -i cscope.files
