setwd('C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula2')
getwd()


# Lista bibliotecas instaladas
search()

# Instalando biblioteca personalizado (só é necessario uma vez)
install.packages('ggvis')
install.packages('ggplot2')
install.packages(c('dplyr','tidyr'))

# Carregando em memória biblioteca (toda vez que abrir R, carregar)
library(ggvis)
require(ggvis)
library(dplyr)
library(tidyr)
library(ggplot2)

# Verificando funções de uma biblioteca (ja carregada)
lsf.str('package:ggplot2')


# Estrutura de controle: if
v <- 21

if(v>20){
  print('Número maior')
} else if(v==20) {
  print('Número igual a 20')
}else{
  print('Número menor')
}

# Operador ternário
ifelse(v%%2==0, 'Par', 'Impar') # Verificando se é impar ou par pelo resto da div


# Laço de repetição
i <- 0

repeat{
  v <- v + 1
  
  if(v<50){
    print(v)
  }
}

for(i in 1:20){
  print(i)
}

for(i in 1:20){
  ifelse(i%%2==0, print('Par'),print('Impar'))
}

for(i in 1:20){
  
  if(i%%2==0){
    print(paste(i,'contando..'))
  }
  
}


while(i<10){
  i <- i + 1
  
  print(i)
}

i <- 0
soma <- 0

for(i in 1:50){
  soma = soma + i
}


for(i in 1:50){
  
  if(i%%2==0){
    soma = soma + i
    
    print(paste(soma,'contando.. (com nº pares)'))
  }

}


while(i<50){
  
  i <- i + 1
  
  if(i%%2==0){
    soma = soma + i
    
    print(paste(soma,'contando.. (com nº pares)'))
  }
  
}


# Verificando argumentos de uma função
args(sample)
args(mean)

# Trazendo valores aleatorios de uma coleção
sample(x <- c(1:50), size <- 10) 

# Valor absoluto (transforma tudo em positivo)
abs(-300)

# Soma
sum(c(1:50))

sum(1:50)

# Média
mean(1:50)

# Arredondamento
round(mean(1:50))

# Invertendo conjunto
rev(c(1:25))

# Sequencia (inicial,final,steps)
seq(c(1:5))
seq(1,7)
seq(7,1)
seq(1,5,2)
seq(5,25,5)

# Ordenar
veto <-  c(5,3,25,64,6,2)

sort(veto)

sort(veto, decreasing = T)

rev(sort(veto))

# Adicionando elemento em vetor (vetor, valor, index)
append(veto,3,4)


# Criando funções
f <- function(x){
  x + x
}

f(5)

ff <- function(x,y){
  
  result <- x/y
  return(result)
}

ff(5,2)

fd <- function(...){
  
  df <- data.frame(cbind(...))
  return(df)
}

v1 <- 1:5
v2 <- c('a','b','c')

xy <- fd(v1,v2)

xy[1]

f <- function(x,y){
  for(y in 1:50){
    x = x + y
  }
  return(x)
}

# Calculando tempo de operações
system.time(t <- sum(1:50))

?system.time(t1 <- f(0,1))



