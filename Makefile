CC = cc
CFLAGS = -Wall -Wextra -O2 -std=c99
LDFLAGS =

# Platform detection for platform-specific libs
UNAME := $(shell uname -s)

ifeq ($(UNAME),Linux)
    TARGET = bloatfind
endif

ifeq ($(UNAME),Darwin)
    TARGET = bloatfind
    LDFLAGS += -framework IOKit
endif

ifeq ($(UNAME),FreeBSD)
    TARGET = bloatfind
    CFLAGS += -D__FreeBSD__
endif

.PHONY: all clean install

all: bloatfind

bloatfind: bloatfind.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f bloatfind

install: bloatfind
	install -m 755 bloatfind /usr/local/bin/
