require(secr)
library(spatstat)
library(ascr)
library(circular)

#spacing is the distance of traps in a triangle
#generate traps,arranging in n lines and n columns
#distance is the distance of triangles

generate_traps<-function(spacing=spacing, n, distance){
  out<-make.circle(n = 3, spacing = spacing, detector = 'proximity',
                   originxy = c(5000,5000))
  k=1
  for(i in 1:n){
    for(j in 1:n){
      originxy <- c(5000+distance*(i-1),5000+distance*(j-1))
      new <- make.circle(n = 3, spacing = spacing, detector = 'proximity',
                         originxy = originxy)
      out <- rbind(out, new)
      k=k+1
    }
  }
  out <- out[c(-1,-2,-3),]
  row.names(out)<-1:(3*n^2)
  attr(out,'distance')<-distance
  return(out)
}
