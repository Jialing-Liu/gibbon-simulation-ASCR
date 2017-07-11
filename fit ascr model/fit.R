traps <- generate_traps(spacing=400)
capture <- capture_history(traps, density=0.04, sigma=500, 
                           hardcore=list(beta=20,hc=350))
as_capture <- convert_to_ascr(capture, kappa=5)
ascr_mask <- make.mask(traps = traps, buffer=1000,
                       type="trapbuffer") 
fit_ascr_hn <- fit.ascr(capt=as_capture, traps=traps,
                        fix = list(g0=1),
                        mask = ascr_mask, detfn = 'hn')
summary(fit_ascr_hn)


ascr_mask <- make.mask(traps = traps, buffer=1000,
                               type="trapbuffer") 

plot(ascr_mask,dots=F,mesh="grey",col="aliceblue")
plot(traps, detpar = list(pch=3,cex=0.8,col="purple"),add=T)
plot(owin(xrange=c(-800,4800),yrange=c(-800,4800)),add=T,col='blue')

fit_ascr_hn <- fit.ascr(capt=as_capture, traps=traps,
                        fix = list(g0=1),
                      mask = ascr_mask, detfn = 'hn')
summary(fit_ascr_hn)
AIC.ascr(fit_ascr_hn)

par(mar=c(5,5,2,2))
show.detfn(fit_ascr_hn)
show.detsurf(fit_ascr_hn,surface = F,col='green',show.labels = T)
locations(fit_ascr_hn, 2, infotypes='all',
          levels=c(0.3,0.5,0.7,0.9), density=F,
          #xlim=c(722000,725000),ylim = c(1363000,1365500),
          plot.contours = T,plot.arrows = T,plot.circles = T)

spacing=400
density=0.04
w = owin(xrange = c(-2*spacing,12*spacing), yrange = c(-2*spacing,12*spacing))
n <- round(density*(spacing^2)*196/10000)
# simulate the population with some reasonable guess for density, plot(pop) to verify
sim_location <- rmh(model= list(cif = 'hardcore', par = list(beta=4e-5,hc=350), w = w)) 
                    #start=list(n.start = n),
                    #control=list(nrep=1e6))
