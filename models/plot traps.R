
par(mar=c(3,3,2.5,3))
plot(y=NULL,x=NULL,xlab = '',ylab = '', 
     xlim=c(0,18000),ylim=c(0,18000),xaxt='n',yaxt='n')
axis(1,at=c(0,5000,9000,13000,18000))
axis(2,at=c(0,5000,9000,13000,18000))
plot(traps1,border = 5000,detpar = list(pch=16, col='blue'), add=T)
