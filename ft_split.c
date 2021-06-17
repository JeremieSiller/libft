/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jsiller <jsiller@student.42heilbronn.de    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/03 19:09:38 by jsiller           #+#    #+#             */
/*   Updated: 2021/06/16 17:42:58 by jsiller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <string.h>

static int	ft_protected(char ***ret, char *str, int (*arr)[3])
{
	if (!str)
		return (0);
	*ret = malloc(sizeof(char *) * ft_strlen(str) + 1);
	if (!*ret)
		return (0);
	(*arr)[0] = 0;
	(*arr)[1] = 0;
	return (1);
}

char	**ft_split(char *str, char c)
{
	char	**ret;
	int		arr[3];

	if (!ft_protected(&ret, str, &arr))
		return (0);
	while (str[arr[0]])
	{
		while (str[arr[0]] == c && str[arr[0]])
			arr[0]++;
		if (str[arr[0]])
		{
			arr[2] = arr[0];
			while (str[arr[0]] != c && str[arr[0]])
				arr[0]++;
			ret[arr[1]] = malloc(arr[0] - arr[2] + 1);
			ft_memcpy(ret[arr[1]], &(str[arr[2]]), arr[0] - arr[2]);
			ret[arr[1]][arr[0] - arr[2]] = 0;
			arr[1]++;
		}
		if (str[arr[0]])
			arr[0]++;
	}
	ret[arr[1]] = 0;
	return (ret);
}
