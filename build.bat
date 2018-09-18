copy id.c id.cpp
echo "%CC%"
%CC% id.c -o id.exe %CEXTRA%
id.exe
del id.exe
%CC% id.cpp -o id.exe %CEXTRA%
id.exe
del id.exe
del id.cpp


cd chap01
copy win_init.c win_init.cpp
echo "%CC%"
%CC% win_init.c -o win_init.exe %CEXTRA%
win_init.exe
del win_init.exe
%CC% win_init.cpp -o win_init.exe %CEXTRA%
win_init.exe
del win_init.exe
del win_init.cpp
cd ..


cd chap01
copy win_list.c win_list.cpp
echo "%CC%"
%CC% win_list.c -o win_list.exe %CEXTRA%
win_list.exe
del win_list.exe
%CC% win_list.cpp -o win_list.exe %CEXTRA%
win_list.exe
del win_list.exe
del win_list.cpp
cd ..
