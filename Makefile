a.out: calc.y calc.l
	lex calc.l
	yacc calc.y
	cc y.tab.c

clean:
	rm -f *.c a.out
