#Selection models (type 2 tobit or heckit)

library(sampleSelection)#Sample Selection Models in R

#the outcome y is observe only if d is equal to one with d a binary variable which is correlated with the error term of y.


N <- 1000
u <- rnorm(N)
v <- rnorm(N)
x <- - 1 + rnorm(N)
z <- 1 + rnorm(N)
d <- (1 + x + z + u + v> 0)
ystar <- 1 + x + u 
y <- ystar*(d == 1)
hist(y)

ols <- lm(y ~ x)
summary(ols)

heckit.ml <- heckit(selection = d ~ x + z, outcome = y ~ x, method = "ml")
summary(heckit.ml)

heckit.2step <- heckit(selection = d ~ x + z, outcome = y ~ x, method = "2step")
summary(heckit.2step)

