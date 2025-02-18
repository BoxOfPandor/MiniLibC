/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_strpbrk.c
*/

#include <criterion/criterion.h>
#include <string.h>
#include "../includes/libasm.h"

Test(strpbrk_tests, basic_find)
{
    const char *str = "Hello World";
    const char *accept = "Wd";
    cr_assert_eq(asm_strpbrk(str, accept), strpbrk(str, accept));
}

Test(strpbrk_tests, not_found)
{
    const char *str = "Hello World";
    const char *accept = "xyz";
    cr_assert_eq(asm_strpbrk(str, accept), strpbrk(str, accept));
}

Test(strpbrk_tests, empty_accept)
{
    const char *str = "Hello World";
    const char *accept = "";
    cr_assert_eq(asm_strpbrk(str, accept), strpbrk(str, accept));
}

Test(strpbrk_tests, empty_string)
{
    const char *str = "";
    const char *accept = "abc";
    cr_assert_eq(asm_strpbrk(str, accept), strpbrk(str, accept));
}