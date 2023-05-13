setwd("C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula3")

## Fatores
vetor1 <- c(1001, 1002, 1003, 1004, 1005)
vetor2 <- c(0, 1, 1, 0, 2)
vetor3 <- c("Verde", "Laranja", "Azul", "Laranja", "Verde")

df <- data.frame(vetor1, vetor2, vetor3)

# Verficia se alguma coluna do dataframe é fator
str(df)

# Transforma coluna em fator (associa um número para cada valor no dataframe)
df$vetor3 <- factor(df$vetor3)

# Usando vetor para transformar em fator outro vetor
df$categoria2 <- factor(df$vetor2, labels = c("Divorciado", "Casado", "Solteiro"))

df2 <- data.frame(var1 <- c(1,2,3), var2 <- c('a', 'b', 'c'))

df2$var2 <- factor(df2$var2, levels <- c('a', 'b', 'c'), labels <- c('Treatment A: XYZ', 'Treatment B: YZX', 'Treatment C: ZYX'))

# Visualizando dataframe
View(df2)

conjunto <- c('AA', 'BB', 'CA', 'AC', 'BA')

fatorOrder <- factor(conjunto, levels <- c('CA', 'BA', 'AA', 'BB', 'AC'), ordered <- T)

fatorOrder <- factor(conjunto)

fatorOrder

class(fatorOrder)

is.ordered(fatorOrder)

as.numeric(fatorOrder)

order(fatorOrder)

table(fatorOrder)

View(fatorOrder)

## Lendo arquivos
setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula3')
getwd()

# Criando variavel com arquivo
iris <- read.csv('files/iris.csv')
View(iris)
dim(iris)
str(iris)

# Carregando arquivo já definindo strings como fator
iris2 <- read.csv('files/iris.csv', stringsAsFactors = T)
View(iris2)
dim(iris2)
str(iris2)

# Salvando váriavel como arquivo
write.csv(iris2, 'files/iris2.csv')

# Para xlsx precisa de uma library nova
install.packages('readxl')
library(readxl)

# Exibindo sheets dentro do xlsx
excel_sheets(xlsx)

xlsx <- 'files/PopUrbana.xlsx'

# Lendo excel
read_excel(xlsx)

# Lendo excel por sheet
read_excel(xlsx, sheet = 'Period2')
read_excel(xlsx, sheet = 4) # Forçando o erro pois no xlsx não existe a sheet 4


# Carregar xlsx em um dataframe
df <- read_excel(xlsx, sheet = 3)
View(df)


## Gráficos
height <- c(40:50)
width <- c(0:10)

plot(height, width,
     type ='l', # Tipo do gráfico - p,l,b,o,h,s,n
     main = 'Teste Gráfico', # Titulo do gráfico
     ylab = 'Altura',xlab = 'Largura', # Altura x Largura
     col = 'orange', # Cor dos dados
     col.main = 'blue', # Cor do titulo
     cex.main = 1.5) # Tamanho do titulo

plot(lynx)

# Gráfico de dispersão
x <- rnorm(10,5,7)
y <- rpois(10,7) 
z <- rnorm(10,6,7)
a <- rpois(10,9)

plot(x,y,
     type = 'p',
     cex = 2, # escala dos pontos
     col = 123,
     pch = 10, # tamanho dos pontos do gráfico
     main = 'Dipsersão',
     col.main = 'green')

# Box Plot
attach(sleep)
boxplot(
  data = sleep, # Dados
  extra ~ group, # Relacionando variaveis com ~
  main = "Sono | BoxPlot",
  col.main = 'red',
  ylab = 'Horas',
  xlab ='Drogas'
)

summary(sleep$extra)
View(sleep)


