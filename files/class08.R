# CM3040 - Encontro 08 - Gráficos básicos com a biblioteca ggplot2
# Código do script "CM3040_08.R"

# ATENÇÃO: instale e habilite o pacote 'ggplot2'
# antes de executar este script: use a opção 
# "Install" na aba "Packages" ou execute as duas
# instruções a seguir:
# install.packages("ggplot2")
# library(ggplot2)


# Exemplo de um diagrama de pontos usando a
# biblioteca ggplot2
D <- read.csv2("alunos.csv")  # Leitura dos dados
str(D)  # Estrutura dos dados (para recordação)

# Traça o diagrama de pontos das alturas
Indices <- 1:nrow(D)  # índices: de 1 a total de linhas (=55)
ggplot(data = D,aes(x = Indices,y = Peso)) + geom_point()

# Traça o diagrama de dispersão: alturas x pesos
ggplot(data = D,aes(x = Altura,y = Peso)) + geom_point()

# =========================================================== #
# Exemplo de ajustes dos símbolos no diagrama de pontos +
# configuração do título do gráfico
ggplot(data = D,aes(x = Indices,y = Peso)) + geom_point(color = "darkblue",shape = 1,size = 2) + ggtitle("Pesos dos alunos (em kg)")

# Diagrama de dispersão com separação por duas categorias +
# ajustes nos eixos do gráfico
ggplot(D,aes(x = Altura,y = Peso,color = Genero,shape = Genero)) + geom_point() + ylim(0,120) + xlab("Altura em cm") + ylab("Peso em kg")

# =========================================================== #
# Exemplos de gráficos de linha
# Gráfico de linha sem símbolos nos valores
ggplot(data = D,aes(x = Indices,y = Idade)) + geom_line(color = "blue",size = 1)

# Gráfico de linha com símbolos nos valores: traçado de
# duas camadas, uma com as linhas, outra com os pontos
ggplot(data = D,aes(x = Indices,y = Peso)) + geom_line(color = "red",linetype = 2) + geom_point(shape = 1,color = "red",size = 3)

# =========================================================== #
# Preparação para criação de um gráficos de barras
# conversão das tabelas em dataframes
T1 <- table(D$Municipio)   # Tabela de contagem
T2 <- table(D$Genero,D$Municipio)  # Tabela de contingência

# Converte a tabela de contagem e exibe o dataframe
DF1 <- as.data.frame(T1)
print(DF1)

# Converte a tabela de contingência e exibe o dataframe
DF2 <- as.data.frame(T2)
print(DF2)

# Cria o gráfico de barras da contagem dos municípios
ggplot(data = DF1,aes(x = Var1,y = Freq)) + geom_col() + xlab("Município") + ylab("Total") + ggtitle("Alunos por município")

# Opção para o gráfico dos municípios: barras na horizontal
ggplot(data = DF1,aes(x = Var1,y = Freq)) + geom_col() + xlab("Município") + ylab("Total") + ggtitle("Alunos por município") + coord_flip()

# Cria o gráfico de barras da contagem de gênero x município
ggplot(data = DF2,aes(x = Var1,y = Freq, fill = Var2)) + geom_col()

# Gráfico de gênero x município com barras lado a lado
ggplot(data = DF2,aes(x = Var1,y = Freq, fill = Var2)) + geom_col(position = position_dodge())

# =========================================================== #
# Boxplots de uma variável, sem e com separação por categoria
ggplot(data = D,aes(x = "",y = Altura)) + geom_boxplot()
ggplot(data = D,aes(x = Genero,y = Altura)) + geom_boxplot()

# Boxplots separados por categoria e com cores distintas
ggplot(data = D,aes(x = Genero,y = Altura,fill = Genero)) + geom_boxplot()

# =========================================================== #
# Histograma básico de uma variável sem ajuste das faixas
ggplot(data = D,aes(x = Altura)) + geom_histogram()

# Histograma básico de uma variável com ajuste das faixas
n = round(sqrt(nrow(D)),0)  # Regra clássica da estatística!
ggplot(data = D,aes(x = Altura)) + geom_histogram(binwidth = n)

# Histograma de uma variável, separada por categorias
ggplot(data = D,aes(x = Altura,fill = Genero, color = Genero)) + geom_histogram(binwidth = n)
