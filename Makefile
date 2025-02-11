##
## EPITECH PROJECT, 2024
## B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
## File description:
## Makefile
##

NAME = libasm.so
ASM = nasm
ASMFLAGS = -f elf64

CC = gcc
CFLAGS = -Wall -Wextra -shared

SRCS = 	src/strlen.s

OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: $(NAME)
	$(CC) tests/main.c -o test_binary -L. -lasm
	LD_PRELOAD=./$(NAME) ./test_binary

.PHONY: all clean fclean re test