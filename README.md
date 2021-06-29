# LIBFT - my own library

## CTYPE

> The ctype.h header file of the C Standard Library declares several functions that are useful for
> testing and mapping characters.


| Prototype               | Description | Used functions     | usefull? |
| :---                    |    :----:   |          :---: | ---: |
| int ft_isalpha(int c)   | returns wether an integer is a letter or not             | none | mid |
| int ft_isalnum(int c)   | returns wether an integer is aplhanummerical or not      | none | mid |
| int ft_isalascii(int c) | returns wether an integer is an ascii-value or not       | none | mid |
| int ft_isprint(int c)   | returns wether an integer is printable or not            | none | mid |
| int ft_isdigit(int c)   | returns wether an integer is a digit or not              | none | mid |
| int ft_tolower(int c)   | returns an uppercase letter as a lowercase letter        | none | mid |
| int ft_toupper(int c)   | returns a lowercase letter as an uppercase letter        | none | mid |

## STRINGS (mem-functions)


> The strings.h header file of the C Standard Library declares several functions that are useful for
> manipulating any type of arrays (but bytewise).


| Prototype               | Description | Used functions     | useful? |
| :---                    |    :----:   |          :---: |          ---: |
| void ft_bzero(void *s, size_t n)                                | sets all bytes of s (any datatype) to 0                | none | mid |
| void *ft_memccpy(void *dst, const void *src, int c, size_t n)   | copys n bytes from src to dst until it hits c          | none | low |
| void *ft_memchr(const void *s, int c, size_t n)                 | finds c in s (range of n)                              | none | mid |
| int ft_memcmp(const void *s1, const void *s2, size_t n)         | returns the first difference between s1 and s2         | none | mid |
| void *ft_memcpy(void *dst, const void *src, size_t n)           | copies n bytes from src to dst                         | none | high|
| void 	*ft_memmove(void *dst, const void *src, size_t len)       | same as memcpy but handles overlaps                    | none | high|
| void	*ft_memset(void *b, int c, size_t len)                    | set len bytes of b to c                                | none | mid |


> Most useful functions: memcpy/memmove. Memcyp and Memmove are awesome because you can even use it for n-dimnesional arrays. Be careful and check that you pass the correct size. If you want to copy for example a whole array like this int arr[8][8] you would pass sizeof(int) * (8 * 8) for the paramter n\len.


## PUTFUNCTIONS


> The putfuntions are usefule to write to different filedescriptors and therefore into files. If you finished ft_printf these functions wont be usefule to write to stdout anymore. A filedescriptor has to be bigger than -1. FD = 0 is for standard input. FD = 1 is for standard output. FD = 2 is for standard error. FD > 2 is for a file (which was opened with open).


| Prototype               | Description | Used functions     | useful? |
| :---                    |    :----:   |          :---: | ---: |
| void ft_putchar_fd(char c, int fd)   | writes a char to fd                  | write | mid |
| void ft_putstr_fd(char *s, int fd)   | writes a string to fd                | write | mid |
| void ft_putendl_fd(char *s, int fd)  | writes a string and a new line to fd | write | low |
| void	ft_putnbr_fd(int n, int fd)    | writes a integer to fd               | write | mid |


> most useful function: ft_putnbr_fd is useful to write numbers which isnt that easy without printf. 


## STDLIB


> The stdlib.h header defines four variable types, several macros, and various functions for performing general functions.


| Prototype               | Description | Used functions     | useful? |
| :---                    |    :----:   |          :---: | ---: |
| int ft_atoi(const char *str)                | returns a string as an integer                                                    | none   | high |
| void	*ft_calloc(size_t count, size_t size))| returns an allocated pointer of size count * len and sets mem to 0                | malloc | mid |

> most usefule function: ft_aoti. ft_atoi is extremely useful in many projects. In ft_printf you will probably use it a lot

