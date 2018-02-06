#* ************************************************************************** *#
#*                                                                            *#
#*                                                        :::      ::::::::   *#
#*   Makefile                                           :+:      :+:    :+:   *#
#*                                                    +:+ +:+         +:+     *#
#*   By: wescande <wescande@student.42.fr>          +#+  +:+       +#+        *#
#*                                                +#+#+#+#+#+   +#+           *#
#*   Created: 2016/08/29 21:32:58 by wescande          #+#    #+#             *#
#*   Updated: 2016/12/24 02:14:21 by wescande         ###   ########.fr       *#
#*                                                                            *#
#* ************************************************************************** *#

NAME		=	libfts.a

CC			=	nasm -f macho64
FLAGS		=
AR			=	ld

LEN_NAME	=	`printf "%s" $(NAME) | wc -c`
DELTA		=	$$(echo "$$(tput cols)-31-$(LEN_NAME)"|bc)

SRC_DIR		=	sources/
INC_DIR		=	include/
OBJ_DIR		=	objects/

SRC_BASE	=	ft_puts.s \
				ft_strlen.s \
				ft_isalpha.s \
				ft_isalnum.s \
				ft_isascii.s \
				ft_isprint.s \
				ft_bzero.s \
				ft_tolower.s \
				ft_toupper.s \
				ft_strcat.s \
				ft_memset.s \
				ft_memcpy.s \
				ft_strdup.s \
				main.s

SRCS		=	$(SRC_BASE:%=$(SRC_DIR)%)
OBJS		=	$(addprefix $(OBJ_DIR), $(SRC_BASE:.s=.o))
NB			=	$(words $(SRC_BASE))
INDEX		=	0
SHELL		:=	/bin/bash

all :			$(NAME)

$(NAME) :		$(OBJ_DIR) $(OBJS)
	@ld $(OBJS) -macosx_version_min 10.8 -lSystem -o $(NAME)
	@printf "\r\033[38;5;117m✓ MAKE $(NAME)\033[0m\033[0m\n"

$(OBJ_DIR) :
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o :		$(SRC_DIR)%.s | $(OBJ_DIR)
	@$(eval DONE=$(shell echo $$(($(INDEX)*20/$(NB)))))
	@$(eval PERCENT=$(shell echo $$(($(INDEX)*100/$(NB)))))
	@$(eval TO_DO=$(shell echo $$((20-$(INDEX)*20/$(NB) - 1))))
	@$(eval COLOR=$(shell list=(160 196 202 208 215 221 226 227 190 154 118 82 46); index=$$(($(PERCENT) * $${#list[@]} / 100)); echo "$${list[$$index]}"))
	@printf "\r\033[38;5;%dm⌛ [%s]: %2d%% `printf '█%.0s' {0..$(DONE)}`%*s❙%*.*s\033[0m\033[0m" $(COLOR) $(NAME) $(PERCENT) $(TO_DO) "" $(DELTA) $(DELTA) "$(shell echo "$@" | sed 's/^.*\///')"
	@$(CC) $(FLAGS) $< -o $@ -I $(INC_DIR)
	@$(eval INDEX=$(shell echo $$(($(INDEX)+1))))

clean :
	@if [ -e $(OBJ_DIR) ];									\
	then													\
		rm -rf $(OBJ_DIR);									\
		printf "\r\033[38;5;202m✗ $(NAME)\033[0m\033[0m\n";	\
	fi;

fclean :		clean
	@if [ -e $(NAME) ];										\
	then													\
		rm -rf $(NAME);										\
		printf "\r\033[38;5;196m✗ $(NAME)\033[0m\033[0m\n";	\
	fi;

re :			fclean all

.PHONY :		fclean clean re