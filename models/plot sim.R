setwd('D:/simulation data')
h1<-read.csv('density-hardcore-4500.csv',header = T)
h2<-read.csv('density-hardcore-4000.csv',header = T)
h3<-read.csv('density-hardcore-3500.csv',header = T)
h4<-read.csv('density-hardcore-3000.csv',header = T)
s1<-read.csv('density-strauhard-4500.csv',header = T)
s2<-read.csv('density-strauhard-4000.csv',header = T)
s3<-read.csv('density-strauhard-3500.csv',header = T)
s4<-read.csv('density-strauhard-3000.csv',header = T)

par(mar=c(4,4,2,2))
par(mfrow=c(2,2))
plot(y=rowMeans(h1), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=4500)',pch=16,cex=.8,col='blue')
plot(y=rowMeans(h2), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=4000)',pch=16,cex=.8,col='blue')
plot(y=rowMeans(h3), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=3500)',pch=16,cex=.8,col='blue')
plot(y=rowMeans(h4), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=3000)',pch=16,cex=.8,col='blue')

plot(y=rowMeans(s1), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=4500)',pch=16,cex=.8,col='blue')
plot(y=rowMeans(s2), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=4000)',pch=16,cex=.8,col='blue')
plot(y=rowMeans(s3), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=3500)',pch=16,cex=.8,col='blue')
plot(y=rowMeans(s4), x=seq(0.005, 0.0197, 0.0003), xlab = 'Density/Hectare',
     ylab = 'Estimate / True Density', xlim = c(0.004,0.021),ylim=c(0.7,1.3),
     main = 'Effect of density on error for ASCR method(distance=3000)',pch=16,cex=.8,col='blue')