[//]: <| I recommend adding realloc here | realloc gives a pointer more memory withpout loosing its value               | malloc, free | high |> 


## STRING (NOT STRING***S***)


>The string.h header defines one variable type, one macro, and various functions for manipulating arrays of characters.


| Prototype               | Description | Used functions     | useful? |
| :---                    |    :----:   |          :---: |          ---: |
| char *ft_strchr(const char *s, int c)                          | finds c in s, returns 0 if not found                                  | none   | high     |
| char *ft_strrchr(const char *s, int c)                         | finds c in s starting from the back (return same as strchr)           | none   | mid      |
| char *ft_strdup(const char *src)                               | duplicates src (Check if NULL is returned!!)                          | malloc | high     |
| char *ft_strjoin(char const *s1, char const *s2)               | creates new string out of concatnation of s1 and s2                   | malloc | high     |
| size_t ft_strlcat(char *dst, const char *src, size_t dstsize)  | adds dstzie - strlen(dstzie) - 1 chars to dst from src                | none   | mid      |
| size_t ft_strlcpy(char *dst, const char *src, size_t dstsize)  | copys dstzie - 1 chars from dst to src                                | none   | mid      |
| char *ft_strmapi(char const *s, char (*f)(unsigned int, char)) | apllies function f on every char  of s                                | none   | -100     |
| size_t ft_strlcpy(char *dst, const char *src, size_t dstsize)  | returns of first difference of src and dst (0 if no difference accured| none   | high     |
| size_t ft_strlen(const char *s)                                | returns the length of a string s                                      | none   | overkill |
| char *ft_strnstr(const char *haystack, const char *needle, size_t len) | finds the needle in the haystack                              | none   | mid      |
| char *ft_substr(char const *s, unsigned int start, size_t len) | creates a substring of s from start to start + len                    | malloc | mid      |
| char	*ft_strtrim(char const *s1, char const *set)             | creates a trimmed substring of *s without chars in set                | malloc | mid      |

> Most useful functions: ft_strlen is probably my most used function. Theres a lot of cases where you need a string lentgh. 
> ft_strdup and ft_strjoin are also extremley useful. If they are working porperly you almost cant do nothing wrong with them. 
> ft_strchr is also really nice to use if you want to know if a string contains a character (if it doesnt 0 is returned).

> Hint: whenever you use a function which uses malloc, always check if the function returns NULL in this case something went wrong. At that point your function/programm needs to end immediatlety AFTER you freed all pointers that have been allocated before and could create a leak. Also be carefule and dont malloc something that has been allocated before this can happen if you use ft_strdup because its not visible on a first look.

## LIST-FUNCTIONS

> The lst-funtcions allow you to manipulate and use lists. Lists are quiet useful if you dont know the final length of an array because you can just append as many nodes as you until you run out of memory. 

```c
typedef struct 	s_list
{
	void			*content;
	struct s_list	*next;
}				t_list;
```

| Prototype               | Description | Used functions     | useful? |
| :---                    |    :----:   |          :---: |          ---: |
| void ft_lstadd_back(t_list **lst, t_list *new)                | adds node new to tehe end of lst                                      | none   | high     |
| void ft_lstadd_front(t_list **lst, t_list *new)               | adds node new to the front of lst                                     | none   | high     |
| void ft_lstclear(t_list **lst, void (*del)(void*))            | deletes and frees every node of lst                                   | free   | mid      |
| void ft_lstdelone(t_list *lst, void (*del)(void*))            | deletes and frees one node                                            | free   | mid      |
| void ft_lstiter(t_list *lst, void (*f)(void *))               | apllies function f on the content of every node                       | none   | low      |
| t_list *ft_lstlast(t_list *lst)                               | return the last node of lst                                           | none   | mid      |
| t_list *ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *)) | creates new list out of apllication of on content           | free   | useless  |
| t_list *ft_lstnew(void *content)                              | creates a new and give the paramter to the conten                     | malloc | high     |
| int ft_lstsize(t_list *lst)                                   | returns the size of list                                              | none   | mid      |


> most useful funtions are probably ft_lstadd_back/ft_lstadd_front and ft_lstnew. Although excpet of ft_lstmap every function is pretty useful if you are using lists.
