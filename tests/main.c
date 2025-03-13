/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
** File description:
** main.c
*/

#include <stdio.h>
#include <string.h>
#include "../includes/libasm.h"

int main(void) {
    const char *test_str = "Hello, World!";

    printf("Testing strlen:\n");
    printf("Expected: %lu\n", strlen(test_str));
    printf("Got: %lu\n", strlen(test_str));

    return 0;
}
