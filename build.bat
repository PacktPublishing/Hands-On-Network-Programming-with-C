copy id.c id.cpp
echo "%CC%"
%CC% id.c %CEXTRA%
id.exe
del id.exe
%CC% id.cpp %CEXTRA%
id.exe
del id.exe
del id.cpp


cd chap01
copy win_init.c win_init.cpp
echo "%CC%"
%CC% win_init.c %CEXTRA%
win_init.exe
del win_init.exe
%CC% win_init.cpp %CEXTRA%
win_init.exe
del win_init.exe
del win_init.cpp
cd ..


cd chap01
copy win_list.c win_list.cpp
echo "%CC%"
%CC% win_list.c %CEXTRA%
win_list.exe
del win_list.exe
%CC% win_list.cpp %CEXTRA%
win_list.exe
del win_list.exe
del win_list.cpp
cd ..
