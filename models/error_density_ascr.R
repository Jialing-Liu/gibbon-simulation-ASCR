setwd('C:/CR/simulation code/gibbon-simulation-ASCR')
source('./simulation/ascr_sim.R')
#specify parameters
n_sims<-10
n_instances <- 100
sigma<-1000
spacing<-400
hardcore<-list(beta=5e-5, hc = 700)
kappa <- 10
buffer <- 3000
true_density <- 0.01

density <- matrix(0,nrow = n_instances, ncol = n_sims)
density_error<-sigma_fit<-kappa_fit<-sigma_error<-kappa_error<-density
for(i in 1:n_instances){
  for(j in 1:n_sims){
    output <-ascr_sim(spacing = spacing,density = true_density,sigma = sigma,
                      hardcore = hardcore, kappa = kappa, buffer = buffer,
                      out = 'all')
    density[i,j] <- output['D',]
    sigma_fit[i,j] <- output['sigma',]
    kappa_fit[i,j] <- output['kappa',]
    density_error[i,j]<-density[i,j]/true_density
    
  }
  true_density <- true_density + 0.001
}

 #plot error ratios of density
plot(y=rowMeans(output_error), x=seq(0.01, 0.5, 0.01), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0,0.6),ylim=c(0.5,2),
     main = 'Effect of density on error for ASCR method(density=0.04)',pch=16,cex=.8,col='blue')
