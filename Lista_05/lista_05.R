library(wooldridge)

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

