D = read.csv2("pessoal.csv")
D = D[!D$Filhos==-1,]
D$Salario = ifelse(is.na(D$Salario),0,D$Salario)
#P$Salario[is.na(P$Salario)] = 0
D$Bonus = ifelse(D$Idade > 40,TRUE,FALSE)
D = D[,-6]
write.csv2(D,"pessoal2.csv",row.names = FALSE)
