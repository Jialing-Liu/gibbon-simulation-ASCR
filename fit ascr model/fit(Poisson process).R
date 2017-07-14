n_sims <- 100
n_instances <- 100
spacing <- 400
sigma <- 1000
buffer <- 3000
kappa <- 10
true_density <- 0.01

kappa_fit <- density_fit <- matrix(0, nrow = n_instances, ncol = n_sims)
kappa_error <- density_error <- kappa_fit

for(i in 1:n_instances){
  for(j in 1:n_sims){
    output <- ascr_sim_poisson(spacing = spacing, density = true_density,
                               sigma = sigma, buffer = buffer, kappa = kappa)
    kappa_fit[i,j] <- output$coefficients['kappa']
    density_fit[i,j] <- output$coefficients['D']
    density_error[i,j] <- density_fit[i,j]/true_density
    }
  true_density <- true_density + 0.005
}
kappa_error <- kappa_fit/kappa 

#plot error ratios of kappa
plot(y=rowMeans(kappa_error[1:64,]), x=seq(0.01,0.325,0.005), pch=16,
     col='lightgreen',
     xlab = 'Density/Hectare', ylab = 'Estimate / True Kappa',
     xlim = c(0,0.33),ylim = c(0,2),
     main = 'Effect of kappa on error(kappa=10)')

#plot error ratios of density
plot(y=rowMeans(density_error), x=seq(0.01,0.505,0.005),pch=16,col='green',
     xlab = 'Density/Hectare', ylab = 'Estimate / True Density',
     xlim = c(0,0.1),ylim = c(0,2),
     main = 'Effect of density on error')
