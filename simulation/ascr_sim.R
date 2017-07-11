set.seed(2345)
ascr_sim <- function(spacing, density, sigma, hardcore, kappa) {
  traps <- generate_traps(spacing)
  capture <- capture_history(traps, density, sigma, hardcore)
  as_capture <- convert_to_ascr(capture, kappa)
  ascr_mask <- make.mask(traps = traps, buffer=4*sigma,
                         type="trapbuffer") 
  fit_ascr_hn <- fit.ascr(capt=as_capture, traps=traps,
                          fix = list(g0=1),
                          mask = ascr_mask, detfn = 'hn')
  return(as.data.frame(fit_ascr_hn$coefficients))
  
}
