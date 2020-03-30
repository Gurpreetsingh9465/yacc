flex palin.l
bison -dy palin.y
gcc lex.yy.c y.tab.c -w
./a.out