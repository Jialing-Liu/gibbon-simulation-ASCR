require(secr)
library(spatstat)
library(ascr)
library(circular)

#generate triangle traps
#spacing(the distance of traps in a triangle) is 400 meters
#generate traps,arranging in n rows and n columns
#'distance' is the distance of triangles

generate_traps<-function(n, distance){
  out<-make.circle(n = 3, spacing = 400, detector = 'proximity',
                   originxy = c(5000,5000))
  k=1
  for(i in 1:n){
    for(j in 1:n){
      originxy <- c(5000+distance*(i-1),5000+distance*(j-1))
      new <- make.circle(n = 3, spacing = 400, detector = 'proximity',
                         originxy = originxy)
      out <- rbind(out, new)
      k=k+1
    }
  }
  out <- out[c(-1,-2,-3),]
  row.names(out)<-1:(3*n^2)
  attr(out,'distance')<-distance
  attr(out,'n')<-n
  return(out)
}
