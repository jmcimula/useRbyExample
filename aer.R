#Tobit (type 1 Tobit)

library(AER) #Applied Econometrics with R

#the outcome variable is observed only if it is above or below a given threshold.

N <- 1000 #sample

u <- rnorm(N)
x <- - 1 + rnorm(N)
ystar <- 1 + x + u 
y <- ystar*(ystar > 0)
hist(y)

ols <- lm(y ~ x)
summary(ols)

tobit <- tobit(y ~ x,left=0,right=Inf,dist = "gaussian")

print (tobit)