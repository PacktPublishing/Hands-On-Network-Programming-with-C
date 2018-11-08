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



cd chap02
copy sock_init.c sock_init.cpp
echo "%CC%"
%CC% sock_init.c -o sock_init.exe %CEXTRA%
sock_init.exe
del sock_init.exe
%CC% sock_init.cpp -o sock_init.exe %CEXTRA%
sock_init.exe
del sock_init.exe
del sock_init.cpp
cd ..


cd chap02
copy time_console.c time_console.cpp
echo "%CC%"
%CC% time_console.c -o time_console.exe %CEXTRA%
time_console.exe
del time_console.exe
%CC% time_console.cpp -o time_console.exe %CEXTRA%
time_console.exe
del time_console.exe
del time_console.cpp
cd ..


cd chap02
copy time_server.c time_server.cpp
echo "%CC%"
%CC% time_server.c -o time_server.exe %CEXTRA%
REM time_server.exe
del time_server.exe
%CC% time_server.cpp -o time_server.exe %CEXTRA%
REM time_server.exe
del time_server.exe
del time_server.cpp
cd ..


cd chap03
copy tcp_client.c tcp_client.cpp
echo "%CC%"
%CC% tcp_client.c -o tcp_client.exe %CEXTRA%
tcp_client.exe
del tcp_client.exe
%CC% tcp_client.cpp -o tcp_client.exe %CEXTRA%
tcp_client.exe
del tcp_client.exe
del tcp_client.cpp
cd ..


cd chap03
copy tcp_serve_toupper.c tcp_serve_toupper.cpp
echo "%CC%"
%CC% tcp_serve_toupper.c -o tcp_serve_toupper.exe %CEXTRA%
REM tcp_serve_toupper.exe
del tcp_serve_toupper.exe
%CC% tcp_serve_toupper.cpp -o tcp_serve_toupper.exe %CEXTRA%
REM tcp_serve_toupper.exe
del tcp_serve_toupper.exe
del tcp_serve_toupper.cpp
cd ..


cd chap03
copy tcp_serve_chat.c tcp_serve_chat.cpp
echo "%CC%"
%CC% tcp_serve_chat.c -o tcp_serve_chat.exe %CEXTRA%
REM tcp_serve_chat.exe
del tcp_serve_chat.exe
%CC% tcp_serve_chat.cpp -o tcp_serve_chat.exe %CEXTRA%
REM tcp_serve_chat.exe
del tcp_serve_chat.exe
del tcp_serve_chat.cpp
cd ..



cd chap04
copy udp_client.c udp_client.cpp
echo "%CC%"
%CC% udp_client.c -o udp_client.exe %CEXTRA%
REM udp_client.exe
del udp_client.exe
%CC% udp_client.cpp -o udp_client.exe %CEXTRA%
REM udp_client.exe
del udp_client.exe
del udp_client.cpp
cd ..


cd chap04
copy udp_sendto.c udp_sendto.cpp
echo "%CC%"
%CC% udp_sendto.c -o udp_sendto.exe %CEXTRA%
REM udp_sendto.exe
del udp_sendto.exe
%CC% udp_sendto.cpp -o udp_sendto.exe %CEXTRA%
REM udp_sendto.exe
del udp_sendto.exe
del udp_sendto.cpp
cd ..


cd chap04
copy udp_recvfrom.c udp_recvfrom.cpp
echo "%CC%"
%CC% udp_recvfrom.c -o udp_recvfrom.exe %CEXTRA%
REM udp_recvfrom.exe
del udp_recvfrom.exe
%CC% udp_recvfrom.cpp -o udp_recvfrom.exe %CEXTRA%
REM udp_recvfrom.exe
del udp_recvfrom.exe
del udp_recvfrom.cpp
cd ..


cd chap04
copy udp_serve_toupper.c udp_serve_toupper.cpp
echo "%CC%"
%CC% udp_serve_toupper.c -o udp_serve_toupper.exe %CEXTRA%
REM udp_serve_toupper.exe
del udp_serve_toupper.exe
%CC% udp_serve_toupper.cpp -o udp_serve_toupper.exe %CEXTRA%
REM udp_serve_toupper.exe
del udp_serve_toupper.exe
del udp_serve_toupper.cpp
cd ..


cd chap04
copy udp_serve_toupper_simple.c udp_serve_toupper_simple.cpp
echo "%CC%"
%CC% udp_serve_toupper_simple.c -o udp_serve_toupper_simple.exe %CEXTRA%
REM udp_serve_toupper_simple.exe
del udp_serve_toupper_simple.exe
%CC% udp_serve_toupper_simple.cpp -o udp_serve_toupper_simple.exe %CEXTRA%
REM udp_serve_toupper_simple.exe
del udp_serve_toupper_simple.exe
del udp_serve_toupper_simple.cpp
cd ..
