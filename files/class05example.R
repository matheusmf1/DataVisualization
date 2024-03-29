# CM3040 - Encontro 05 - Padr�es e opera��es para tratamento de dados
# "Momentos R" do material

# Ordena��o de um dataframe de acordo com uma vari�vel
D <- read.csv2("alunos.csv")    # Leitura dos dados

D1 <- D[order(D$Idade),]    # Ordem crescente de idade
D2 <- D[order(-D$Altura),]  # Ordem decrescente de altura

# Ordena��o de acordo com duas vari�veis
D3 <- D[order(D$Idade,D$Peso),]   # Ordena por idade e peso
D4 <- D[order(D$Idade,-D$Peso),]  # Peso: ordem decrescente

# Ordena��o por vari�vel quantitativa: os fatores
# s�o ordenados internamente em ordem alfab�tica
D5 <- D[order(D$Genero),]   # Ordem: "Feminino", "Masculino"

# =========================================================== #
# Exemplos de agrega��o de dados de um dataframe
D <- read.csv2("alunos.csv")    # (Re)leitura dos dados

# M�dia das idades de acordo com o g�nero
R1 <- aggregate(D$Idade,by = list(D$Genero),FUN = mean)

# Idem para o desvio padr�o + par�metro extra para a fun��o
R2 <- aggregate(D$Peso,by = list(D$Genero),FUN = sd, na.rm = TRUE)

# Contagem das idades de acordo com o g�nero: o mesmo
# resultado de "table(D$Genero)", mas em um dataframe
R3 <- aggregate(D$Idade,by = list(D$Genero),FUN = length)
