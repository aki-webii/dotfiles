#---------------------------------------------
# %file% - ????
# 
#   Copyright (C) %cyear% rakuten 
#     by %name% <%mail%> 
#     Date : %cdate%
#---------------------------------------------
TARGET=foo
SRC = bar.c baz.c
OBJ = $(SRC:%.c=%.o)

all:${TARGET}

install:all

uninstall:

clean:
	rm -f *.o
	rm -f ${TARGET}

${TARGET}: $(OBJ)
	${LINKER} $^ -o $@ ${LDFLAGS}

.c.o:
	${CC} $<  -c  -o $@ ${CFLAGS}
