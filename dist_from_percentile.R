cum.p <- c(20, 40, 50, 60, 80)/100
prob <- c( cum.p[1], diff(cum.p), .01)

#manhattan
x <- c(20600, 50800, 69700, 93900, 177700)

#upper east side
#x <- c(46000, 93400, 118000, 154000, 229700)

#greenwich Village
#x <- c(40600, 88200, 114100, 150000, 233700)

freq <- 10000 # final output size that we want

# Extreme values beyond x (to sample)
init <- 0 
fin  <- abs(max(x)) + 1

ival <- c(init, x, fin) # generate the sequence to take pairs from
len <- 100 # sequence of each pair

s <- sapply(2:length(ival), function(i) {
    seq(ival[i-1], ival[i], length.out=len)
})
# sample from s, total of 10000 values with probabilities calculated above
out <- sample(s, freq, prob=rep(prob, each=len), replace = T)