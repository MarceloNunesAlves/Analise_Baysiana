#1.1

total <- c(3,5,4,5)
maturas <- c(0,1,3,5)

x <- c((10+15)/2,(20+25)/2,(30+35)/2,(60+65)/2)

pobs <- maturas / total

b0 <- 1.1630
b1 <- 0.2669

p <- exp(b0 + b1*(x - 32.5))/(1 + exp(b0 + b1*(x - 32.5)))

plot(x, pobs)
lines(x,p)


# 1.2
apha <- 0.00001
b <- 3

#comp <- seq(40, 80, by=1)
comp <- 40:80

p <- apha*comp^b

plot(p)

erro <- rnorm(length(comp), 0, 0.25)

pr <- apha * comp^b + erro
plot(pr)

#1.3
modelo <- lm(log(pr)~log(comp))

names(modelo)

apha.est <- exp(coef(modelo)[1])
b.est <- exp(coef(modelo)[2])

c(apha, apha.est, b, b.est)

ppred <- apha.est * comp^b.est

plot(comp,pr)
lines(comp,ppred)
