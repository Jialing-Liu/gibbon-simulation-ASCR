history_locations<-function(density, sigma,
                            hardcore = NULL,
                            strausshard = NULL){
  w = owin(xrange = c(0,20000), yrange = c(0,20000))
  pop <- sim.popn(D = density,
                  expand.grid(x = c(0,20000),y = c(0,20000)),
                  buffer = 0, nsessions = 1)
  # simulate the population with some reasonable guess for density, plot(pop) to verify
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
  return(pop)
}