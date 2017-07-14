#plot the Von Mises distribution of mean=0, kappa=10
x<-seq(-1.5,1.5,0.001)
plot(x, dvonmises(x, mu=circular(0), kappa=10),
     type = 'l', xlim=c(-2,2), ylim=c(0,1.5), col='blue',
     ylab = 'Probability Density',
     main = 'The Von Mises Density Distribution \n (kappa = 10)')
v <- 0.25*pi
abline(h=0)
x1<-c(-v,-v,x[x>-v&x<v],v,v)
y1<-c(0,dvonmises(c(-v,x[x>-v&x<v],v),mu=circular(0), kappa=10),0)
polygon(x1,y1,col='slategray1')
text(v,-0.04,'x=0.785(45)',cex=0.95, col = 'red')
#the probability of x in (-45,45)
p <- 1-2*(1-pvonmises(v, mu=circular(0), kappa=10))
text(0,0.7,paste('p',round(p,3),sep='='), cex = 1.1, col = 'red')

plot(x, dvonmises(x, mu=circular(0), kappa=10),
     type = 'l', xlim=c(-2,2), ylim=c(0,1.5), col='blue',
     ylab = 'Probability Density',
     main = 'The Von Mises Density Distribution \n (kappa = 10)')
lines(x, dvonmises(x, mu=circular(0), kappa=5), col='red', add=T)
lines(x,dvonmises(x, mu=circular(0), kappa=8),col='green')
lines(x,dvonmises(x, mu=circular(0), kappa=1),col='orange')
