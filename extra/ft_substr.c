/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jsiller <jsiller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/03 18:01:27 by jsiller           #+#    #+#             */
/*   Updated: 2021/11/08 15:22:55 by jsiller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft.h"

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	char	*str;
	size_t	i;

	if (!s)
		return (0);
	str = malloc(len + 1);
	if (!str)
		return (NULL);
	if (start >= ft_strlen(s))
	{
		str[0] = 0;
		return (str);
	}
	if (!str || !s)
		return (0);
	i = 0;
	while (s[start] && i < len)
		str[i++] = s[start++];
	str[i] = '\0';
	return (str);
}
