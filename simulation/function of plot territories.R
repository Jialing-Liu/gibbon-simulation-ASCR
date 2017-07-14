#plot territories of groups(Hardcore process)

plot_hardcore <- function(spacing, density, hardcore = list(beta, hc)){
  w <- owin(xrange = c(-10*spacing,20*spacing), yrange = c(-10*spacing,20*spacing))
  n <- round(density*(spacing^2)*900/10000)
  sim_location <- rmh(model= list(cif = 'hardcore', par = hardcore, w = w), 
                      start=list(n.start = n),
                      control=list(nrep=1e7,p=1))
  
  plot.ppp(sim_location %mark% hardcore$hc, markscale = 1,
           bg = rgb(90, 128, 150, 50, maxColorValue=150),
           show.window = T, show.all = T, legend = F,
           main = paste('locations of simulation on Hardcore process \n with density=',
                        density,'(R=', hardcore$hc, ')', sep=''))
  plot.ppp(sim_location, pch=19, cex=.4, cols = 'red', add=T)
}
