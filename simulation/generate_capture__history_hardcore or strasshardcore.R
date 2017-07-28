#generate capture history
#individuals location distribute in Hard-core process or Strauss Hard-core process
#hardcore=list(beta=beta,hc=hc),beta is , hc is the diameter of territory
#strausshard=list(beta=beta,gamma=gamma,hc=hc,R=R)
#buffer of the traps in the area is 5000 

capture_history = function(traps, density, sigma,
                           hardcore = NULL,
                           strausshard = NULL){
  distance <- attr(traps,'distance')
  n <- attr(traps,'n')
  w = owin(xrange = c(0,10000+distance*(n-1)), yrange = c(0,10000+distance*(n-1)))
  pop <- sim.popn(D = density,
                  expand.grid(x = c(0,10000+distance*(n-1)),
                                y = c(0,10000+distance*(n-1))),
                  buffer = 0, nsessions = 1)
  
  if(!is.null(hardcore)){
    sim_location <- rmh(model= list(cif = 'hardcore', par = hardcore, w = w),
                        start=list(n.start = nrow(pop)),
                        control=list(p=1))
  } else if(!is.null(strausshard)){
    sim_location <- rmh(model = list(cif = 'straush', par = strausshard, w = w),
                        start = list(n.start = nrow(pop)),
                        control = list(p = 1))
  }
  pop$x <- sim_location$x
  pop$y <- sim_location$y
  out <- sim.capthist(traps=traps, popn = pop, noccasions = 1,
                      detectpar = list(g0 = 1, sigma = sigma),
                      savepopn = TRUE, renumber = FALSE, p.available = 1)

  return(out)
}



