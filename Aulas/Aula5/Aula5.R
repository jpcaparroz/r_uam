setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula5')
getwd()

## Estatistica
sleep
View(sleep)

grupoDois <- sleep$group == 2

View(grupoDois)
grupoDois


# Teste Shapiro-wilk
shapiro.test(sleep$extra[grupoDois]) # p > 0.05
shapiro.test(sleep$extra[!grupoDois]) #p < 0.05

# Teste F (mesma variância - p>0.05 | ñ mesma variância p<0.05)
testeF <- var.test(extra ~ group, data = sleep)
testeF


# Teste T (não há difrença significativa entras as medias dos grupos)
testeT <- t.test(extra ~ group, data = sleep, var.equal = TRUE)
testeT


## DPLYR
library(dplyr)

csv = read.csv('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula5/files/sleep.csv')
View(csv)

str(csv)
summary(csv$sono_total)

dadosSono <- select(csv, nome, sono_total)
View(dadosSono)

View(csv %>% select(nome, sono_total))

View(select(csv, nome:pais))

# Filter
View( filter(csv, sono_total < 10))
View( filter(select(csv, pais, sono_total), sono_total > 10 ))

View(
  csv %>% select(nome, cidade, sono_total) %>%
    arrange(cidade, sono_total) %>%
    head(5)
)


plot( filter(select(csv, peso, sono_total), sono_total < 16 ),
     col = c('red', 'blue'),
     main = 'graficos')

View(
  csv %>%
    select(nome, cidade, sono_total) %>%
    arrange(cidade, desc(sono_total)) %>%
    filter(sono_total >= 10)
)


View(
  mutate(
    select(csv,nome, sono_total, peso),
    novo = sono_total / peso
  )
)

View(
  summarise(
    select(csv, sono_total),
    media = mean(sono_total),
    maior = max(sono_total),
    menor = min(sono_total),
    var = var(sono_total),
    total = n() #total de elementos
  )
)

View(
  csv %>%
    group_by(pais,cidade) %>%
    filter(sono_total > 10) %>%
      summarise(
        media = mean(sono_total),
        maior = max(sono_total),
        menor = min(sono_total),
        var = var(sono_total),
        total = n()
        )
)

