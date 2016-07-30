library(MCMCpack) #Markov Chain Monte Carlo

#The Poisson model

#Fake data simulations

N <- 1000
x <- rnorm(N)
alpha <- c(1,1)
y <- rpois(N,exp(alpha[1] + alpha[2] * x)) #exp(1 + 1 * x)
df <- data.frame(x,y)
plot(x,y)

#Maximum likelihood
fit <- glm(y ~ x, family = poisson, data = df)
summary(fit)

#Bayesian estimation


#The model can also be estimated using bayesian methods with the MCMCpoisson() function which is provided in the MCMCpack.

posterior <- MCMCpoisson(y ~ x, data = df)
plot(posterior)
summary(posterior)
