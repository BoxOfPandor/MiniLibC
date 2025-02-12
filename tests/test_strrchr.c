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

Test(strrchr_tests, character_exists)
{
    const char *str = "Hello, World!";
    char search = 'o';
    cr_assert_eq(asm_strrchr(str, search), strrchr(str, search));
}

Test(strrchr_tests, character_not_found)
{
    const char *str = "Hello, World!";
    char search = 'z';
    cr_assert_eq(asm_strrchr(str, search), strrchr(str, search));
}

Test(strrchr_tests, null_character)
{
    const char *str = "Hello";
    cr_assert_eq(asm_strrchr(str, '\0'), strrchr(str, '\0'));
}