P = read.csv2("pessoal.csv")
P = order(P$Est.civil,P$Salario)
write.csv2(D,"ordem.csv",row.names = FALSE)