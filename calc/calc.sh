flex calc.l
bison -dy calc.y
gcc lex.yy.c y.tab.c -w
./a.out