# Simple SIR simulation in R

simSIR <- function(beta=0.01, gamma=1.0, S0=100) {

    S <- S0
    I <- 1
    R <- 0

    t <- 0

    idx <- 1

    while (TRUE) {

        if (I[idx]<1)
            break

        aInf <- beta*S[idx]*I[idx]
        aRec <- gamma*I[idx]
        a0 <- aInf + aRec

        ##print(paste(S[idx],I[idx]))

        ## Increment time
        t[idx+1] <- t[idx] + rexp(1, a0)

        ## Fire reaction
        if (runif(1)*a0 < aInf) {
            ## Infection

            S[idx+1] <- S[idx] - 1
            I[idx+1] <- I[idx] + 1
            R[idx+1] <- R[idx]
        } else {
            ## Recovery

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
