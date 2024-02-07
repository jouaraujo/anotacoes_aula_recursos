# Gerando10  números aleatórios da dist normal com média 5 e desvio 2 ----------------

rnorm(n=10,mean = 5, sd = 2)
y <- rnorm(n=200,mean = 5, sd = 2)
hist(y)


# Gerando 20  números aleatórios da dis Exp com lambda=2 -------------------
rexp(n = 20, rate = 2)
x <- rexp(n = 200, rate = 2)
hist(x)