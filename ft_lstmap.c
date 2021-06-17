/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jsiller <jsiller@student.42heilbronn.de    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/04 10:28:17 by jsiller           #+#    #+#             */
/*   Updated: 2021/06/16 17:42:58 by jsiller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*new;
	t_list	*elem;

	new = 0;
	while (lst)
	{
		elem = ft_lstnew((*f)(lst -> content));
		if (!elem)
			ft_lstclear(&new, del);
		else
			ft_lstadd_back(&new, elem);
		lst = lst->next;
	}
	return (new);
}
