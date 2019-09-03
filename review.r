#That`s a simple review on using R


V <- 60/5*(7-5)
x = c(5,3)
A = c(10,20,30,10)
B = c(2,4,5,10)
A + 5
[1] 15 25 35 15
2*(B^2)
sqrt(A)

A+B

A + x

A[2]

A[5]

A[5] = 15
A[8] = 5
B[length(B)+1] <- 22
B[length(B)+1] <- 11
V1 <- c(92,80,91,61,68,75,70,68,84,99,76)

V2 <- c(5,4,8,9,15,11,8,16,9,20,7,12,10)

cat1 <- c("A","A","B","A","B","B","A","A")
cat2 <- c("t","x","x","t","x","t","X","t")

mean(V1) #media amostral
sd(V1) #desvio padrao
CV1 = sd(V1)/mean(V1)*100 

summary(V1) #resumo estatistico

boxplot(V1, main="V1") #boxplot de V1
boxplot(V2, main="V2") #boxplot de V2

hist(V1,main="V1") #histograma de v1
hist(V2,main="V2") #histograma de v2

table(cat1)
table(cat2)