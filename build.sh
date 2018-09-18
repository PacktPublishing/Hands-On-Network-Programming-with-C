SRC=id

echo
cp ${SRC}.c ${SRC}.cpp
${CC} -Wall -Wextra ${SRC}.c -o ${SRC}; ./${SRC}; rm ${SRC}
echo
${CC} -Wall -Wextra ${SRC}.cpp -o ${SRC}; ./${SRC}; rm ${SRC}
rm ${SRC}.cpp
echo
echo
