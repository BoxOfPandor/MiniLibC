/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
** File description:
** test_strcmp.c
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <string.h>
#include "../includes/libasm.h"

Test(strcmp_tests, equal_strings)
{
    const char *s1 = "Hello World";
    const char *s2 = "Hello World";
    cr_assert_eq(asm_strcmp(s1, s2), 0);
}

Test(strcmp_tests, different_strings)
{
    const char *s1 = "Hello";
    const char *s2 = "World";
    cr_assert_eq(asm_strcmp(s1, s2), strcmp(s1, s2));
}

Test(strcmp_tests, empty_strings)
{
    const char *s1 = "";
    const char *s2 = "";
    cr_assert_eq(asm_strcmp(s1, s2), strcmp(s1, s2));
}

Test(strcmp_tests, different_lengths)
{
    const char *s1 = "Hello";
    const char *s2 = "Hello World";
    cr_assert_eq(asm_strcmp(s1, s2), strcmp(s1, s2));
}

Test(strcmp_tests, null_strings)
{
    const char *s1;
    const char *s2;
    cr_assert_eq(asm_strcmp(s1, s2), strcmp(s1, s2));
}
