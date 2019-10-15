# CM3040 - Encontro 07 - Gráficos básicos
# Código do script "CM3040_07.R"

# Exemplo de um diagrama de pontos:
# dados do arquivo "alunos.csv"
D <- read.csv2("alunos.csv")  # Leitura dos dados
str(D)  # Estrutura dos dados (para recordação)

# Traça o gráfico de pontos das alturas (com título e subtítulo)
plot(D$Altura,main = "Alturas",sub = "Valores em cm")

# =========================================================== #
# Exemplo de ajustes dos símbolos
plot(D$Idade,pch = 3,col = 2,cex = 1.2)  # Diagrama de pontos

# =========================================================== #
# Exemplo de ajustes dos eixos
plot(D$Peso,xlab = "Índice",ylab="Peso",xlim = c(1,20),cex.lab = 1.2,
     cex.axis = 0.8,las = 1)

# =========================================================== #
# Exemplos de gráficos de linha
# Gráfico de linha sem símbolos nos valores
plot(D$Idade,lwd = 2,type = "l",col = "blue")

# Gráfico de linha com símbolos nos valores
plot(D$Peso,type = "b",lty = 2,col = "red")

# =========================================================== #
# Exemplo de uso da função lines para gráficos de
# linha de mais de uma variável ("Idade", "Peso" e "Altura")

# Determina as escalas do eixo y (no eixo x são iguais)
ymin = min(D$Idade,D$Peso,D$Altura)
ymax = max(D$Idade,D$Peso,D$Altura)

# Traça o primeiro gráfico
plot(D$Idade,main = "Gráficos",type = "l",col = "blue",
     ylim = c(ymin,ymax),ylab = "Dados")

# Completa o traçado com os outros gráficos
lines(D$Peso,type = "l",col = "red")
lines(D$Altura,type = "l",col = "green")

# =========================================================== #
# Exemplo de inserção de legenda em um gráfico de linhas
# ATENÇÃO: o gráfico de linhas anterior deve estar em tela
nomes <- c("Idade","Peso","Altura")
cores <- c("blue","red","green")
legend(x = 47,y = 150,legend = nomes,col = cores,pch = 15)

# =========================================================== #
# Exemplo de inserção de textos e linhas em um gráfico
plot(D$Peso,type = "o",lwd = 2,ylim = c(40,120))

# Traça linhas horizontais na média e nos extremos
abline(h = mean(D$Peso),lty = 4,lwd = 2,col = "red")
abline(h = min(D$Peso),lty = 2,col = "blue")
abline(h = max(D$Peso),lty = 2,col = "blue")

# Insere textos explicativos
text(x = 5,y = 50,"Limite inferior",col = "blue")
text(x = 20,y = 106,"Limite superior",col = "blue")
text(x = 48,y = 81,"Média",col = "red")

# =========================================================== #
# Traçado de reta de ajuste em um diagrama de dispersão
plot(D$Altura,D$Peso,main = "Peso x altura",pch = 16,
     xlab = "Altura em cm",ylab = "Peso em kg")
abline(lm(D$Peso~D$Altura),col = "blue",lwd = 2)

# =========================================================== #
# Exemplo de uso da função par + opção mfrow
# Layout inicial com uma linha e duas colunas

# Traça três gráficos de pontos
par(mfrow = c(1,2))
plot(D$Idade,col = "red",pch = 3)
plot(D$Peso,col = "green",pch = 4)
plot(D$Altura,col = "blue",pch = 5)

# Retorna ao layout padrão e refaz o primeiro gráfico
par(mfrow = c(1,1))
plot(D$Idade,col = "red",pch = 3)

# =========================================================== #
# Exemplo de ajustes em gráficos de barras
par(mfrow = c(1,2))   # Layout: uma linha, duas colunas
barplot(table(D$Genero,D$Municipio))	# Gráfico padrão
barplot(table(D$Genero,D$Municipio),beside = TRUE,legend.text = TRUE)
par(mfrow = c(1,1))   # Layout padrão

# =========================================================== #
# Gráficos de setor (ou gráficos de pizza)
par(mfrow = c(1,2))   # Layout: uma linha, duas colunas
pie(table(D$Genero))  # Gráfico básico

n <- length(table(D$Religiao))   # Total de religiões
pie(table(D$Religiao),col = rainbow(n),border = "white")
par(mfrow = c(1,1))   # Layout padrão

# =========================================================== #
# Exemplos de boxplots preenchidos com cores
cores <- c("green","yellow")  # 2 cores
boxplot(D$Peso,D$Altura,col = cores)

# Boxplots separados por categorias
cores <- c("deeppink","cornflowerblue") # Nomes das cores
par(mfrow = c(1,2))	# Layout com uma linha e duas colunas
boxplot(D$Altura~D$Genero,col = cores)     # 2 categorias
boxplot(D$Altura~D$Municipio,col = cores)  # 4 categorias
par(mfrow = c(1,1))	# Retorna ao layout padrão

# Exemplos com repetições de cores
cores <- c(rep("red",3),rep("green",2))	# Vetor de 5 cores
boxplot(D$Peso~D$Sono,col = cores)

# Exemplos de uso de paletas de cores alternativas
n <- length(table(D$Sono))   # Total de categorias
boxplot(D$Peso~D$Sono,col = rainbow(n))
boxplot(D$Peso~D$Sono,col = heat.colors(n))
boxplot(D$Peso~D$Sono,col = terrain.colors(n))
boxplot(D$Peso~D$Sono,col = topo.colors(n))
boxplot(D$Peso~D$Sono,col = cm.colors(n))

# =========================================================== #
# Exemplo de histogramas alinhados e com as mesmas faixas
# 1) Faixas determinadas automaticamente
par(mfrow = c(2,1))     # Layout com duas linhas e uma coluna
hist(D$Altura[D$Genero == "Feminino"],main = "Moças",xlab = "cm")
hist(D$Altura[D$Genero == "Masculino"],main = "Rapazes",xlab = "cm")

# 2) Faixas ajustadas manualmente
quebras <- seq(155,200,5)   # 10 faixas entre 155 e 200 cm
hist(D$Altura[D$Genero == "Feminino"],main = "Moças",
     xlab = "cm",col = "pink",breaks = quebras)
hist(D$Altura[D$Genero == "Masculino"],main = "Rapazes",
     xlab = "cm",col = "blue",breaks = quebras)
par(mfrow = c(1,1))	# Retorna ao layout padrão
