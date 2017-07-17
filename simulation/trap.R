#generate traps
generate_traps<-function(spacing, nx, ny){
  a<-make.circle(n = 3, spacing = spacing, detector = 'signal', originxy = c(5000,5000))
  a<-data.frame(A)
  out <- a
  k=1
  for(i in 1:nx){
    for(j in 1:ny){
      new <- data.frame(x=1:3,y=1:3)
      new$x <- a$x + 5000 * (i-1)
      new$y <- a$y + 5000 * (j-1)
      assign(LETTERS[k], new)
      out <- rbind(out, new)
      k=k+1
          }
  }
  out <- out[c(-1,-2,-3),]
  row.names(out)<-1:(nx*ny*3)
  attr(out,'detector')<-'signal'
  attr(out,'spacex')<-spacing
  attr(out,'spacey')<-spacing
  attr(out,'spacing')<-spacing
  return(out)
}
