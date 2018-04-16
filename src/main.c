#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

void		ft_cat(int fd);

int		main(int ac, char **av)
{
	int	fd;

	if (ac == 1)
	  return (0);

	fd = open(av[1], O_RDONLY);
	ft_cat(fd);
	close(fd);
	
	fd = open("./Makefile", O_RDONLY);
	close(fd);
	ft_cat(fd);

	ft_cat(-1);

	return (0);
}
