flex zeroOne.l
bison -dy zeroOne.y
gcc lex.yy.c y.tab.c -w
./a.out