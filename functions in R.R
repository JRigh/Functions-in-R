#---------------
# Functions in R
#---------------

setwd("C:/Users/julia/OneDrive/Desktop/github/22. FunctionsInR")
library(xtable)

# a weird function

someweirdfunction <- function(n) {
  
  ab = numeric(n*(n-1)*2)
  for(i in (seq(1, (n*(n-1)*2), 2)-1)[2:n]){
    ab[1] <- 1
    ab[(i*n)] <- i
  }
  
  bc=numeric(length(ab))
  for(i in 1:length(bc)) {
    if (ab[i]!=0) {bc[(i-1):(i-ab[i])] <-rep(1,ab[i])}
    else
      bc[i]<- 0
  }
  
  cd <- c(1,bc[1:length(bc)-1])
  
  result <- matrix(cd, nrow = n, ncol=(n-1)*2, byrow=TRUE)
  
  return(result)
}

# call the function
someweirdfunction(n=6)

# print in LaTeX file
a <- 4* someweirdfunction(n = 4)
print(xtable(a, type = "latex"), file = "a.tex")

#----
# end
#----
