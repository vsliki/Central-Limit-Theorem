# Empirical verification of the central limit theorem.

# Recall: For X_1, X_2, .. a sequence of independent and identically distributed
#random variables such that E(X_i) = mu and 0 < var(X_i) = sig^2 < infty, 
#then : Y_n = 1/sqrt(n* sig^2) * sum_{i=1}^n (X_i - mu) -> Z for Z ~ N(0,1).
# ---- Prove this for X_i ~ Bernoulli(p). ---

#Let m = 10^4 the number of repetitions of the MonteCarlo simulation
#For a sample size n = (50,200,1000), 
# 1. Generate m realisations y_n of Y_n and store them in a vector y
# 2. Plot a normalized histogram of y
# 3. Plot the qqplot of y using qqnorm.


# Initial data ------------------------------------------------------------
m = 10^4         #nb of MC simulations
n = 200           # (50, 200 or 1000)
p = 0.2          # arbitrary
 
mu = p
sig2 = p*(1-p)   # Recall X ~ Bernoulli(p)
 

# Define Z to compare later -----------------------------------------------
Z = seq(-4,4, length.out = n)
 

# Define n times m realizations of X ~ Bernoulli(p) -----------------------
x = 0 
for (i in seq(1,n)) {
  x = x + rbinom(m,1,p) # Bernoulli is a special case of the Binomial distr.
} 


# Compute y ---------------------------------------------------------------
y = (x - n*mu) / sqrt(n*sig2)
 

# Histogram y compared to Z -----------------------------------------------
hist(y, freq=F)
lines(sort(Z), dnorm(sort(Z), mean = 0, sd=1))


# QQplot ------------------------------------------------------------------
qqnorm(y)

# See png files for illustrations
