/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrhyhorn <mrhyhorn@student.21-school.ru    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/06 18:28:26 by mrhyhorn          #+#    #+#             */
/*   Updated: 2022/06/14 22:08:01 by mrhyhorn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

int	main(int argc, char **argv, char **envp)
{
	t_data	data;
	int		status;

	status = 0;
	if (argc < 5)
	{
		ft_putstr_fd("Too few arguments. ", 2);
		ft_puterror("Try this: ./pipex file1 cmd1 cmd2 file2\n");
	}
	else if (argc > 5)
	{
		ft_putstr_fd("Too many arguments. ", 2);
		ft_puterror("Try this: ./pipex file1 cmd1 cmd2 file2\n");
	}
	ft_init_struct(&data);
	ft_open_files(argv, &data);
	ft_parse_cmds(envp, argv, &data);
	status = ft_exec(&data, envp, status);
	ft_main_free(&data);
	return (status);
}
