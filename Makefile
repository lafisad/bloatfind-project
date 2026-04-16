CC = cc
CFLAGS = -Wall -Wextra -O2 -std=c99
LDFLAGS =

UNAME := $(shell uname -s)

VERSION := $(shell git describe --tags --always 2>/dev/null || echo dev)
CFLAGS += -DVERSION=\"$(VERSION)\"

TARGET = bloatfind

ifeq ($(UNAME),Darwin)
    LDFLAGS += -framework IOKit
endif

ifeq ($(UNAME),FreeBSD)
    CFLAGS += -D__FreeBSD__
endif

.PHONY: all clean install

all: $(TARGET)

$(TARGET): bloatfind.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(TARGET)

install: $(TARGET)
	install -m 755 $(TARGET) /usr/local/bin/