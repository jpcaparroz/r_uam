setwd("C:/Users/joao.caparroz/Documents/Eu/Pessoal/Faculdade/Curso em R/Aulas/Aula1")

getwd()


# Adição
5+5

# Subtração
4-2

# Multiplicação
3*8

# Divisão
4/2

# Resto da divisão
5%%3

# Divisão inteira
5%/%3

# Potenciar
5^3


# Definindo variavel
a<- 324

nome ="JP"
idade = 23
peso <- 89.765
sexo <- "m"
sobrenome <- "Dias Caparroz"


# Verificando tipo da variavel
class(idade)
mode(nome)
typeof(sexo)


# Ajuda com a função
?setwd()


# Funções
dir() #listar todos arquivos do environment
ls() #lista todos os objetos do environment
rm(nome) #remover objeto da memória
gc() #garbage collector (remove variaveis não utilizadas)

as.character(9888) #transforma o numero em string
as.integer("111") #transforma a string em inteiro
as.numeric(898) #transforma numero em float

computador <- scan() # atribuindo uma leitura de dados a uma variavel !não muito utilizado

print("ola") #printando string
print(sobrenome) #printando variavel
print(paste("João ", sobrenome)) #concatenando string à variavel


# Vetores
vnumero <- c(1,2,3,4)
vnumero2 <- c(6,5,4,3,2,1)

vnumero[3] #pegando um indice do vetor
vnumero[-3] #pegando todos indices menos o 3

vletras <- c('a','b', 'c')
vletras[-2]
class(vletras)

vlogico <- c(!TRUE,!FALSE)
vlogico[1]

vnumero + vnumero2 #somando vetores de inteiros
vnumero - vnumero2 #subtraindo vetores de inteiros

vSoma <- c(vnumero + vnumero2) #salvando a soma de vetores em um vetor

vPessoa <- c("João", "Caparroz")
names(vPessoa) <- c("Nome", "Sobrenome") #nomeando indices do vetor
vPessoa["Nome"]


# Coleções (Matriz)
v <- c(1:5)

matriz <- matrix(data = v, nrow = 5, ncol = 2, byrow = 1)

matriz

matriz[2:4,1] #pesquisa na matriz buscando linhas especificas
matriz[c(2,3,4),1] #pesquisa na matriz buscando linhas especificas

mnum <- 1:3

diag(mnum) #matriz diagonal
t(matriz) #matriz transposta (linhas viram colunas)
solve(3:3) #matriz quadrada (linhas == colunas)


m1 <- matrix(2:5, nr=2) #criando matriz abreviando parametros
m1

m2 <- matrix(6:9, nr=2)
m2

m1 + m2
m1%*%m2 #multiplicando matrizes

dimnames(m1) <- list(c('LA1', 'LA2'), c('Homens', 'Mulheres')) #nomeando linhas e colunhas de uma matriz

m1['LA1','Homens'] #pesquisando na matriz

rbind(m1, m2) #junção de matrizes (por linhas)
cbind(m1,m2) #junção de matriz (por colunas)
