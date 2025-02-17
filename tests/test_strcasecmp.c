/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_strcasecmp.c
*/

#include <criterion/criterion.h>
#include <strings.h>
#include "../includes/libasm.h"

Test(strcasecmp_tests, identical_strings)
{
    const char *s1 = "hello";
    const char *s2 = "hello";
    cr_assert_eq(asm_strcasecmp(s1, s2), strcasecmp(s1, s2));
}

Test(strcasecmp_tests, different_case)
{
    const char *s1 = "Hello";
    const char *s2 = "hElLo";
    cr_assert_eq(asm_strcasecmp(s1, s2), strcasecmp(s1, s2));
}

Test(strcasecmp_tests, different_strings)
{
    const char *s1 = "hello";
    const char *s2 = "world";
    cr_assert_eq(asm_strcasecmp(s1, s2) < 0, strcasecmp(s1, s2) < 0);
}

Test(strcasecmp_tests, empty_strings)
{
    const char *s1 = "";
    const char *s2 = "";
    cr_assert_eq(asm_strcasecmp(s1, s2), strcasecmp(s1, s2));
}