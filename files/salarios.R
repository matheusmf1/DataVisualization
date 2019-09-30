P = read.csv2("pessoal.csv")
avgSa = aggregate(P$Salario, by = list(P$Est.civil,P$Regiao), FUN = mean, na.rm = TRUE )
write.csv2(D,"salario.csv",row.names = FALSE)