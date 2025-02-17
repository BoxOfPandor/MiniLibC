/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_memmove.c
*/

#include <criterion/criterion.h>
#include <string.h>
#include "../includes/libasm.h"

Test(memmove_tests, basic_move)
{
    char str1[] = "Hello, World";
    char str2[] = "Hello, World";

    memmove(str1 + 1, str1, 5);
    asm_memmove(str2 + 1, str2, 5);

    cr_assert_str_eq(str1, str2);
}

Test(memmove_tests, overlapping_forward)
{
    char str1[] = "Hello, World";
    char str2[] = "Hello, World";

    memmove(str1 + 5, str1, 7);
    asm_memmove(str2 + 5, str2, 7);

    cr_assert_str_eq(str1, str2);
}

Test(memmove_tests, overlapping_backward)
{
    char str1[] = "Hello, World";
    char str2[] = "Hello, World";

    memmove(str1, str1 + 5, 7);
    asm_memmove(str2, str2 + 5, 7);

    cr_assert_str_eq(str1, str2);
}

Test(memmove_tests, zero_length)
{
    char str1[] = "Hello";
    char str2[] = "Hello";

    memmove(str1 + 1, str1, 0);
    asm_memmove(str2 + 1, str2, 0);

    cr_assert_str_eq(str1, str2);
}