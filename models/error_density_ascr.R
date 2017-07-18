#specify parameters
n_sims<-5
n_instances <- 80
nx<-4
ny<-4
sigma<-1000
spacing<-400
hardcore<-list(beta=5e-5, hc = 700)
kappa <- 10
buffer <- 3000
true_density <- 0.005

density <- matrix(0,nrow = n_instances, ncol = n_sims)
density_error<-sigma_fit<-kappa_fit<-sigma_error<-kappa_error<-density
for(i in 1:n_instances){
  for(j in 1:n_sims){
    output <-ascr_sim(spacing = spacing,nx=nx,ny=ny,density = true_density,sigma = sigma,
                      hardcore = hardcore, kappa = kappa, buffer = buffer,
                      out = 'all')
    density[i,j] <- output['D',]
    sigma_fit[i,j] <- output['sigma',]
    kappa_fit[i,j] <- output['kappa',]
    density_error[i,j]<-density[i,j]/true_density
    
  }
  true_density <- true_density + 0.0002
}
sigma_error<-sigma_fit/1000
 
#plot error ratios of density
plot(y=rowMeans(density_error), x=seq(0.005, 0.0208, 0.0002), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.5,1.1),
     main = 'Effect of density on error for ASCR method(sigma=1000)',pch=16,cex=.8,col='blue')
