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
