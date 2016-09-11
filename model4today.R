getwd()
setwd("C:/Users/Dr M/Desktop")
list.files()
RTODATA = read.csv(file = 'RTODATA.csv', as.is=T)
RTODATA

RTO_Names <- unique(RTODATA$RTO)

N <- length(RTODATA$Home_RTO)
fileName <- "reactionsRTO.xml"

for(k in 1:N)	{
		Home_RTO <- RTODATA$Home_RTO[k]
		RTO <- RTODATA$RTO[k]
		Rate <- RTODATA$Rate[k]

		RTO_Index <-which(RTO_Names==RTO)-1
		Home_RTO_Index <- which(RTO_Names==Home_RTO)-1

	if(Home_RTO_Index != RTO_Index){
		str <- paste("<reaction spec='Reaction' rate='",Rate,
			"'>\nS[",RTO_Index,"] + I[",Home_RTO_Index,"] -> I[",RTO_Index,"]+ I[",Home_RTO_Index,"]\n",
			"</reaction>\n",sep="")
	} else {
		str <- paste("<reaction spec='ReactSion' rate='",Rate,
			"'>\nS[",Home_RTO_Index,"] + I[",Home_RTO_Index,"] -> 2*I[",Home_RTO_Index,"]\n",
			"</reaction>\n",sep="")
	}
	cat(str, file=fileName, append=T)
}
