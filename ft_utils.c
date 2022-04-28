/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_utils.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrhyhorn <mrhyhorn@student.21-school.ru    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/06 18:29:10 by mrhyhorn          #+#    #+#             */
/*   Updated: 2022/03/09 12:37:10 by mrhyhorn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	ft_init_struct(t_data *data)
{
	data->path = NULL;
	data->cmd1_path = NULL;
	data->cmd2_path = NULL;
	data->cmd1 = NULL;
	data->cmd2 = NULL;
}

void	ft_putstr_fd(const char *str, int fd)
{
	int	i;

	i = 0;
	while (str[i] != '\0')
	{
		write(fd, &str[i], 1);
		i++;
	}
}

void	ft_puterror(const char *error)
{
	ft_putstr_fd(error, 2);
	exit(EXIT_FAILURE);
}
