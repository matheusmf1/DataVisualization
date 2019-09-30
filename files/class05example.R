# CM3040 - Encontro 05 - Padrões e operações para tratamento de dados
# "Momentos R" do material

# Ordenação de um dataframe de acordo com uma variável
D <- read.csv2("alunos.csv")    # Leitura dos dados

D1 <- D[order(D$Idade),]    # Ordem crescente de idade
D2 <- D[order(-D$Altura),]  # Ordem decrescente de altura

# Ordenação de acordo com duas variáveis
D3 <- D[order(D$Idade,D$Peso),]   # Ordena por idade e peso
D4 <- D[order(D$Idade,-D$Peso),]  # Peso: ordem decrescente

# Ordenação por variável quantitativa: os fatores
# são ordenados internamente em ordem alfabética
D5 <- D[order(D$Genero),]   # Ordem: "Feminino", "Masculino"

# =========================================================== #
# Exemplos de agregação de dados de um dataframe
D <- read.csv2("alunos.csv")    # (Re)leitura dos dados

# Média das idades de acordo com o gênero
R1 <- aggregate(D$Idade,by = list(D$Genero),FUN = mean)

# Idem para o desvio padrão + parâmetro extra para a função
R2 <- aggregate(D$Peso,by = list(D$Genero),FUN = sd, na.rm = TRUE)

# Contagem das idades de acordo com o gênero: o mesmo
# resultado de "table(D$Genero)", mas em um dataframe
R3 <- aggregate(D$Idade,by = list(D$Genero),FUN = length)
