P = read.csv2("pessoal.csv")

# The "suspeitos.csv" file must have employees data that didn't informe number of children
S = P[is.na(P$Filhos), ] 
write.csv2(S,"suspeitos.csv",row.names = FALSE)

# The file "honestos.csv" besides suspects data, also needs married employees witch have more than 15 minimum salary month

#1º way
P = P[!is.na(P$Filhos),]
P = P[ !(P$Est.civil == "Casado" & P$Salario > 15),]

#2º and much cleaner way
P = P[ !((P$Est.civil == "Casado" & P$Salario > 15) | is.na(P$Filhos)), ]

write.csv2(P,"honestos.csv",row.names = FALSE)