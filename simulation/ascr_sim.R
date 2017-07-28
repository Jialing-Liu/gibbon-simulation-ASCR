#combine functions to simulation
#it returns estimated parameters of ascr and secr(attribution of it)
#'buffer' is the buffer of capture area when fit models
ascr_sim <- function(n, distance, density, sigma, hardcore=NULL,
                     strausshard = NULL,simulate,kappa=NULL,buffer) {
  traps <- generate_traps(n,distance)
  capture <- capture_history(traps, density, sigma, hardcore, strausshard)
  as_capture <- convert_to_ascr(capture,simulate,kappa)
  ascr_mask <- make.mask(traps = traps, buffer,
                         type="trapbuffer",nx=64)
  fit_secr_hn <- secr.fit(capture, buffer=buffer,detectfn = 'HN',
                          fix=list(g0=1),trace=F,verify = T,
                          binomN = 1)
  fit_ascr_hn <- fit.ascr(capt=as_capture, traps=traps,
                          fix = list(g0=1),
                          mask = ascr_mask, detfn = 'hn')
  
  out<-as.data.frame(fit_ascr_hn$coefficients)
  attr(out,'secr')<-fit_secr_hn
  return(out)
}


