/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_memcpy.c
*/

#include <criterion/criterion.h>
#include <string.h>
#include "../includes/libasm.h"

Test(memcpy_tests, basic_copy)
{
    const char src[] = "Hello";
    char dest1[10];
    char dest2[10];

    memcpy(dest1, src, 6);
    asm_memcpy(dest2, src, 6);

    cr_assert_str_eq(dest1, dest2);
}

Test(memcpy_tests, zero_length)
{
    const char src[] = "Hello";
    char dest1[10] = "World";
    char dest2[10] = "World";

    memcpy(dest1, src, 0);
    asm_memcpy(dest2, src, 0);

    cr_assert_str_eq(dest1, dest2);
}

Test(memcpy_tests, partial_copy)
{
    const char src[] = "Hello, World!";
    char dest1[10];
    char dest2[10];

    memcpy(dest1, src, 5);
    asm_memcpy(dest2, src, 5);
    dest1[5] = '\0';
    dest2[5] = '\0';

    cr_assert_str_eq(dest1, dest2);
}