 D <- read.csv2("alunos.csv")

> IMC = D$Peso/(D$Altura/100)
> cond = D$Municipio =="SCS" | D$Municipio =="SA" | D$Municipio == "SBC"
> IND = ifelse(cond,TRUE,FALSE)

> D$IMC = IMC
> D$Indicacao = IND
> D$Sugestao = ifelse(D$Altura > 170, "Basquete", "Xadrez")

> D = D[,-5]

> View(D)
write.csv2(D,"alunos2.csv",row.names = FALSE)


D <- D[!is.na(D$Variável),]
D <- na.omit(D)