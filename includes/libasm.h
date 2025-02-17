/*
** EPITECH PROJECT, 2024
** B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
** File description:
** libasm.h
*/

#ifndef LIBASM_H_
#define LIBASM_H_

#include <stddef.h>

// Déclarations des fonctions assembleur sans préfixe
size_t strlen(const char *s);
char *strchr(const char *s, int c);
char *strrchr(const char *s, int c);
int strcmp(const char *a, const char *b);
int strncmp(const char *a, const char *b, size_t n);
void *memset(void *s, int c, size_t n);
void *memcpy(void *dest, const void *src, size_t n);

// Mapping pour les tests
#define asm_strlen strlen
#define asm_strchr strchr
#define asm_strrchr strrchr
#define asm_strcmp strcmp
#define asm_strncmp strncmp
#define asm_memset memset
#define asm_memcpy memcpy

#endif
