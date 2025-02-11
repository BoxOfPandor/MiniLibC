##
## EPITECH PROJECT, 2024
## B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
## File description:
## Makefile
##

NAME = libasm.so
ASM = nasm
ASMFLAGS = -f elf64

LD = ld
LDFLAGS = -shared

SRCS = 	src/strlen.s
OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: $(NAME)
	gcc tests/main.c -o test_binary -L. -lasm
	LD_PRELOAD=./$(NAME) ./test_binary

.PHONY: all clean fclean re test