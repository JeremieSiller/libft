/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jsiller <jsiller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/03 19:09:38 by jsiller           #+#    #+#             */
/*   Updated: 2021/11/08 18:43:34 by jsiller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft.h"

static int	get_len(char *str, char d)
{
	int	i;
	int	count;

	i = 0;
	count = 0;
	while (str[i])
	{
		if (str[i] != d && (str[i + 1] == 0 || str[i + 1] == d))
			count++;
		i++;
	}
	return (count);
}

static char	**allocate_arr(char *str, char d)
{
	char	**arr;

	if (!str)
		return (NULL);
	arr = ft_calloc(sizeof(char *), get_len(str, d) + 1);
	return (arr);
}

static char	**free_arr(char **arr)
{
	int	i;

	i = 0;
	while (arr[i])
	{
		free(arr[i]);
		i++;
	}
	free(arr);
	return (NULL);
}

char	**ft_split(char *str, char d)
{
	char	**ret;
	char	**tmp;
	int		i;

	ret = allocate_arr(str, d);
	if (!ret)
		return (0);
	tmp = ret;
	while (*str)
	{
		i = 0;
		while (*str == d)
			str++;
		while (str[i] && str[i] != d)
			i++;
		if (i == 0)
			break ;
		*ret = ft_substr(str, 0, i);
		if (!*ret)
			return (free_arr(tmp));
		while (*str != d && *str)
			str++;
		ret++;
	}
	return (tmp);
}
