#generate traps,arranging in nx*ny
generate_traps<-function(spacing=spacing, nx, ny){
  out<-make.circle(n = 3, spacing = spacing, detector = 'proximity', originxy = c(5000,5000))
  k=1
  for(i in 1:nx){
    for(j in 1:ny){
      originxy <- c(5000*i,5000*j)
      new <- make.circle(n = 3, spacing = spacing, detector = 'proximity',
                         originxy = originxy)
      out <- rbind(out, new)
      k=k+1
    }
  }
  out <- out[c(-1,-2,-3),]
  row.names(out)<-1:(nx*ny*3)
  return(out)
}
