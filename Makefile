

ODIR=.
LDIR =../rpi_ws281x


IDIR =../rpi_ws281x
CC=gcc
CFLAGS=-I$(IDIR) -O3 -L $(LDIR)


LIBS=-lm -lws2811

_DEPS = hohoho.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hohoho.o  
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hohoho: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
