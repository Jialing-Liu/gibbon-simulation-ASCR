setwd('C:/CR/simulation code/gibbon-simulation-ASCR')
source('./simulation/ascr_sim.R')
#specify parameters
ascr_n_sims<-100
num_instances <- 100
sigma<-1000
spacing<-400
hardcore<-list(beta=5e-4, hc = 350)
kappa <- 5
buffer <- 2000
true_density <- 0.01

output <- matrix(0,nrow = num_instances, ncol = ascr_n_sims)
for(i in 1:num_instances){
  output[i,] <- lapply(output[i,], ascr_sim, spacing = spacing,
                       density = true_density,sigma = sigma, hardcore = hardcore,
                       kappa = kappa, buffer = buffer)
  true_density <- true_density + 0.01
}
