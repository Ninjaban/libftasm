# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcarra <jcarra@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/17 13:07:37 by jcarra            #+#    #+#              #
#    Updated: 2018/04/20 12:25:20 by jcarra           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libfts.a
TESTS		=	tests

SRC		=	ft_bzero.s	\
			ft_cat.s	\
			ft_isalnum.s	\
			ft_isalpha.s	\
			ft_isascii.s	\
			ft_isdigit.s	\
			ft_islower.s	\
			ft_isprint.s	\
			ft_isupper.s	\
			ft_memcpy.s	\
			ft_memset.s	\
			ft_puts.s	\
			ft_putstr.s	\
			ft_strcat.s	\
			ft_strdup.s	\
			ft_strlen.s	\
			ft_tolower.s	\
			ft_toupper.s

DIRSRC		=	sources/
DIRINC		=	include/
DIRLIB		=	library/
DIROBJ		=	objects/

SRCS		=	$(SRC:%=$(DIRSRC)%)
LIBS		=	$(LIB:%=$(DIRLIB)%)

OBJS		=	$(addprefix $(DIROBJ), $(SRC:.s=.o))

CC		=	nasm -f macho64
RM		=	rm -rf
ECHO		=	printf
MAKE		=	make -C

CLEAN		=	"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "
LEN		=	$$(/bin/echo -n $(NAME) | wc -c)
DELTA		=	$$(echo "$$(tput cols)-31-$(LEN)"|bc)
NB		=	$(words $(SRC))
INDEX		=	0
SHELL		=	/bin/bash

all		:	$(NAME)

$(NAME)		:	$(DIROBJ) $(OBJS)
	@$(eval OBJ_LEN=$(shell echo "$$(echo "$(NAME)" | sed 's/^.*\///')" | wc -c))
	@$(eval CLEAN_LEN=$(shell echo "$$(tput cols)-6-$(OBJ_LEN)"|bc))
	@ar rcs $(NAME) $(OBJS)
	@$(ECHO) "\r\033[38;5;040m✓ MAKE $(NAME)%.*s\033[0m\033[0m\n" $(CLEAN_LEN) $(CLEAN)

$(DIROBJ)%.o	:	$(DIRSRC)%.s | $(DIROBJ)
	@$(eval DONE=$(shell echo $$(($(INDEX)*20/$(NB)))))
	@$(eval PERCENT=$(shell echo $$(($(INDEX)*100/$(NB)))))
	@$(eval TO_DO=$(shell echo $$((20-$(INDEX)*20/$(NB) - 1))))
	@$(eval COLOR=$(shell list=(20 21 26 27 32 33 38 39 44 45 50 51); index=$$(($(PERCENT) * $${#list[@]} / 100)); echo "$${list[$$index]}"))
	@$(ECHO) "\r\033[38;5;%dm⌛ [%s]: %2d%% `printf '█%.0s' {0..$(DONE)}`%*s❙%*.*s\033[0m\033[0m" $(COLOR) $(NAME) $(PERCENT) $(TO_DO) "" $(DELTA) $(DELTA) "$(shell echo "$@" | sed 's/^.*\///')"
	@$(CC) -o $@ $<
	@$(eval OBJ_LEN=$(shell echo "$$(echo "$@" | sed 's/^.*\///')" | wc -c))
	@$(eval CLEAN_LEN=$(shell echo "$$(tput cols)-1-$(OBJ_LEN)"|bc))
	@$(ECHO) "\r\033[38;5;%dm✓ %s\033[0m\033[0m%.*s\n\033[38;5;%dm⌛ [%s]: %2d%% `printf '█%.0s' {0..$(DONE)}`%*s❙%*.*s\033[0m\033[0m"  $(COLOR) "$(shell echo "$@" | sed 's/^.*\///')"  $(CLEAN_LEN) $(CLEAN) $(COLOR) $(NAME) $(PERCENT) $(TO_DO) "" $(DELTA) $(DELTA) "$(shell echo "$@" | sed 's/^.*\///')"
	@$(eval INDEX=$(shell echo $$(($(INDEX)+1))))

$(DIROBJ)	:
	@mkdir -p $(DIROBJ)

$(TESTS)	:	all
	@gcc -Wall -Wextra -Werror tests.c $(NAME) -o $(TESTS)
	@$(ECHO) "\033[38;5;040m✓ MAKE $(TESTS)\033[0m\033[0m\n"

clean		:
	@if [ -e $(DIROBJ) ];						\
	then								\
		$(RM) $(DIROBJ);					\
		$(ECHO) "\033[38;5;202m✗ $(NAME)\033[0m\033[0m\n";	\
	fi;

fclean		:	clean
	@if [ -e $(NAME) ];						\
	then								\
		$(RM) $(NAME);						\
		$(ECHO) "\033[38;5;196m✗ $(NAME)\033[0m\033[0m\n";	\
	fi;
	@if [ -e $(TESTS) ];						\
	then								\
		$(RM) $(TESTS);						\
		$(ECHO) "\033[38;5;196m✗ $(TESTS)\033[0m\033[0m\n";	\
	fi;

re		:	fclean all

.PHONY		:	all fclean clean re
