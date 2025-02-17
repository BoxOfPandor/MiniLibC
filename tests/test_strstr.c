/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_strstr.c
*/

#include <criterion/criterion.h>
#include <string.h>
#include "../includes/libasm.h"

Test(strstr_tests, basic_find)
{
    const char *haystack = "Hello World";
    const char *needle = "World";
    cr_assert_eq(asm_strstr(haystack, needle), strstr(haystack, needle));
}

Test(strstr_tests, not_found)
{
    const char *haystack = "Hello World";
    const char *needle = "Python";
    cr_assert_eq(asm_strstr(haystack, needle), strstr(haystack, needle));
}

Test(strstr_tests, empty_needle)
{
    const char *haystack = "Hello World";
    const char *needle = "";
    cr_assert_eq(asm_strstr(haystack, needle), strstr(haystack, needle));
}

Test(strstr_tests, empty_haystack)
{
    const char *haystack = "";
    const char *needle = "World";
    cr_assert_eq(asm_strstr(haystack, needle), strstr(haystack, needle));
}