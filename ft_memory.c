/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memory.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrhyhorn <mrhyhorn@student.21-school.ru    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/06 18:28:51 by mrhyhorn          #+#    #+#             */
/*   Updated: 2022/03/08 20:08:55 by mrhyhorn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	ft_free_split(char **split_string)
{
	int	i;

	i = -1;
	while (split_string[++i])
		free(split_string[i]);
	free(split_string);
	split_string = NULL;
}

void	ft_main_free(t_data *data)
{
	if (data->cmd1_path != NULL)
		free(data->cmd1_path);
	ft_free_split(data->cmd1);
	if (data->cmd2_path != NULL)
		free(data->cmd2_path);
	ft_free_split(data->cmd2);
	ft_free_split(data->path);
	data->path = NULL;
}
