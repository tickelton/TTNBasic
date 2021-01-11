.PHONY: all clean

all: ttn_basic.tab.c lex.yy.c ttn_basic.c
	gcc ttn_basic.tab.c lex.yy.c ttn_basic.c -o ttn_basic

ttn_basic.tab.c: ttn_basic.y
	bison -d ttn_basic.y

ttn_basic.tab.h: ttn_basic.y
	bison -d ttn_basic.y

lex.yy.c: ttn_basic.tab.h ttn_basic.l
	flex ttn_basic.l

clean:
	rm -f ttn_basic.tab.c ttn_basic.tab.h lex.yy.c ttn_basic
