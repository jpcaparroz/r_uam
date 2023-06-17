setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Projeto2')
getwd()

# Libs
install.packages("randomForest","caret", "caTools", "class","gmodels", "ROCR", "e1071", "neuralnet")
install.packages("caret")
install.packages("caTools")
install.packages("class")
install.packages("gmodels")
install.packages("ROCR")
install.packages("e1071")
install.packages("neuralnet")

library(dplyr)
library(ggplot2)
library(readxl)
library(randomForest)
library(caret)
library(caTools)
library(class)
library(gmodels)
library(ROCR)
library(e1071)
library(neuralnet)

# Importando dataset de um arquivo
fileSource = 'C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Projeto2/files/Acoustic_Extinguisher_Fire_Dataset.xlsx'
dados <- read_excel(fileSource)

View(dados)

#Verificando nulos
sum(is.na(dados))

str(dados)
summary(dados)

summary(dados$FUEL)

#Transformando tipo de gasolina em fator
dados$FUEL <- as.factor(dados$FUEL)

nomes <- names(dados)

lapply(nomes, function(x){
  if(is.numeric(unlist(dados[x]))){
    boxplot(dados[x], main = x)
  }
})

#Floresta aleatória
dados$FUEL <- as.numeric(dados$FUEL)
dados$STATUS <- as.factor(dados$STATUS)


#amostragem
amostra <- sample.split(dados$STATUS,
                       SplitRatio = 0.8)
View(treino)

treino <- subset(dados, amostra==TRUE)
teste <- subset(dados, amostra==FALSE)

normalizar <- function(x){
  return(
    (x-min(x))/max(x)-min(x)
  )
}

dados_normalizados <- dados

dados_normalizados <- as.data.frame(
  lapply(dados_normalizados[-7],normalizar)
)

View(dados_normalizados)

floresta <- randomForest(STATUS ~ . ,
                         data=dados,
                         ntree = 100,
                         nodesize = 10,
                         importance = TRUE)
varImpPlot(floresta)



#k-nearest neighbors
dados_normalizados <- dados
amostra <- sample.split(dados_normalizados$STATUS,
                        SplitRatio = 0.8)

treino_m <- subset(dados_normalizados, amostra==TRUE)
teste_m <- subset(dados_normalizados, amostra==FALSE)

modelo_knn <- knn(train= treino_m[,-7],
                  test=teste_m[,-7],
                  cl= treino_m$STATUS,
                  k=5
                  )

confusionMatrix(modelo_knn,teste_m$STATUS)
CrossTable(x=teste_m$STATUS,
           y=modelo_knn,
           prop.chisq = FALSE)

detach(package:neuralnet)
pred <- prediction(as.numeric(modelo_knn),
                   as.numeric(teste_m$STATUS))
perf <- performance(pred, "tpr", "fpr")

plot(perf, col = rainbow(10))

