/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_exec.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrhyhorn <mrhyhorn@student.21-school.ru    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/06 18:28:47 by mrhyhorn          #+#    #+#             */
/*   Updated: 2022/03/08 20:36:24 by mrhyhorn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	ft_first_child(t_data *data, int *pipe_fd, char **envp)
{
	if (dup2(data->infile_fd, STDIN_FILENO) == -1)
		ft_puterror("Error : dup2 of infile in first child\n");
	close(data->infile_fd);
	if (dup2(pipe_fd[1], STDOUT_FILENO) == -1)
		ft_puterror("Error : dup2 of pipe in first child\n");
	close(pipe_fd[0]);
	if (data->cmd1_path)
		execve(data->cmd1_path, data->cmd1, envp);
	exit(EXIT_FAILURE);
}

void	ft_second_child(t_data *data, int *pipe_fd, char **envp)
{
	if (dup2(pipe_fd[0], STDIN_FILENO) == -1)
		ft_puterror("Error : dup2 of pipe in second child\n");
	close(pipe_fd[1]);
	if (dup2(data->outfile_fd, STDOUT_FILENO) == -1)
		ft_puterror("Error : dup2 of outfile in second child\n");
	close(data->outfile_fd);
	if (data->cmd2_path)
		execve(data->cmd2_path, data->cmd2, envp);
	exit(127);
}

int	ft_exec(t_data *data, char **envp, int status)
{
	int	pipe_fd[2];

	if ((pipe(pipe_fd)) == -1)
		ft_puterror("Error : pipe\n");
	if (data->infile_fd >= 0)
	{
		data->pid1 = fork();
		if (data->pid1 == -1)
			ft_puterror("Error : first fork\n");
		if (data->pid1 == 0)
			ft_first_child(data, pipe_fd, envp);
	}
	data->pid2 = fork();
	if (data->outfile_fd >= 0)
	{
		if (data->pid2 == -1)
			ft_puterror("Error : second fork\n");
		if (data->pid2 == 0)
			ft_second_child(data, pipe_fd, envp);
	}
	close(pipe_fd[0]);
	close(pipe_fd[1]);
	waitpid(data->pid1, &status, 0);
	waitpid(data->pid2, &status, 0);
	return (WEXITSTATUS(status));
}
