D <- read.csv2("pessoal.csv")
cont <- sum(is.na(D$Salario))
val<- D[!is.na(D$Salario),]
media = mean(val$Salario)
D$Alterado = ifelse(is.na(D$Salario),TRUE,FALSE)
D$Salario = ifelse(is.na(D$Salario),media,D$Salario)