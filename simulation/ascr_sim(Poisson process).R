ascr_sim_poisson <- function(spacing, density, sigma, buffer,
                             kappa, out='all') {
  traps <- generate_traps(spacing)
  capture <- capture_history_poisson(traps, density, sigma)
  as_capture <- convert_to_ascr(capture, kappa)
  ascr_mask <- make.mask(traps = traps, buffer,
                         type="trapbuffer",nx=100) 
  fit_ascr_hn <- fit.ascr(capt=as_capture, traps=traps,
                          fix = list(g0=1),
                          mask = ascr_mask, detfn = 'hn')
  if(out=='all'){
    return(as.data.frame(fit_ascr_hn$coefficients))
  } else if (out=='density'){
    return(as.data.frame(fit_ascr_hn$coefficients)['D',])
  } else if (out == 'sigma'){
    return(as.data.frame(fit_ascr_hn$coefficients)['sigma',])
  }
  
}
