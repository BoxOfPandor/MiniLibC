/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
** File description:
** main.c
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <string.h>
#include "../includes/libasm.h"

Test(strlen_tests, basic_string)
{
    const char *str = "Hello, World!";
    cr_assert_eq(asm_strlen(str), strlen(str));
}

Test(strlen_tests, empty_string)
{
    const char *str = "";
    cr_assert_eq(asm_strlen(str), strlen(str));
}
