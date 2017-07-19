#hardcore, distance=5000, traps in 3*3
sim1<-sim_density(n_sims=5, n_inst=22, n=3, distance=5000,
                  sigma=1000,  hardcore=list(beta=5e-5, hc = 700),
                  kappa=10, buffer=3000, start_d=0.005,by=0.0007)
#plot error ratios of density
plot(y=rowMeans(sim1), x=seq(0.005, 0.0197, 0.0007), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.5,1.1),
     main = 'Effect of density on error for ASCR method(sigma=1000)',pch=16,cex=.8,col='blue')
 

#hardcore, distance=4500, traps in 3*3
sim2<-sim_density(n_sims=5, n_inst=22, n=3, distance=4500,
                  sigma=1000,  hardcore=list(beta=5e-5, hc = 700),
                  kappa=10, buffer=3000, start_d=0.005,by=0.0007)
#plot error ratios of density
plot(y=rowMeans(sim2), x=seq(0.005, 0.0197, 0.0007), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.5,1.1),
     main = 'Effect of density on error for ASCR method(sigma=1000)',pch=16,cex=.8,col='blue')


#hardcore, distance=4000, traps in 3*3
sim3<-sim_density(n_sims=5, n_inst=22, n=3, distance=4000,
                  sigma=1000,  hardcore=list(beta=5e-5, hc = 700),
                  kappa=10, buffer=3000, start_d=0.005,by=0.0007)
#plot error ratios of density
plot(y=rowMeans(sim3), x=seq(0.005, 0.0197, 0.0007), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.5,1.1),
     main = 'Effect of density on error for ASCR method(sigma=1000)',pch=16,cex=.8,col='blue')


#hardcore, distance=4000, traps in 3*3
sim4<-sim_density(n_sims=5, n_inst=22, n=3, distance=3500,
                  sigma=1000,  hardcore=list(beta=5e-5, hc = 700),
                  kappa=10, buffer=3000, start_d=0.005,by=0.0007)
#plot error ratios of density
plot(y=rowMeans(sim4), x=seq(0.005, 0.0197, 0.0007), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.5,1.1),
     main = 'Effect of density on error for ASCR method(sigma=1000)',pch=16,cex=.8,col='blue')
