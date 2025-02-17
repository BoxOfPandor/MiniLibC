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

SRCS = $(wildcard src/*.asm)
OBJS = $(SRCS:.asm=.o)

TEST_NAME = unit_tests
TEST_SRCS = $(wildcard tests/*.c)
TEST_OBJS = $(TEST_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(TEST_OBJS)
	rm -f $(TEST_NAME)
	rm -f *.gcno
	rm -f *.gcda

fclean: clean
	rm -f $(NAME)

re: fclean all

unit_test:
	gcc -o $(TEST_NAME) $(TEST_SRCS) -L. -lasm -lcriterion --coverage

tests_run: unit_test
	LD_LIBRARY_PATH=. ./$(TEST_NAME)

.PHONY: all clean fclean re tests_run unit_test