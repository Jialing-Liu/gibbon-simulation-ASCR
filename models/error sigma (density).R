ascr_n_sims<-50
num_instances <- 50
density<-0.04
spacing<-400
hardcore<-list(beta=5e-4, hc = 350)
kappa <- 5
buffer <- 2000
true_sigma <- 500

output <- matrix(0,nrow = num_instances, ncol = ascr_n_sims)
output_error<-output
for(i in 1:num_instances){
  for(j in 1:ascr_n_sims){
    output[i,j] <-ascr_sim(spacing = spacing,
                           density = density,sigma = true_sigma, hardcore = hardcore,
                           kappa = kappa, buffer = buffer, out = 'sigma')
    j=j+1
  }
  output_error[i,]<-output[i,]/true_sigma
  true_sigma <- true_sigma + 10
  i=i+1
}

#plot error ratios of density
plot(y=rowMeans(output_error), x=seq(0.01, 0.5, 0.01), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0,0.6),ylim=c(0.5,2),
     main = 'Effect of density on error for ASCR method')
lm_model<-lm(rowMeans(output_error)~I(seq(0.01,0.5,0.01)^(-2)))
pred<-predict(lm_model,list(density=seq(0.01,0.5,0.01)))
lines(seq(0.01,0.5,0.01),pred,lwd=2,col='blue')