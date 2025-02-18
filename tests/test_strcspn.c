/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch [SSH: ProxMox-Devforge]
** File description:
** test_strcspn.c
*/

#include <criterion/criterion.h>
#include <string.h>
#include "../includes/libasm.h"

Test(strcspn_tests, basic_count)
{
    const char *str = "Hello World";
    const char *reject = "Wd";
    cr_assert_eq(asm_strcspn(str, reject), strcspn(str, reject));
}

Test(strcspn_tests, no_reject_chars)
{
    const char *str = "Hello World";
    const char *reject = "xyz";
    cr_assert_eq(asm_strcspn(str, reject), strcspn(str, reject));
}

Test(strcspn_tests, empty_reject)
{
    const char *str = "Hello World";
    const char *reject = "";
    cr_assert_eq(asm_strcspn(str, reject), strcspn(str, reject));
}

Test(strcspn_tests, empty_string)
{
    const char *str = "";
    const char *reject = "abc";
    cr_assert_eq(asm_strcspn(str, reject), strcspn(str, reject));
}