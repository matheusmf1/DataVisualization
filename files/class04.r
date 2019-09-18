# função str mostra informações sobre a estrutura de uma variável 
# função class que retorna a classe de dados de uma variável


# data type class - factor - variaveis qualitativas, podem assumir niveis ( valores ),
# representam qualidades ou caracteristicas


# Exemplos de transformações de classes de dados
V = c(1,0,4,5,0,0,4)
class(V)
V = as.integer(V)
class(V)

> R1 = as.numeric(V)
> R2 <- as.logical(V)
> R3 <- as.character(V)
> R4 <- as.factor(V)
> R5 <- as.integer("A")


#  função by é capaz de subdividir o dataframe e aplicar uma função sele- cionada em cada categoria. 
# by(variável,categoria,função)

> D <- read.csv2("alunos.csv")
> D$Sono <- as.factor(D$Sono)

# Cálculos separados por categoria
> by(D$Idade,D$Genero,mean)
> by(D$Peso,D$Sono,summary)

# Gráficos separados por categoria
> boxplot(D$Altura~D$Genero)
> boxplot(D$Peso~D$Municipio)
> boxplot(D$Altura~D$Genero*D$Municipio)

#Inserir uma variavel em uma DataFrame - dataframe$nova_variável <- valores
> D$Altura_em_m <- D$Altura/100
> D$Adulto <- D$Idade >= 21
> D$Matriculado <- TRUE

#ifelse(condição, valor_TRUE, valor_FALSE)
> cond <- D$Municipio == "SCS" & D$Sono == 9
> D$Nota <- ifelse(cond,15,10)
> View(D)

> cond1 <- D$Esporte == "Surfe" | D$Esporte == "Yoga"
> cond2 <- D$Municipio == "SP"
> D$Nota <- ifelse(cond1,ifelse(cond2,10,7),5)
> View(D)

#Excluir a coluna de um DataFrame
# V <- V[,-3] acessa todas menos a coluna 3
