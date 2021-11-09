CC = gcc
CFLAGS = -Wall -Wextra -Werror

INCLUDES = libft.h

SHELL := /bin/bash

NAME = libft.a
SOURCES =	ctype/ft_isalnum.c\
			ctype/ft_isalpha.c\
			ctype/ft_isascii.c\
			ctype/ft_isdigit.c\
			ctype/ft_isprint.c\
			ctype/ft_tolower.c\
			ctype/ft_toupper.c\
			extra/ft_itoa.c\
			extra/ft_split.c\
			list/ft_lstadd_back.c\
			list/ft_lstadd_front.c\
			list/ft_lstclear.c\
			list/ft_lstdelone.c\
			list/ft_lstiter.c\
			list/ft_lstlast.c\
			list/ft_lstmap.c\
			list/ft_lstnew.c\
			list/ft_lstsize.c\
			mem/ft_bzero.c\
			mem/ft_memccpy.c\
			mem/ft_memchr.c\
			mem/ft_memcmp.c\
			mem/ft_memcpy.c\
			mem/ft_memmove.c\
			mem/ft_memset.c\
			put/ft_putchar_fd.c\
			put/ft_putendl_fd.c\
			put/ft_putnbr_fd.c\
			put/ft_putstr_fd.c\
			stdlib/ft_atoi.c\
			stdlib/ft_calloc.c\
			string/ft_strchr.c\
			string/ft_strdup.c\
			extra/ft_strjoin.c\
			string/ft_strlcat.c\
			string/ft_strlcpy.c\
			string/ft_strlen.c\
			extra/ft_strmapi.c\
			string/ft_strncmp.c\
			string/ft_strnstr.c\
			string/ft_strrchr.c\
			extra/ft_strtrim.c\
			extra/ft_substr.c\
			added/ft_strcpy.c\
			added/ft_utoa.c\
			ft_printf/arguement.c\
			ft_printf/ft_char.c\
			ft_printf/ft_integer.c\
			ft_printf/ft_percentage.c\
			ft_printf/ft_pointer.c\
			ft_printf/ft_printf.c\
			ft_printf/ft_store.c\
			ft_printf/ft_string.c\
			ft_printf/ft_unsigned.c\
			ft_printf/utility.c\
			gnl/get_next_line.c\
			gnl/get_next_line_utils.c

COUNT = 0

Y = "\033[33m"
R = "\033[31m"
G = "\033[32m"
B = "\033[34m"
X = "\033[0m"
BLACK = "\033[38;2;52;52;52m"
UP = "\033[A"
CUT = "\033[K"


OBJECTS = $(SOURCES:.c=.o)

%.o : %.c
	@tput civis
	@if [ $(COUNT) -eq 0 ] ; then\
		printf $(Y)"Compiling $(NAME):\n";\
		fi;
	@$(CC) $(CFLAGS) -o $@ -c $<
	@$(eval COUNT := $(shell ls -R | grep -E "\.o" | wc -w))
	@$(eval COUNT=$(shell echo $$(($(COUNT)+1))))
	@printf "\r"; \
	x=0 ; \
	while [ $$x -ne $(COUNT) ]; do \
		printf $(G)"▇"; \
		let "x+=1"; \
	done ; \
	y=0; \
	for x in $(SOURCES); do \
		let "y+=1"; \
	done ; \
	x=$(COUNT); \
	while [ $$x -ne $$y ] ; do \
		printf " "; \
		let "x+=1"; \
	done; \
	x=$(COUNT); \
	let "x*=100"; \
	printf $(X)"| "; \
	echo -n $$((x / y)); \
	printf "%%";


all: external-target

$(NAME): $(OBJECTS)
	@printf "\n"
	@tput cnorm --normal
	@ar cr $@ $(OBJECTS)

internal-clean:
	@$(eval OBJECTS := $(shell find $(PWD) | grep -E "\.o" ))
	@tput civis;\
		size=0; \
		for d in $(OBJECTS); do\
			let "size+=1";\
		done;\
		y=0;\
		for x in $(OBJECTS); do\
			let "y+=1"; \
			i=0; \
			printf "\r";\
			while [ $$i -ne $$y ]; do \
				printf $(G)"▇"; \
				let "i+=1"; \
			done; \
			while [ $$i -ne $$size ]; do \
				let "i+=1"; \
				printf " "; \
			done; \
			printf $(X)"| ";\
			echo -n $$((y * 100 / i)); \
			printf "%%";\
			sleep 0.1; \
			rm -f $$x; \
		done;\
		printf $(X)"\n";\
		tput cnorm --normal

clean:
	@printf $(Y)"Cleaning object-files:\n"
	@bash -c "trap 'trap - SIGINT SIGTERM ERR; tput cnorm --normal; exit 1' SIGINT SIGTERM ERR; $(MAKE) internal-clean"

fclean:
	@printf $(Y)"Cleaning object-files and removing $(NAME)\n"
	@bash -c "trap 'trap - SIGINT SIGTERM ERR; tput cnorm --normal; exit 1' SIGINT SIGTERM ERR; $(MAKE) internal-clean"
	@rm -f $(NAME)

re: fclean all

#catches signals, activates cursor on interrupt
external-target:
	@bash -c "trap 'trap - SIGINT SIGTERM ERR; tput cnorm --normal; exit 1' SIGINT SIGTERM ERR; $(MAKE) $(NAME)"
