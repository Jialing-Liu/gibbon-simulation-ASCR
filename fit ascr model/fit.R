ascr_mask <- make.mask(traps = traps, buffer=2000,
                               type="trapbuffer") 

plot(ascr_mask,dots=F,mesh="grey",col="aliceblue")
plot(traps, detpar = list(pch=3,cex=0.8,col="purple"),add=T)

fit_ascr_hn <- fit.ascr(capt=as_capture, traps=traps,
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

