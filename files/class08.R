# CM3040 - Encontro 08 - Gr�ficos b�sicos com a biblioteca ggplot2
# C�digo do script "CM3040_08.R"

# ATEN��O: instale e habilite o pacote 'ggplot2'
# antes de executar este script: use a op��o 
# "Install" na aba "Packages" ou execute as duas
# instru��es a seguir:
# install.packages("ggplot2")
# library(ggplot2)


# Exemplo de um diagrama de pontos usando a
# biblioteca ggplot2
D <- read.csv2("alunos.csv")  # Leitura dos dados
str(D)  # Estrutura dos dados (para recorda��o)

# Tra�a o diagrama de pontos das alturas
Indices <- 1:nrow(D)  # �ndices: de 1 a total de linhas (=55)
ggplot(data = D,aes(x = Indices,y = Peso)) + geom_point()

# Tra�a o diagrama de dispers�o: alturas x pesos
ggplot(data = D,aes(x = Altura,y = Peso)) + geom_point()

# =========================================================== #
# Exemplo de ajustes dos s�mbolos no diagrama de pontos +
# configura��o do t�tulo do gr�fico
ggplot(data = D,aes(x = Indices,y = Peso)) + geom_point(color = "darkblue",shape = 1,size = 2) + ggtitle("Pesos dos alunos (em kg)")

# Diagrama de dispers�o com separa��o por duas categorias +
# ajustes nos eixos do gr�fico
ggplot(D,aes(x = Altura,y = Peso,color = Genero,shape = Genero)) + geom_point() + ylim(0,120) + xlab("Altura em cm") + ylab("Peso em kg")

# =========================================================== #
# Exemplos de gr�ficos de linha
# Gr�fico de linha sem s�mbolos nos valores
ggplot(data = D,aes(x = Indices,y = Idade)) + geom_line(color = "blue",size = 1)

# Gr�fico de linha com s�mbolos nos valores: tra�ado de
# duas camadas, uma com as linhas, outra com os pontos
ggplot(data = D,aes(x = Indices,y = Peso)) + geom_line(color = "red",linetype = 2) + geom_point(shape = 1,color = "red",size = 3)

# =========================================================== #
# Prepara��o para cria��o de um gr�ficos de barras
# convers�o das tabelas em dataframes
T1 <- table(D$Municipio)   # Tabela de contagem
T2 <- table(D$Genero,D$Municipio)  # Tabela de conting�ncia

# Converte a tabela de contagem e exibe o dataframe
DF1 <- as.data.frame(T1)
print(DF1)

# Converte a tabela de conting�ncia e exibe o dataframe
DF2 <- as.data.frame(T2)
print(DF2)

# Cria o gr�fico de barras da contagem dos munic�pios
ggplot(data = DF1,aes(x = Var1,y = Freq)) + geom_col() + xlab("Munic�pio") + ylab("Total") + ggtitle("Alunos por munic�pio")

# Op��o para o gr�fico dos munic�pios: barras na horizontal
ggplot(data = DF1,aes(x = Var1,y = Freq)) + geom_col() + xlab("Munic�pio") + ylab("Total") + ggtitle("Alunos por munic�pio") + coord_flip()

# Cria o gr�fico de barras da contagem de g�nero x munic�pio
ggplot(data = DF2,aes(x = Var1,y = Freq, fill = Var2)) + geom_col()

# Gr�fico de g�nero x munic�pio com barras lado a lado
ggplot(data = DF2,aes(x = Var1,y = Freq, fill = Var2)) + geom_col(position = position_dodge())

# =========================================================== #
# Boxplots de uma vari�vel, sem e com separa��o por categoria
ggplot(data = D,aes(x = "",y = Altura)) + geom_boxplot()
ggplot(data = D,aes(x = Genero,y = Altura)) + geom_boxplot()

# Boxplots separados por categoria e com cores distintas
ggplot(data = D,aes(x = Genero,y = Altura,fill = Genero)) + geom_boxplot()

# =========================================================== #
# Histograma b�sico de uma vari�vel sem ajuste das faixas
ggplot(data = D,aes(x = Altura)) + geom_histogram()

# Histograma b�sico de uma vari�vel com ajuste das faixas
n = round(sqrt(nrow(D)),0)  # Regra cl�ssica da estat�stica!
ggplot(data = D,aes(x = Altura)) + geom_histogram(binwidth = n)

# Histograma de uma vari�vel, separada por categorias
ggplot(data = D,aes(x = Altura,fill = Genero, color = Genero)) + geom_histogram(binwidth = n)
