/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
** File description:
** test_strncmp.c
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <string.h>
#include "../includes/libasm.h"

Test(strncmp_tests, equal_strings_exact_n)
{
    const char *s1 = "Hello";
    const char *s2 = "Hello";
    cr_assert_eq(asm_strncmp(s1, s2, 5), strncmp(s1, s2, 5));
}

Test(strncmp_tests, equal_strings_larger_n)
{
    const char *s1 = "Hello";
    const char *s2 = "Hello";
    cr_assert_eq(asm_strncmp(s1, s2, 10), strncmp(s1, s2, 10));
}

Test(strncmp_tests, equal_strings_smaller_n)
{
    const char *s1 = "Hello World";
    const char *s2 = "Hello Earth";
    cr_assert_eq(asm_strncmp(s1, s2, 5), strncmp(s1, s2, 5));
}

Test(strncmp_tests, different_strings)
{
    const char *s1 = "Hello";
    const char *s2 = "World";
    cr_assert_eq(asm_strncmp(s1, s2, 5), strncmp(s1, s2, 5));
}

Test(strncmp_tests, empty_strings)
{
    const char *s1 = "";
    const char *s2 = "";
    cr_assert_eq(asm_strncmp(s1, s2, 1), strncmp(s1, s2, 1));
}

Test(strncmp_tests, different_lengths)
{
    const char *s1 = "Hello";
    const char *s2 = "Hello World";
    cr_assert_eq(asm_strncmp(s1, s2, 7), strncmp(s1, s2, 7));
}

Test(strncmp_tests, zero_n)
{
    const char *s1 = "Different";
    const char *s2 = "Strings";
    cr_assert_eq(asm_strncmp(s1, s2, 0), strncmp(s1, s2, 0));
}

Test(strncmp_tests, differ_after_n)
{
    const char *s1 = "HelloWorld";
    const char *s2 = "HelloEarth";
    cr_assert_eq(asm_strncmp(s1, s2, 5), strncmp(s1, s2, 5));
}