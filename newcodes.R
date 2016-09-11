# simulated model SIR
getwd()
list.files()
data <- read.csv(file='RTODATA.csv')
data
i <- data$RTO
j <- data$Home_RTO
beta <- data$Share20160811_1429

SIRModel <- function(beta = data$Share20160811_1429, gamma = 1.0, S0=100) {

      S[i] <- S0
      I[j] <- 5
      R <- 0
      t <- 0
	i <- data$Home_RTO
	j <- data$RTO
	beta <- data$Share20160811_1429

    idx <- 1

    while (TRUE) {

        if (I[idx]<1)
            break
        
        aInf <- beta*S[idx]*I[idx]
        aRec <- gamma*I[idx]
        a0 <- aInf + aRec

        ##print(paste(S[idx],I[idx]))

        t[idx+1] <- t[idx] + rexp(1, a0)

        if (runif(1)*a0 < aInf) {
            ## Infection
            
            S[idx+1] <- S[idx] - 1
            I[idx+1] <- I[idx] + 1
            R[idx+1] <- R[idx]
        } else {
            
            S[idx+1] <- S[idx]
            I[idx+1] <- I[idx] - 1
            R[idx+1] <- R[idx] + 1
        }

        idx <- idx + 1
    }
    res <- list()
    res$S <- S
    res$I <- I
    res$R <- R
    res$t <- t
    return(res)
}

# Alternatively



