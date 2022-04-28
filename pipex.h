/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mrhyhorn <mrhyhorn@student.21-school.ru    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/06 19:59:01 by mrhyhorn          #+#    #+#             */
/*   Updated: 2022/03/09 12:37:13 by mrhyhorn         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PIPEX_H
# define PIPEX_H

# include <stdlib.h>
# include <unistd.h>
# include <string.h>
# include <fcntl.h>
# include <sys/types.h>
# include <sys/wait.h>
# include <errno.h>

typedef struct s_data {
	pid_t	pid1;
	pid_t	pid2;
	int		infile_fd;
	int		outfile_fd;
	char	**path;
	char	*cmd1_path;
	char	*cmd2_path;
	char	**cmd1;
	char	**cmd2;
}			t_data;

/*ft_commands.c*/
void	ft_parse_cmds(char **envp, char **argv, t_data *data);
char	**ft_get_path(char **envp);
char	*ft_get_cmd_path(t_data *data, char *cmd_name, int num);

/*ft_exec.c*/
int		ft_exec(t_data *data, char **envp, int status);
void	ft_first_child(t_data *data, int *pipe_fd, char **envp);
void	ft_second_child(t_data *data, int *pipe_fd, char **envp);

/*ft_memory.c*/
void	ft_main_free(t_data *data);
void	ft_free_split(char **split_string);

/*ft_open_files.c*/
void	ft_open_files(char **argv, t_data *data);

/*ft_split.c*/
char	**ft_split(const char *s, char c);

/*ft_strings.c*/
size_t	ft_strlen(const char *s);
char	*ft_substr(char const *s, unsigned int start, size_t len);
int		ft_strncmp(const char *s1, const char *s2, size_t n);
char	*ft_strdup(const char *s1);
char	*ft_strjoin(const char *s1, const char *s2);

/*ft_utils.c*/
void	ft_puterror(const char *error);
void	ft_putstr_fd(const char *str, int fd);
void	ft_init_struct(t_data *data);

#endif
