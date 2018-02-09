#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

void		ft_cat(int fd);

int		main(int ac, char **av)
{
	int	fd;

	if (ac == 1)
		return (0);
	fd = open(av[1], O_RDONLY);
	ft_cat(fd);
	return (0);
}
