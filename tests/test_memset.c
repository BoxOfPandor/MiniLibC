/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_memset.c
*/

#include <criterion/criterion.h>
#include <string.h>
#include "../includes/libasm.h"

Test(memset_tests, basic_test)
{
    char buffer1[10];
    char buffer2[10];

    memset(buffer1, 'A', 9);
    asm_memset(buffer2, 'A', 9);
    buffer1[9] = '\0';
    buffer2[9] = '\0';

    cr_assert_str_eq(buffer1, buffer2);
}

Test(memset_tests, zero_length)
{
    char buffer1[10] = "Hello";
    char buffer2[10] = "Hello";

    memset(buffer1, 'X', 0);
    asm_memset(buffer2, 'X', 0);

    cr_assert_str_eq(buffer1, buffer2);
}

Test(memset_tests, full_buffer)
{
    char buffer1[10];
    char buffer2[10];

    memset(buffer1, 0, 10);
    asm_memset(buffer2, 0, 10);

    cr_assert_arr_eq(buffer1, buffer2, 10);
}