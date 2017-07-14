require(secr)
library(spatstat)
library(ascr)
library(circular)

# wrapper function for secr make.circle
generate_traps = function(spacing){
  xrange = yrange = spacing * 10 
  return(make.circle(n = 3, spacing = spacing, detector = "proximity",
                     originxy = c(xrange / 2, yrange / 2)))
}

capture_history = function(traps, density, sigma,
                           hardcore = list(beta=NULL, hc=NULL)){
  spacing = attr(traps,'spacing')
  xrange = spacing*10
  w = owin(xrange = c(-10*spacing,20*spacing), yrange = c(-10*spacing,20*spacing))
  n <- round(density*(spacing^2)*900/10000)
  # simulate the population with some reasonable guess for density, plot(pop) to verify
  sim_location <- rmh(model= list(cif = 'hardcore', par = hardcore, w = w), 
                      start=list(n.start = n),
                      control=list(p=1))
  m=1
  while(m != n){
    pop <- sim.popn(D = density,
                    expand.grid(x = c(0, xrange), y = c(0, xrange)),
                    buffer = xrange, nsessions = 1)
    m <- nrow(pop)
  }
  
  pop$x <- sim_location$x
  pop$y <- sim_location$y
  out <- sim.capthist(traps=traps, popn = pop, noccasions = 1,
                      detectpar = list(g0 = 1, sigma = sigma), 
                      savepopn = TRUE, renumber = FALSE, p.available = 1)
  while(is.null(dim(out[, 1, ]))){
    sim_location <- rmh(model= list(cif = 'hardcore', par = hardcore, w = w), 
                        start=list(n.start = n),
                        control=list(p=1))
    m=1
    while(m != n){
      pop <- sim.popn(D = density,
                      expand.grid(x = c(0, xrange), y = c(0, xrange)),
                      buffer = xrange, nsessions = 1)
      m <- nrow(pop)
    }
    
    pop$x <- sim_location$x
    pop$y <- sim_location$y
    out <- sim.capthist(traps=traps, popn = pop, noccasions = 1,
                        detectpar = list(g0 = 1, sigma = sigma), 
                        savepopn = TRUE, renumber = FALSE, p.available = 1)
  }
  return(out)
}



#simulate bearing
convert_to_ascr <- function(out,kappa) {
  bincapt <- out[,1,]
  nr <- dim(out)[1]
  nc <- dim(out)[3]
  colnames(bincapt) <- c(paste(rep('bincapt',nc), seq(1, nc, 1),sep='.'))
  bearing_true <- matrix( nrow = nr, ncol = nc,
                          dimnames = list(c(1:nr),
                                          c(paste(rep('bearing_true',nc),seq(1,nc,1),
                                                  sep = '.'))))
  bearing <- matrix( nrow = nr, ncol = nc,
                     dimnames = list(c(1:nr),c(paste(rep('bearing',nc),seq(1,nc,1),
                                                     sep = '.'))))
  rn<-rownames(bincapt)
  for (i in 1:nr) {
    for (j in 1:nc){
      if(bincapt[i,j]==1){
        bearing_true[i,j]<-bearings(as.matrix(attr(out,'popn')),
                                    as.matrix(attr(out,'traps')))[as.numeric(rn[i]),j]
        mu <- circular(bearing_true[i,j])
        bearing[i,j] <- rvonmises(n = 1, mu, kappa = kappa,
                                  control.circular = list(type='angles',units='radians')) 
      } else {bearing_true[i,j] <-NA
              bearing[i,j]<-NA
      }
      j=j+1
    }
    i=i+1
  }
  row.names(bincapt) <- 1:nrow(bincapt)
  ascr_capt <- list(bincapt, bearing)
  names(ascr_capt)<-c('bincapt','bearing')
  return(ascr_capt)
}
