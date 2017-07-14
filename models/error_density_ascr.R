setwd('C:/CR/simulation code/gibbon-simulation-ASCR')
source('./simulation/ascr_sim.R')
#specify parameters
ascr_n_sims<-100
num_instances <- 50
sigma<-1000
spacing<-400
hardcore<-list(beta=5e-5, hc = 700)
kappa <- 10
buffer <- 3000
true_density <- 0.01

output <- matrix(0,nrow = num_instances, ncol = ascr_n_sims)
output_error<-output
for(i in 1:num_instances){
  for(j in 1:ascr_n_sims){
  output[i,j] <-ascr_sim(spacing = spacing,
                       density = true_density,sigma = sigma, hardcore = hardcore,
                       kappa = kappa, buffer = buffer, out = 'density')
  j=j+1
  }
  output_error[i,]<-output[i,]/true_density
  true_density <- true_density + 0.01
  i=i+1
}

#plot error ratios of density
plot(y=rowMeans(output_error), x=seq(0.01, 0.5, 0.01), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0,0.6),ylim=c(0.5,2),
     main = 'Effect of density on error for ASCR method')
lm_model<-lm(rowMeans(output_error)~I(seq(0.01,0.5,0.01)^(-2)))
pred<-predict(lm_model,list(density=seq(0.01,0.5,0.01)))
lines(seq(0.01,0.5,0.01),pred,lwd=2,col='blue')
