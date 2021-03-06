#simulations on different density
sim_density<-function(n_sims=n_sims, n_inst=n_inst, n=n, distance=distance,
                      sigma=sigma, hardcore=NULL, strausshard=NULL,simulate=F,
                      kappa=NULL,buffer=buffer, start_d=start_d, by=by){
  density <- matrix(0,nrow = n_inst, ncol = n_sims)
  density_error<-sigma_fit<-kappa_fit<-sigma_error<-kappa_error<-secr<-secr_error<-density
  for(i in 1:n_inst){
    for(j in 1:n_sims){
      output <-ascr_sim(n=n,distance = distance,density = start_d,
                        sigma = sigma, hardcore = hardcore, strausshard=strausshard,
                        simulate=simulate,kappa=kappa,buffer = buffer)
      density[i,j] <- output['D',]
      sigma_fit[i,j] <- output['sigma',]
      kappa_fit[i,j] <- output['kappa',]
      secr[i,j]<-exp(attr(output,'secr')$fit$par[1])   
      
      secr_error[i,j]<-(secr[i,j]-start_d)/start_d
      density_error[i,j]<-(density[i,j]-start_d)/start_d
      print(paste('instance',i,'simulation',j,' '))
    }
    start_d <- start_d + by
  }
  attr(density_error,'density')<-density
  attr(density_error,'sigma')<-sigma_fit
  attr(density_error,'kappa')<-kappa_fit
  attr(density_error,'secr')<-secr
  attr(density_error,'secr_error')<-secr_error
  return(density_error)
}
