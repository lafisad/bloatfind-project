CC ?= gcc
CFLAGS ?= -O3 -Wall -Wextra -Wpedantic -std=c11
LDFLAGS ?=
TARGET = bloatfind
SRC = bloatfind.c

.PHONY: all clean debug sanitize

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

debug:
	$(CC) -g -O0 -Wall -Wextra -o $(TARGET) $(SRC)

sanitize:
	$(CC) -fsanitize=address,undefined -g -O1 -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)