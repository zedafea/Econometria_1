library(wooldridge)

1)
X <- c(2,4,6,8,7,12,11,10,9,8,6,4)
Y <- c(800,1160,1580,2010,1890,2600,2070,1890,1830,1740,1380,1060)

#i
beta1 <- cov(X,Y)/var(X)
beta0 <- mean(Y) - beta1*mean(X)

#ii
y_hat <- beta0 + beta1*X
df <- as.data.frame(cbind(X,Y,y_hat,Y-y_hat))
sqr <- sum(df$V4^2)

#iii
#R^2 = sqe/sqt, onde sqe = somatorio((y_hat - y_mean)^2) e sqt = somatorio((y - y_mean)^2)
SQE = sum((df$y_hat - mean(Y))^2)
SQT = sum((df$Y - mean(Y))^2)
SQE/SQT

#iv
#var_beta1 = SQR/n-2
var_beta1 = sqr/10
ep = sqrt(var_beta1)/sqrt(sum((X - mean(X))^2))
#t test com 10 gl
(beta1 - 0)/ep
#como 9.41 > do que 2.22 (pela tabela) beta1 � significante

2)
df <- discrim
#i
mean(df$prpblck,na.rm=TRUE)
sqrt(var(df$prpblck,na.rm=TRUE))
mean(df$income,na.rm=TRUE)
sqrt(var(df$income,na.rm=TRUE))

#ii
options(scipen = 999)
model1 <- lm(psoda ~ prpblck + income,data = df)
summary(model1)
#Equa��o
psoda = 0.9563 + 0.1150*prpblck + 0.00*income
#Tamanho da amostra
n = 410 (9 NA)
#R quadrado
r = 0.0861
#O resultado n�o � economicamente grande, um aumento de uma unidade em prpblck, i.e, 100% => aumento de 0.11 d�lares no pre�o

#iii
model2 <- lm(psoda ~ prpblck,data = df)
summary(model2)
#O efeito da discrina��o � menor do que quando controlamos pela renda

#iv
model3 <- lm(lpsoda ~ lincome + prpblck, data = df)
summary(model3)
#beta 1 = 0.07
#beta 2 = 0.12

#v
model4 <- lm(lpsoda ~ lincome + prpblck + prppov, data = df)
summary(model4)
#beta 2 (associado a prpblck) diminui

#vi
cor(df$lincome,df$prppov,use='complete.obs')
#Dentro do esperado, renda m�dia e pobreza fortemente correlacionadas negativamente

#vii
#� uma boa discuss�o, temos os pr�s de se adicionar mais informa��o, pode ser que existam locais com alta renda m�dia e alta pobreza, logo seria interessante controlar por ambas as vari�veis. Entretanto h� tamb�m que se ficar atento para a multicolinearidade, que afeta o desvio padr�o das nossas estimativas que podem consequentemente perder signific�ncia.