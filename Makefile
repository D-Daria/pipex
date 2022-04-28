NAME = pipex

SRCS_DIR = ./srcs/

SRCS_FILES = pipex.c\
			ft_commands.c\
			ft_exec.c\
			ft_memory.c\
			ft_open_files.c\
 			ft_split.c\
			ft_strings.c\
 			ft_utils.c

HEADER = -I ./

OBJS = $(patsubst %.c,%.o, $(SRCS_FILES))
D_FILES = $(patsubst %.c,%.d, $(SRCS_FILES))

CC = cc
CFLAGS = -Wall -Wextra -Werror
SANIT_FLAGS = gcc $(CFLAGS) -g -fsanitize=address

.PHONY : all sanit clean fclean re

all : $(NAME)

$(NAME) : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%.o : %.c
	$(CC) $(CFLAGS) $(HEADER) -c $< -o $@ -MD

sanit : $(NAME)
	$(SANIT_FLAGS) $(OBJS) -o $(NAME)

clean :
	rm -f $(OBJS)
	rm -f $(D_FILES)

fclean : clean
	rm -f $(NAME)

re : fclean all

include $(wildcard $(D_FILES))