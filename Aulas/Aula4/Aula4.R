setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula4')
getwd()

## Histograma
dados = cars$speed

hist(dados, breaks = 10,
     main = "Histograma de Velocidade")

hist(dados,labels = T, breaks = c(0,5,10,15,25,30),
     main = "Histograma de Velocidade")

hist(dados,labels = T, breaks = 10,
     main = "Histograma de Velocidade")

hist(dados,labels = T,
     ylim = c(0,10),
     breaks = 10,
     main = "Histograma de Velocidade")

## Gráfico de barras
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
colnames(dados) <- c("0", "1-150","151-300",">300")
rownames(dados) <- c("Jovem", "Adulto", "Idoso")

barplot(dados, beside = T,
        col = c('blue','orange','red'))

# Legenda do gráfico
legend('topright', pch = 1,
       col = c('blue','orange','red'),
       legend = c('Jovem', 'Adulto', 'Idoso'))

dados = iris
View(dados)

barplot(table(iris$Species, iris$Sepal.Length),
        col = c('blue', 'purple', 'gray'),
        legend = c('Setosa', 'Versicolor', 'Virginica'),
        main = 'Gráfico Iris')

# Gráfico de pizzas
fatias = c(40,20,40)

# Criando labels
paises = c('Brasil', 'Argentina', 'Chile')

# Concatenando
paises = paste(paises,fatias)

# Concatenando %
paises = paste(paises,'%', sep ='')

paises

pie(fatias,
    labels = paises,
    col = c('green', 'blue', 'red'),
    main = 'Gráfico')


## Gráficos GGPLOT
library(ggplot2)
View(mpg)

#Dispersão
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,
                           color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,
                           alpha = class)) # classe por transparencia

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,
                           shape = class)) #classe por simbolo

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl) #area de dispersão

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))#gráfico por linha

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy,
                            linetype = drv))#gráfico por linha e desc

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy,
                            color = drv,),
                            show.legend = FALSE) #gráfico de linha por cor sem desc

# Juntando gráficos
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy,
                            color = drv,),
              show.legend = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy))



## Estatistica
notas = c(6.4, 7.3, 9.8, 7.3, 7.9, 8.2, 9.1, 5.6, 8.5, 6.8) 

#média
mean(notas)

#mediana
median(notas)

#moda (retorna o numero que mais se repete)
moda = function(dados) {
  
  vetor = table(as.vector(dados))
  names(vetor)[vetor == max(vetor)]
}

tamanhos = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)

moda(tamanhos)


Maq1 = c(181.9, 180.8, 181.9, 180.2, 181.4)
Maq2 = c(180.1, 181.8, 181.5, 181.2, 182.4)
Maq3 = c(182.1, 183.7, 182.1, 180.2, 181.9)
mean(Maq1)
mean(Maq2)
mean(Maq3)


sd(Maq1)
sd(Maq2)
sd(Maq3)

#Variancia
var(Maq1)
var(Maq2)
var(Maq3)

#Ampllitude
diff(c(min(tamanhos), max(tamanhos)))
diff(range(tamanhos))

#pegando meno e maior do vetor
range(tamanhos)


num_fichas = c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)

quantile(num_fichas)

#Buscando quantil pela porcentagem
quantile(num_fichas, .10)
quantile(num_fichas, .80)
quantile(num_fichas,c(.5,1))


#Coeficiente de variação
nike <- (5.1/55.62) * 100
nike

adidas <- (3.6/24.86) * 100
adidas


#Coeficiente de assimetria
dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados,
     main = 'Número de Acidentes Diários',
     xlab = 'Acidentes',
     ylab = 'Frequência')

install.packages('e1071')
library(e1071)
resultado = skewness(dados)
resultado



