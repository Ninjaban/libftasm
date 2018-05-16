#!/bin/sh

ft_find()
{
	result=$(find ./sources -name $1)
	
	if [[ -n ${result} ]]
	then
	    printf "\033[38;5;2m✓ \033[38;5;27m$1\033[0m\n"
	else
	    printf "\033[38;5;1m✗ \033[38;5;27m$1\033[0m\n"
	fi
}

printf "\033[38;5;119m*** Part 1 ***\033[0m\n"

ft_find ft_bzero.s
ft_find ft_strcat.s
ft_find ft_isalpha.s
ft_find ft_isdigit.s
ft_find ft_isalnum.s
ft_find ft_isascii.s
ft_find ft_isprint.s
ft_find ft_toupper.s
ft_find ft_tolower.s
ft_find ft_puts.s

printf "\n\033[38;5;119m*** Part 2 ***\033[0m\n"

ft_find ft_strlen.s
ft_find ft_memset.s
ft_find ft_memcpy.s
ft_find ft_strdup.s

printf "\n\033[38;5;119m*** Part 3 ***\033[0m\n"

ft_find ft_cat.s

printf "\n\033[38;5;119m*** Bonus ***\033[0m\n"

ft_find ft_fputstr.s
ft_find ft_putstr.s
ft_find ft_islower.s
ft_find ft_isupper.s

