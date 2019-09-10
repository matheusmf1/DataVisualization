setwd("~/Documents/Mauá/4ºano/PAE-Visualizacao_de_Dados/csv/Class03")

V = c(10,20,30,40,50,60,70,80,90,100)
c = V>30 & V<=80
R1 = V[c]
R2 = V[V==40|V>80]
R3 = V[V>40 & V!=70]
R4 = V[V<0]

A = c(10,20,30,40,50,60)
A = A[!(A<30)]
B = c(10,20,30,40,50,60)
B = B[B>=30]
V = c(1,2,NA,NA,5:8)

count1 = sum(is.na(V))
cont2 = sum(V>=2 & V<=6)
V = V[!is.na(V)]
cont2 = sum(V>=2 & V<=6)
V = V[!(V>=2 & V<=6)]
V <- c(1,2,NA,NA,5:8)

sum(V)
mean(V)
sd(V)

sum(V, na.rm = TRUE)
mean(V, na.rm = TRUE)
sd(V, na.rm = TRUE)

read.csv2("alunos.csv")
D = read.csv2("alunos.csv")

M = mean(D$Idade)
table(D$Genero)

I = D$Idade[5]
U = D$Peso[length(D$Peso)]
D = read.csv2("alunos.csv")

summary(D)
summary(D$Idade)

CV = sd(D$Idade)/mean(D$Idade)

boxplot(D$Peso,main="Peso")
hist(D$Altura,main = "Altura")
table(D$Sono)


D[2,4]
D[2,5]
D[1:5,2]
D[4,c(3,6)]
R1 <- D[2,]
R2 <- D[,-2]
R3 <- D[,c(2,3)]
R4 <- D[,4]

R5 <- D[D$Altura >= 160 & D$Altura <= 170,]
R6 <- D[D$Idade < 20 & D$Sono == 7,]
R7 <- D[D$Municipio != "SP",]
R8 <- D[D$Esporte == "Natacao" | D$Esporte == "Surfe",]

D = read.csv2("alunos.csv")
D = D[!(D$Altura>190),]
D <- D[D$Municipio != "SCS",]

N = read.csv2("NA.csv")
summary(N)
N = na.omit(N)
summary(N)                          
write.csv2(N,"test.csv",row.names = FALSE)