CFLAGS += -std=gnu11 -I..
EXES   =  main
OBJS   =  main.o helper.o integer.o stack.o set.o ../refcount.o

all: $(EXES)

main: main.o helper.o integer.o stack.o set.o ../refcount.o

clean:
	rm -f $(EXES) $(OBJS)
tidy:
	rm -f $(OBJS)
