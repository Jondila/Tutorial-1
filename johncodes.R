SIRNZ <- function(pars = NULL, init = NULL, time = NULL, ...) { 
	if (is.null(pars)) { 
	stop("undefined 'pars'") 
	} 
	if (is.null(pars)) { 
	stop("undefined 'inits'") 
	} 
	if (is.null(pars)) { 
	stop("undefined 'time'") 
	} 
SolveSIRNZ <- function(pars = NULL, init = NULL, time = NULL) { 
	SolveSIRNZ.new <- function(time, init, pars) { 
	with(as.list(c(init, pars)), { 
	dXH = vH - XH * r * (betaHM * YM) - muH * XH 
	dXM = vM - XM * r * (betaMH * YH) - muM * XM 
	dYH = XH * r * (betaHM * YM) - gamma * YH - muH * YH 
	dYM = XM * r * (betaMH * YH) - muM * YM 
	list(c(dXH, dXM, dYH, dYM)) 
	}) 
	} 
	init <- c(init['XH'], init['XM'], init['YH'], init['YM']) 
	output <- ode(times = time,  
                     func = SolveSIRNZ.new,  
                        y = init, parms = pars, ...) 
	return(output) 
	} 
	output <- SolveSIRMNZ(pars = pars, init = init, time = time) 
	return(list(model = SolveSIRNZ.new, 
                   pars = pars, 
			 init = init, 
			 time = time, 
		    results = as.data.frame(output))) 
	}
 
