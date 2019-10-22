D = read.csv2("alunos.csv")

#1
Indices = 1:nrow(D) # index from 0 to the last one

ggplot(data = D,aes(x = Indices, y = Peso)) + geom_line(color = "black",size = 0.5) + geom_point(shape = 1,size=2)+  ylim(min(D$Peso),max(D$Peso))+ geom_hline(yintercept = max(D$Peso), color = "blue", linetype = 2)+ geom_hline(yintercept = min(D$Peso), color = "blue", linetype = 2)+ geom_hline(yintercept = mean(D$Peso), color = "red", linetype = 2)


#2

T1 = table(D$Municipio)   # Tabela de contagem
T2 = table(D$Genero,D$Municipio)  # Tabela de contingência

# Converte a tabela de contagem e exibe o dataframe
DF1 = as.data.frame(T1)
DF2 = as.data.frame(T2)

ggplot(data = DF2,aes(x = Var2,y = Freq,fill= Var1)) + geom_col()

ggplot(data = DF2,aes(x = Var2,y = Freq, fill = Var1)) + geom_col(position = position_dodge())

#3 



