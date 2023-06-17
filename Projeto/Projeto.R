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


# #Pergunta 3: O aumento na escala de vida 
# tem algum efeito na média de felicidade 
# entre o público em geral? Qual a 
# correlação entre essas duas variáveis?

View(
  media_felicidade <- dados %>%
  select(Pais, Ano, Nivel_Vida,Emocoes_Positivas) %>%
  group_by(Pais, Ano) %>%
  summarise(Media_vida_felicidade = mean(Nivel_Vida),
            Media_emocoes_positivas = mean(Emocoes_Positivas))
)

#plotando
ggplot(media_felicidade,
       aes(x= Media_vida_felicidade,
           y= Media_emocoes_positivas)) +
  geom_point()+
  geom_smooth(method = lm) +
  ggtitle("Média de vida/emocões positivas")

#teste com pearson
cor.test(x= media_felicidade$Media_vida_felicidade,
         y= media_felicidade$Media_emocoes_positivas,
         method = 'pearson')


#Pergunta 4: O país com o menor índice de 
# suporte social tem maior percepção de corrupção em
#relação às empresas e ao governo no país?

View(
  pais_menor <- dados %>%
  select(Pais, Suporte_Social,Percepcao_Corrupcao) %>%
  group_by(Pais) %>%
  summarise(media_suporte = mean(Suporte_Social),
            media_corrupcao = mean(Percepcao_Corrupcao)) %>%
    na.omit()
)

min(pais_menor$media_suporte)
max(pais_menor$media_suporte)

ggplot(pais_menor,
       aes(media_suporte)) +
  geom_histogram(bins = 20, fill = "white", color = "black") +
  geom_density(fill = "grey")

View(
 menor <-  pais_menor[
    min(pais_menor$media_suporte) == pais_menor$media_suporte,]
)

paste(mean(menor$media_corrupcao > pais_menor$media_corrupcao) * 100,"%")


#Pergunta 5: Pessoas generosas são mais felizes?
ggplot(dados,
       aes(x = Indice_Generosidade,
       y = Emocoes_Positivas)) +
  geom_point() +
  geom_smooth(method = lm)

cor.test(x= dados$Indice_Generosidade,
         y= dados$Emocoes_Positivas,
         method= "pearson")
