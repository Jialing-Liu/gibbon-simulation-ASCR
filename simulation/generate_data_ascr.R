
# wrapper function for secr make.circle

capture_history = function(traps, density, sigma,
                           hardcore = NULL,
                           strausshard = NULL){
  spacing <- attr(traps,'spacing')
  distance <- attr(traps,'distance')
  ns <- sqrt(nrow(traps)/3)
  xrange = spacing*10
  w = owin(xrange = c(0,10000+distance*(ns-1)), yrange = c(0,10000+distance*(ns-1)))
  n <- round(density*area(w)/10000)
  # simulate the population with some reasonable guess for density, plot(pop) to verify
  if(!is.null(hardcore)){
    sim_location <- rmh(model= list(cif = 'hardcore', par = hardcore, w = w),
                        start=list(n.start = n),
                        control=list(p=1))
  } else if(!is.null(strausshard)){
    sim_location <- rmh(model = list(cif = 'straush', par = strausshard, w = w),
                        start = list(n.start = n),
                        control = list(p = 1))
  }
  m=1
  while(m != n){
    pop <- sim.popn(D = density,
                    expand.grid(x = c(0,10000+distance*(ns-1)),
                                y = c(0,10000+distance*(ns-1))),
                    buffer = 0, nsessions = 1)
    m <- nrow(pop)
  }

  pop$x <- sim_location$x
  pop$y <- sim_location$y
  out <- sim.capthist(traps=traps, popn = pop, noccasions = 1,
                      detectpar = list(g0 = 1, sigma = sigma),
                      savepopn = TRUE, renumber = FALSE, p.available = 1)

  return(out)
}



