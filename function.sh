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

ft_usage()
{
    printf "\033[38;5;33mUsage : sh function.sh [...]\033[0m\n\n"
    printf "\033[38;5;214m--help\033[0m\t\tPrint this usage.\n"
    printf "\033[38;5;214m--all\033[0m\t\tCheck all functions and launch unit tests.\n"
    printf "\033[38;5;214m--functions\033[0m\tCheck all functions present.\n"
    printf "\033[38;5;214m--tests\033[0m\t\tLaunch unit tests.\n"
    exit
}

ft_functions()
{
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
}

ft_tests()
{
    make tests
    ./tests
}

doSomething=0

if [[ $# -eq 0 ]]
then
    ft_usage
fi

for variable in $@
do
    if [[ $variable = "--help" ]]
    then
	doSomething=1
	ft_usage
	exit
    fi
done

for variable in $@
do
    if [[ $variable = "--all" ]]
    then
	doSomething=1
	ft_functions
	ft_tests
	exit
    fi
done

for variable in $@
do
    if [[ $variable = "--function" ]]
    then
	doSomething=1
	ft_functions
	break
    fi
done

for variable in $@
do
    if [[ $variable = "--tests" ]]
    then
	doSomething=1
	ft_tests
	break
    fi
done

if [[ ${doSomething} -eq 0 ]]
then
    ft_usage
fi
