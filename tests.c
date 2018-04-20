#include <stdio.h>
#include <inttypes.h>

#include <ctype.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>

#include "include/libfts.h"

#define TRUE			1
#define FALSE			0

#define DEBUG			TRUE
#define FT_DEBUG(in_context, ...)										\
	do {																\
	if (DEBUG == TRUE) {												\
		(void) printf ("DEBUG:%s:%" PRIu64 ":%s: " in_context "\n",		\
					__FILE__, (uint64_t)__LINE__, __func__,				\
					__VA_ARGS__);										\
		}																\
	} while (0)

#define TEST_BZERO		FALSE
#define TEST_CAT		TRUE
#define TEST_IS			TRUE
#define TEST_MEM		TRUE
#define TEST_PUTS		FALSE
#define TEST_STR		TRUE
#define TEST_TO			FALSE

#define READ_ENTRY		TRUE

#define SCAN_MIN		(-100)
#define SCAN_MAX		(+300)

#define STRING			"Ceci est une chaine a tester..."
#define STRING_LEN		(int)(strlen(STRING))
#define STRINGL			"Ceci est aussi une chaine a tester... Sauf qu'elle est bien plus longue que la premiere, vraiment... Je ne sais pas trop pourquoi, mais il doit y avoir une raison... Je la trouverai peut etre qui sais... Avec le temps..."
#define STRINGL_LEN		(int)(strlen(STRINGL))

#define TAB_LEN		100

char			*string = NULL;

static void		handle_segv(int sig)
{
	(void)sig;
	if (DEBUG)
		printf ("\033[38;5;2m%s : Segmentation fault\033[0m\033[0m\n", string);
	signal(SIGSEGV, SIG_DFL);
}

static void		test_bzero_crash(void)
{
	pid_t	child;
	int		status;

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		bzero(NULL, 10);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_bzero(NULL, 10);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);
}

static int		test_bzero(void)
{
	char	*s1;
	char	*s2;

	s1 = strdup(STRING);
	s2 = strdup(STRING);

	bzero(s1 + 10, 5);
	ft_bzero(s2 + 10, 5);

	if (memcmp(s1, s2, STRING_LEN) != 0)
	{
		FT_DEBUG("UNIX {%.*s}", TAB_LEN, s1);
		FT_DEBUG("FT   {%.*s}", TAB_LEN, s2);
		return (FALSE);
	}

	free(s1);
	free(s2);

	test_bzero_crash();

	return (TRUE);
}

static int		test_cat(void)
{
	int		fd;

	printf("\033[38;5;214m*** Verification visuelle ***\033[0m\033[0m\n");

	printf("\033[38;5;69m=== TEST 1 ===\033[0m\033[0m\n(fd = -1)\n");
	fd = -1;
	ft_cat(fd);

	printf("\n\033[38;5;69m=== TEST 2 ===\033[0m\033[0m\n(fd = 42)\n");
	fd = 42;
	ft_cat(fd);

	printf("\n\033[38;5;69m=== TEST 3 ===\033[0m\033[0m\n(fd = open(\"./Makefile\", O_RDONLY))\n");
	fd = open("./Makefile", O_RDONLY);
	ft_cat(fd);

	if (READ_ENTRY == TRUE)
	{
		printf("\n\033[38;5;69m=== TEST 4 ===\033[0m\033[0m\n(fd = 0)\n");
		fd = 0;
		ft_cat(fd);
	}

	printf("\033[38;5;2m*** Fin de Verification visuelle ***\033[0m\033[0m\n");
	return (TRUE);
}

