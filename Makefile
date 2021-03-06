CC=gcc
CFLAGS=-Wall -Wextra -ansi -pedantic -O2
LDFLAGS=

.PHONY: all index clean

all : httpd

httpd : httpd.o
	$(CC) -o $@ $^ $(LDFLAGS)

stripped : httpd
	strip -s httpd

index :
	ctags httpd.c

clean :
	rm -f *.o *.exe *.stackdump
	rm -f httpd
	rm -f tags

%.o : %.c
	$(CC) -o $@ -c $< $(CFLAGS)

