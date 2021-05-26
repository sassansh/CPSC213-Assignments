CFLAGS += -std=gnu11 -I..
EXES   =  main
OBJS   =  main.o element.o list.o tree.o ../refcount.o

all: $(EXES)

main: main.o element.o list.o tree.o ../refcount.o

clean:
	rm -f $(EXES) $(OBJS)
tidy:
	rm -f $(OBJS)
