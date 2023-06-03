setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Projeto')
getwd()

# Libs
library(dplyr)
library(ggplot2)

# Importando dataset de um arquivo
fileSource = 'C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Projeto/files/dataset.csv'
dados <- read.csv(fileSource)

View(dados)
str(dados)
summary(dados)

# Verificando null's
paste('Existem: ',sum(is.na(dados)), ' nulls no arquivo')

# Verificando linhas com dados completos
paste('Existem: ', sum(complete.cases(dados)), ' dados completos no arquivo')

# Verificando % de completude dos dados
paste(round(sum(complete.cases(dados))/nrow(dados)*100), '% do arquivo está completo')

# Renomeando colunas do arquivo
names(dados) <- c("Pais","Ano","Nivel_Vida", "PIB_Per_Capta", "Suporte_Social", 
                  "Expectativa_Vida","Indice_Liberdade", "Indice_Generosidade", 
                  "Percepcao_Corrupcao", "Emocoes_Positivas","Emocoes_Negativas" )

# Removendo nulls
dadosF <- na.omit(dados)
paste(sum(complete.cases(dadosF))/nrow(dadosF)*100, '% do arquivo está completo')

# Quantidade de linhas por Pais
View(
  sort(
    table(dadosF$Pais),
    decreasing = TRUE
  )
)

# Quantidade de linhas por ano
View(
  sort(
    table(dadosF$Ano),
    decreasing = TRUE
  )
)

# Removendo valores baixos
dadosF <- dadosF [
  dadosF$Ano!=2005 &
    dadosF$Ano!=2006 &
    dadosF$Ano!=2007 &
    dadosF$Ano!=2020,
]


# PIB tem relação com a expectativa de vida?
boxplot(dadosF$PIB_Per_Capta)
boxplot(dados$Expectativa_Vida)

ggplot(dadosF, aes(x=PIB_Per_Capta,
                   y=Expectativa_Vida)) +
                   geom_point() +
                   geom_smooth(method = 'lm')


cor.test(x = dadosF$PIB_Per_Capta,
         y = dadosF$Expectativa_Vida)


# Corrupção x escala de vida
boxplot(dadosF$Percepcao_Corrupcao)
boxplot(dadosF$Nivel_Vida)

ggplot(dadosF, aes(x = Nivel_Vida,
                   y = Percepcao_Corrupcao)) +
                   geom_point() +
                   geom_smooth(method = 'lm')

cor.test(x = dadosF$Nivel_Vida,
         y = dadosF$Percepcao_Corrupcao)
