CFLAGS +=  -Wall -I./include

SOURCES = $(wildcard ./src/*.c)
OBJS = $(patsubst %.c,%.o,$(SOURCES))
DEPS = $(patsubst %.c,%.d,$(SOURCES))

#OBJS = input.o kernel_api.o proxy.o timer.o utils.o
%.d: %.c
	$(CC) -MM $(CFLAGS) -g -c -o $@ $< 

%.o: %.c
	$(CC) $(CFLAGS) -g -c -o $@ $< 

all : improxy

improxy : $(OBJS) $(DEPS)
	$(CC) $(LDFLAGS) -o $@  $(OBJS) 

clean :
	rm -rf ${OBJS} $(DEPS) improxy