static int		test_is(void)
{
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_isalnum(n) != isalnum(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_isalpha(n) != isalpha(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_isascii(n) != isascii(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_isdigit(n) != isdigit(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_islower(n) != islower(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_isprint(n) != isprint(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_isupper(n) != isupper(n))
			return (FALSE);
	return (TRUE);
}

static void		test_mem_crash(void)
{
	pid_t	child;
	int		status;

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		memset(NULL, 'A', 10);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_memset(NULL, 'A', 10);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		memcpy(NULL, STRING, STRING_LEN);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_memcpy(NULL, STRING, STRING_LEN);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		memcpy(STRING, NULL, STRING_LEN);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_memcpy(STRING, NULL, STRING_LEN);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);
}

static int		test_mem(void)
{
	char	s1[TAB_LEN];
	char	s2[TAB_LEN];

	bzero(s1, TAB_LEN);
	bzero(s2, TAB_LEN);

	memset(s1, 'A', TAB_LEN / 3);
	ft_memset(s2, 'A', TAB_LEN / 3);
	if (memcmp(s1, s2, TAB_LEN) != 0)
	{
		FT_DEBUG("UNIX {%.*s}", TAB_LEN, s1);
		FT_DEBUG("FT   {%.*s}", TAB_LEN, s2);
		return (FALSE);
	}

	memset(s1 + 13, '0', TAB_LEN / 5);
	ft_memset(s2 + 13, '0', TAB_LEN / 5);
	if (memcmp(s1, s2, TAB_LEN) != 0)
	{
		FT_DEBUG("UNIX {%.*s}", TAB_LEN, s1);
		FT_DEBUG("FT   {%.*s}", TAB_LEN, s2);
		return (FALSE);
	}

	memcpy(s1, STRING, STRING_LEN - 7);
	ft_memcpy(s2, STRING, STRING_LEN - 7);
	if (memcmp(s1, s2, TAB_LEN) != 0)
	{
		FT_DEBUG("UNIX {%.*s}", TAB_LEN, s1);
		FT_DEBUG("FT   {%.*s}", TAB_LEN, s2);
		return (FALSE);
	}

	test_mem_crash();

	return (TRUE);
}

static int		test_puts(void)
{
	char	*str;

	printf("\033[38;5;214m*** Verification visuelle ***\033[0m\033[0m\n");
	str = strdup(STRINGL);

	printf("\033[38;5;69m=== TEST 1 ===\033[0m\033[0m\n");
	puts(str);
	ft_puts(str);

	memset(str + 25, '\0', 2);

	printf("\n\033[38;5;69m=== TEST 2 ===\033[0m\033[0m\n");
	puts(str);
	ft_puts(str);

	printf("\n\033[38;5;69m=== TEST 3 ===\033[0m\033[0m\n");
	puts(str + 26);
	ft_puts(str + 26);

	printf("\n\033[38;5;69m=== TEST 4 ===\033[0m\033[0m\n");
	puts(str + 30);
	ft_puts(str + 30);

	printf("\n\033[38;5;69m=== TEST 5 ===\033[0m\033[0m\n");
	puts(NULL);
	ft_puts(NULL);

	printf("\033[38;5;2m*** Fin de Verification visuelle ***\033[0m\033[0m\n");
	return (TRUE);
}

static void		test_str_crash(void)
{
	pid_t	child;
	int		status;

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		strdup(NULL);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_strdup(NULL);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		strlen(NULL);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_strlen(NULL);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		strcat(NULL, STRING);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_strcat(NULL, STRING);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "UNIX";
		strcat(STRING, NULL);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);

	signal(SIGSEGV, &handle_segv);
	if ((child = fork()) == -1)
		return ;
	if (child == 0)
	{
		string = "FT  ";
		ft_strcat(STRING, NULL);
		if (DEBUG)
			printf ("\033[38;5;1m%s : La fonction n'a pas crash\033[0m\033[0m\n", string);
		exit(1);
	}
	waitpid(child, &status, 0);
}

static int		test_str(void)
{
	char	*s1;
	char	*s2;

	s1 = strdup(STRINGL);
	s2 = ft_strdup(STRINGL);
	if (memcmp(s1, s2, STRINGL_LEN) != 0)
	{
		FT_DEBUG("UNIX {%.*s}", STRINGL_LEN, s1);
		FT_DEBUG("FT   {%.*s}", STRINGL_LEN, s2);
		return (FALSE);
	}

	if (strlen(s1) != ft_strlen(s1))
	{
		FT_DEBUG("UNIX [%zu]", strlen(s1));
		FT_DEBUG("FT   [%zu]", ft_strlen(s1));
		return (FALSE);
	}

	memset(s1 + 20, '\0', 1);
	memset(s2 + 20, '\0', 1);

	if (strlen(s1) != ft_strlen(s1))
	{
		FT_DEBUG("UNIX [%zu]", strlen(s1));
		FT_DEBUG("FT   [%zu]", ft_strlen(s1));
		return (FALSE);
	}

	s1 = strcat(s1, STRING);
	s2 = ft_strcat(s2, STRING);
	if (memcmp(s1, s2, STRINGL_LEN) != 0)
	{
		FT_DEBUG("UNIX {%.*s}", STRINGL_LEN, s1);
		FT_DEBUG("FT   {%.*s}", STRINGL_LEN, s2);
		for (int n = 0 ; n < STRINGL_LEN ; ++ n)
		{
			FT_DEBUG("FUNCTION RETURN %d N %d VALUE {%.*s}", memcmp(s1 + n, s2 + n, STRINGL_LEN - n), n, STRINGL_LEN - n, s1 + n);
			FT_DEBUG("FUNCTION RETURN %d N %d VALUE {%.*s}", memcmp(s1 + n, s2 + n, STRINGL_LEN - n), n, STRINGL_LEN - n, s2 + n);
		}
		return (FALSE);
	}

	if (strlen(s1) != ft_strlen(s1))
	{
		FT_DEBUG("UNIX [%zu]", strlen(s1));
		FT_DEBUG("FT   [%zu]", ft_strlen(s1));
		return (FALSE);
	}

	test_str_crash();

	return (TRUE);
}

static int		test_to(void)
{
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_tolower(n) != tolower(n))
			return (FALSE);
	for (int n = SCAN_MIN ; n < SCAN_MAX ; ++ n)
		if (ft_toupper(n) != toupper(n))
			return (FALSE);

	return (TRUE);
}

int		main()
{
	printf("%s tests de la fonction ft_bzero\n", (!TEST_BZERO) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_bzero() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	printf("%s tests de la fonction ft_cat\n", (!TEST_CAT) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_cat() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	printf("%s tests des fonctions ft_is\n", (!TEST_IS) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_is() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	printf("%s tests des fonctions ft_mem\n", (!TEST_MEM) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_mem() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	printf("%s tests de la fonction ft_puts\n", (!TEST_PUTS) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_puts() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	printf("%s tests des fonctions ft_str\n", (!TEST_STR) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_str() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	printf("%s tests des fonctions ft_to\n", (!TEST_TO) ? "\033[38;5;214m~\033[0m\033[0m" : ((test_to() == TRUE) ? "\033[38;5;2m✓\033[0m\033[0m" : "\033[38;5;1m✗\033[0m\033[0m"));
	return (0);
}
