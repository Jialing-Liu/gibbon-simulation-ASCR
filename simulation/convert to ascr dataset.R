#convert capture history to ascr dataset with bearings

convert_to_ascr <- function(out,simulate=F,kappa=NULL) {
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
      if(bincapt[i,j]==1)
        bearing_true[i,j]<-bearings(as.matrix(attr(out,'popn')),
                                    as.matrix(attr(out,'traps')))[as.numeric(rn[i]),j]
        bearing_true <- circular(bearing_true)
        if(simulate==T){
          a <- rvonmises(n = 5, bearing_true[i,j], kappa = kappa,
                               control.circular = list(type='angles',units='radians'))
          b <- which.min(abs(a-bearing_true[i,j]))
          bearing[i,j] <- a[b]
        }else {bearing[i,j] <- bearing_true[i,j]}
        
      } else {bearing_true[i,j] <-0
      bearing[i,j]<-0
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
