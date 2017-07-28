#plot territories of groups(Hardcore process)

plot_hardcore <- function(n, distance, density, hardcore = list(beta, hc)){
  w = owin(xrange = c(0,10000+distance*(n-1)), yrange = c(0,10000+distance*(n-1)))
  pop <- sim.popn(D = density,
                  expand.grid(x = c(0,10000+distance*(n-1)),
                              y = c(0,10000+distance*(n-1))),
                  buffer = 0, nsessions = 1)
  sim_location <- rmh(model= list(cif = 'hardcore', par = hardcore, w = w), 
                      start=list(n.start = nrow(pop)),
                      control=list(nrep=1e7,p=1))
  
  plot.ppp(sim_location %mark% hardcore$hc, markscale = 1,
           bg = rgb(90, 128, 150, 50, maxColorValue=150),
           show.window = T, show.all = T, legend = F,
           main = paste('locations of simulation on Hardcore process \n with density=',
                        density,'(R=', hardcore$hc, ')', sep=''))
  plot.ppp(sim_location, pch=19, cex=.4, cols = 'red', add=T)
}
