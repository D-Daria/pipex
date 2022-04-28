/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_commands.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrhyhorn <mrhyhorn@student.21-school.ru    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/06 18:28:41 by mrhyhorn          #+#    #+#             */
/*   Updated: 2022/03/09 11:56:41 by mrhyhorn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

static int	ft_chrcmp(char c1, char c2)
{
	if (c1 == c2)
		return (1);
	return (0);
}

char	**ft_get_path(char **envp)
{
	char	**path;
	int		i;

	path = NULL;
	i = 0;
	while (envp[i])
	{
		if ((ft_strncmp(envp[i], "PATH=", 5)) == 0)
		{
			path = ft_split((envp[i] + 5), ':');
			return (path);
		}
		i++;
	}
	return (NULL);
}

static int	ft_check_access(char *cmd_path, char *arg, int num)
{
	size_t	len;

	len = ft_strlen(arg);
	if (access(cmd_path, F_OK) == -1 && num == 1)
	{
		if (ft_chrcmp(arg[len - 1], '/'))
			ft_putstr_fd("Not a directory : ", 2);
		else
			ft_putstr_fd("Command not found : ", 2);
		ft_putstr_fd(arg, 2);
		ft_putstr_fd("\n", 2);
		return (1);
	}
	else if (access(cmd_path, F_OK) == -1 && num == 2)
	{
		if (ft_chrcmp(arg[len - 1], '/'))
			ft_putstr_fd("Not a directory : ", 2);
		else
			ft_putstr_fd("Command not found : ", 2);
		ft_putstr_fd(arg, 2);
		ft_putstr_fd("\n", 2);
		return (1);
	}
	return (0);
}

char	*ft_get_cmd_path(t_data *data, char *cmd_name, int num)
{
	int		i;
	char	*temp;
	char	*join;

	if (cmd_name == NULL)
	{
		ft_putstr_fd("Command not found : \n", 2);
		return (NULL);
	}
	i = -1;
	while (data->path[++i])
	{
		join = ft_strjoin(data->path[i], "/");
		temp = ft_strjoin(join, cmd_name);
		free(join);
		if ((access(temp, X_OK)) == 0)
			return (temp);
		else
			free(temp);
	}
	ft_check_access(temp, cmd_name, num);
	return (NULL);
}

void	ft_parse_cmds(char **envp, char **argv, t_data *data)
{
	data->cmd1 = ft_split(argv[2], ' ');
	data->cmd2 = ft_split(argv[3], ' ');
	data->path = ft_get_path(envp);
	if (data->path == NULL)
		ft_putstr_fd("Error parcing paths\n", 2);
	if ((access(data->cmd1[0], X_OK)) == 0)
		data->cmd1_path = ft_strdup(data->cmd1[0]);
	else
		data->cmd1_path = ft_get_cmd_path(data, data->cmd1[0], 1);
	if ((access(data->cmd2[0], X_OK)) == 0)
		data->cmd2_path = ft_strdup(data->cmd2[0]);
	else
		data->cmd2_path = ft_get_cmd_path(data, data->cmd2[0], 2);
}
