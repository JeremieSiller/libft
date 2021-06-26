CC = gcc
CFLAGS = -Wall -Wextra -Werror -c

INCLUDES = libft.h

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
			string/ft_strjoin.c\
			string/ft_strlcat.c\
			string/ft_strlcpy.c\
			string/ft_strlen.c\
			string/ft_strmapi.c\
			string/ft_strncmp.c\
			string/ft_strnstr.c\
			string/ft_strrchr.c\
			string/ft_strtrim.c\
			string/ft_substr.c

OBJECTS = $(SOURCES:.c=.o)

all: $(NAME)

bonus: all

$(NAME): $(OBJECTS)
	ar cr $@ $(OBJECTS)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)

re: fclean all
