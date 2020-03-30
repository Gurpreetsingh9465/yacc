flex bintodec.l
bison -dy bintodec.y
gcc lex.yy.c y.tab.c -w
./a.out