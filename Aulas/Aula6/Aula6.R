setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula6')
getwd()


# TIDYR
install.packages('tidyr')
install.packages('dplyr')
library(tidyr)
library(dplyr)
library(ggplot2)

dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)

dados2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

dados3 <- data.frame(
  participante = c("p1","p2","p3","p4", "p5", "p6"), 
  info = c("g1m","g1m","g1f","g2m","g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15), 
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

View(dados)
View(dados2)
View(dados3)

View(
  dados %>%
    gather(Regiao, NotaFinal, Regiao_A:Regiao_B)
  )

View(
  dados2 %>%
    gather(key,time, work.T1,home.T1, work.T2, home.T2)
)

View(
  dados2 %>%
    gather(key,time, work.T1,home.T1, work.T2, home.T2) %>%
    separate(key, into = c('localidade', 'tempo'), sep = '\\.')
)


View(
  dados3 %>%
    gather(day,score, c(day1score,day2score)) %>%
    spread(day,score)
)

View(
  dados3 %>%
    gather(day, score, c(day1score, day2score)) %>%
    separate(col = info, into = c('group', 'gender'), sep = 2) %>%
    arrange(gender) %>% #ordenando por coluna
    unite(info_again, group, gender, sep='')
)

dados3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c('group', 'gender'), sep = 2) %>%
  ggplot(aes(x= day, y= score)) +
  geom_point()+
  facet_wrap(~group) +
  geom_smooth(method = 'lm', aes(group = 1), se = F)


