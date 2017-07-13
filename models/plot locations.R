par(mar = c(1,1,2,1), mfrow = c(2,2))
p1<-plot_hardcore(spacing = 400, density = 0.02,  hardcore = list(beta= 4e-5,hc=700))
p2<-plot_hardcore(spacing = 400, density = 0.015, hardcore = list(beta= 4e-5,hc=700))
p3<-plot_hardcore(spacing = 400, density = 0.01,  hardcore = list(beta= 4e-5,hc=700))
p4<-plot_hardcore(spacing = 400, density = 0.005, hardcore = list(beta= 4e-5,hc=700))

par(mfrow=c(1,1))
plot_hardcore(spacing = 400, density = 0.02,  hardcore = list(beta= 4e-5,hc=700))
