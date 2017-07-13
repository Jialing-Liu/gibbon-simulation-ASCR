#plot territories of groups
spacing=400
density=0.02
w = owin(xrange = c(-10*spacing,20*spacing), yrange = c(-10*spacing,20*spacing))
n <- round(density*(spacing^2)*900/10000)
# simulate the population with some reasonable guess for density, plot(pop) to verify
sim_location <- rmh(model= list(cif = 'hardcore', par = list(beta=4e-5,hc=700), w = w), 
                    start=list(n.start = n),
                    control=list(nrep=1e8,p=1))
plot.ppp(sim_location, pch=19, cex=.3, cols = 'red')
plot.ppp(sim_location%mark%700, markscale = 1, add=T, bg= 'lightblue1',border='black')
