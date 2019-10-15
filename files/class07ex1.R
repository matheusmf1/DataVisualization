D = read.csv2("alunos.csv")

#Primeiro Exercicio

gols = c(44,44,36,46,27,29,17,29,27)
anos = c(2010,2011,2012,2014,2015,2016,2017,2018,2019)
plot(x = anos,y = gols, col = "blueviolet",type="1",lwd = 2)


text(x = anos,y = gols+5,as.character(gols))

#Segundo Exercicio

par(mfrow = c(1,1))
n = length(table(D$Esporte))
par(mar = c(3,11,3,3))
barplot(table(D$Esporte),col=rainbow(n), horiz = TRUE, las = 1 )


#Terceiro Exercicio
par(mfrow = c(1,3))

n = length(table(D$Esporte))
pie(table(D$Esporte),col = rainbow(n),border = "white")

n = length(table(D$Sono))
pie(table(D$Sono),col = rainbow(n),border = "white")

n = length(table(D$Municipio))
pie(table(D$Municipio),col = rainbow(n),border = "white")


par(mfrow = c(1,2)) 

n = length(table(D$Esporte))
pie(table(D$Esporte),col = rainbow(n),border = "white")
barplot(table(D$Esporte),col = rainbow(n))

par(mfrow = c(1,1))

#Quarto Exercicio

par(mfrow = c(2,1))
hist(D$Idade,main = 'Idade', xlab = "Idade", ylab = "Alunos")
barplot(table(D$Idade),col = "blueviolet", xlab = "Idade")x


#Quinto Exercicio
barplot(table(D$Municipio,D$Genero)) 
plot(D$Genero,D$Municipio)

#As funções se diferenciam pelo fato de que o plot não consehue
# interpretar mais de uma variavel por por vez. 

# A função barplot retorna um gráfico de contagens.
# A função plot retornou um gráfico de contagens com alturas e larguras proporcionais ao tamanho da amostra.





