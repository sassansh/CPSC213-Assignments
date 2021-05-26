CFLAGS += -std=gnu11
EXES   =  q2stack
OBJS   =  q2stack.o ../refcount.o

all: $(EXES)

q2stack: q2stack.o ../refcount.o

clean:
	rm -f $(EXES) $(OBJS)
tidy:
	rm -f $(OBJS)
