CC = gcc
CFLAGS = -Wall -Wextra -Werror -c

INCLUDES = libft.h

NAME = libft.a
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

all: $(NAME)

bonus: all

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@ -I $(INCLUDES)
	
$(NAME): $(OBJECTS)
	ar cr $@ $(OBJECTS)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)

re: fclean all
