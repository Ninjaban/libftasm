/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcarra <jcarra@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/17 10:16:46 by jcarra            #+#    #+#             */
/*   Updated: 2018/05/17 12:54:55 by jcarra           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

void		ft_bzero(void *s, size_t n);
void		ft_cat(int fd);
int		ft_isalnum(int c);
int		ft_isalpha(int c);
int		ft_isascii(int c);
int		ft_isdigit(int c);
int		ft_islower(int c);
int		ft_isprint(int c);
int		ft_isupper(int c);
void		*ft_memcpy(void *dest, const void *src, size_t n);
void		*ft_memset (void *s, int c, size_t n);
int		ft_memcmp (const void *s1, const void *s2, size_t n);
int		ft_puts(const char *s);
void		ft_putstr(const char *s);
void		ft_fputstr(int fd, const char *s);
char		*ft_strcat(char *dest, const char *src);
char		*ft_strdup(const char *s);
size_t		ft_strlen(const char *s);
int		ft_tolower(int c);
int		ft_toupper(int c);

#endif
