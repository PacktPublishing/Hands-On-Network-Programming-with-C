echo
cp id.c id.cpp
${CC} -Wall -Wextra id.c -o id; ./id; rm id
echo
${CC} -Wall -Wextra id.cpp -o id; ./id; rm id
rm id.cpp
echo
echo


cd chap01
echo
cp unix_list.c unix_list.cpp
${CC} -Wall -Wextra unix_list.c -o unix_list; ./unix_list; rm unix_list
echo
${CC} -Wall -Wextra unix_list.cpp -o unix_list; ./unix_list; rm unix_list
rm unix_list.cpp
echo
echo
cd ..


cd chap02
echo
cp sock_init.c sock_init.cpp
${CC} -Wall -Wextra sock_init.c -o sock_init; ./sock_init; rm sock_init
echo
${CC} -Wall -Wextra sock_init.cpp -o sock_init; ./sock_init; rm sock_init
rm sock_init.cpp
echo
echo
cd ..


cd chap02
echo
cp time_console.c time_console.cpp
${CC} -Wall -Wextra time_console.c -o time_console; ./time_console; rm time_console
echo
${CC} -Wall -Wextra time_console.cpp -o time_console; ./time_console; rm time_console
rm time_console.cpp
echo
echo
cd ..


cd chap02
echo
cp time_server.c time_server.cpp
${CC} -Wall -Wextra time_server.c -o time_server; timeout 5s ./time_server; rm time_server
echo
${CC} -Wall -Wextra time_server.cpp -o time_server; timeout 5s ./time_server; rm time_server
rm time_server.cpp
echo
echo
cd ..


cd chap03
echo
cp tcp_client.c tcp_client.cpp
${CC} -Wall -Wextra tcp_client.c -o tcp_client; ./tcp_client; rm tcp_client
echo
${CC} -Wall -Wextra tcp_client.cpp -o tcp_client; ./tcp_client; rm tcp_client
rm tcp_client.cpp
echo
echo
cd ..


cd chap03
echo
cp tcp_serve_toupper.c tcp_serve_toupper.cpp
${CC} -Wall -Wextra tcp_serve_toupper.c -o tcp_serve_toupper; timeout 5s ./tcp_serve_toupper; rm tcp_serve_toupper
echo
${CC} -Wall -Wextra tcp_serve_toupper.cpp -o tcp_serve_toupper; timeout 5s ./tcp_serve_toupper; rm tcp_serve_toupper
rm tcp_serve_toupper.cpp
echo
echo
cd ..


cd chap03
echo
cp tcp_serve_chat.c tcp_serve_chat.cpp
${CC} -Wall -Wextra tcp_serve_chat.c -o tcp_serve_chat; timeout 5s ./tcp_serve_chat; rm tcp_serve_chat
echo
${CC} -Wall -Wextra tcp_serve_chat.cpp -o tcp_serve_chat; timeout 5s ./tcp_serve_chat; rm tcp_serve_chat
rm tcp_serve_chat.cpp
echo
echo
cd ..


cd chap03
echo
cp tcp_serve_toupper_fork.c tcp_serve_toupper_fork.cpp
${CC} -Wall -Wextra tcp_serve_toupper_fork.c -o tcp_serve_toupper_fork; timeout 5s ./tcp_serve_toupper_fork; rm tcp_serve_toupper_fork
echo
${CC} -Wall -Wextra tcp_serve_toupper_fork.cpp -o tcp_serve_toupper_fork; timeout 5s ./tcp_serve_toupper_fork; rm tcp_serve_toupper_fork
rm tcp_serve_toupper_fork.cpp
echo
echo
cd ..

cd chap04
echo
cp udp_client.c udp_client.cpp
${CC} -Wall -Wextra udp_client.c -o udp_client; timeout 5s ./udp_client; rm udp_client
echo
${CC} -Wall -Wextra udp_client.cpp -o udp_client; timeout 5s ./udp_client; rm udp_client
rm udp_client.cpp
echo
echo
cd ..


cd chap04
echo
cp upd_sendto.c upd_sendto.cpp
${CC} -Wall -Wextra upd_sendto.c -o upd_sendto; timeout 5s ./upd_sendto; rm upd_sendto
echo
${CC} -Wall -Wextra upd_sendto.cpp -o upd_sendto; timeout 5s ./upd_sendto; rm upd_sendto
rm upd_sendto.cpp
echo
echo
cd ..


cd chap04
echo
cp udp_recvfrom.c udp_recvfrom.cpp
${CC} -Wall -Wextra udp_recvfrom.c -o udp_recvfrom; timeout 5s ./udp_recvfrom; rm udp_recvfrom
echo
${CC} -Wall -Wextra udp_recvfrom.cpp -o udp_recvfrom; timeout 5s ./udp_recvfrom; rm udp_recvfrom
rm udp_recvfrom.cpp
echo
echo
cd ..


cd chap04
echo
cp udp_serve_toupper.c udp_serve_toupper.cpp
${CC} -Wall -Wextra udp_serve_toupper.c -o udp_serve_toupper; timeout 5s ./udp_serve_toupper; rm udp_serve_toupper
echo
${CC} -Wall -Wextra udp_serve_toupper.cpp -o udp_serve_toupper; timeout 5s ./udp_serve_toupper; rm udp_serve_toupper
rm udp_serve_toupper.cpp
echo
echo
cd ..


cd chap04
echo
cp udp_serve_toupper_simple.c udp_serve_toupper_simple.cpp
${CC} -Wall -Wextra udp_serve_toupper_simple.c -o udp_serve_toupper_simple; timeout 5s ./udp_serve_toupper_simple; rm udp_serve_toupper_simple
echo
${CC} -Wall -Wextra udp_serve_toupper_simple.cpp -o udp_serve_toupper_simple; timeout 5s ./udp_serve_toupper_simple; rm udp_serve_toupper_simple
rm udp_serve_toupper_simple.cpp
echo
echo
cd ..
