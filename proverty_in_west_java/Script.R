library(spdep)
library(lmtest)
library(plm)
library(car)
library(GWmodel)
library(olsrr)
library(ggplot2)


data.GWPR=read.csv("C:/Users/Nadia Salsabila/OneDrive/Data_SAC23.csv", sep = ';')
data.GWPR$X1
str(data.GWPR)
names(data.GWPR)

#Scatterplot
ggplot(data.GWPR, aes(x = X1, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot Y vs X1")
ggplot(data.GWPR, aes(x = X2, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot Y vs X2")
ggplot(data.GWPR, aes(x = X3, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot Y vs X3")
ggplot(data.GWPR, aes(x = X4, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot Y vs X4")
ggplot(data.GWPR, aes(x = X5, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot Y vs X5")

#Regresi Linear Berganda
regresi = lm(Y~X1+X2+X3+X4+X5, data=data.GWPR)
summary(regresi)

#Cek Multikolinearitas
multikol = as.data.frame(vif(regresi))
multikol

#Regresi Panel Model PLS, FEM, REM Dengan Stepwise
modelpanel1 = plm(Y~X1+X2+X3+X4+X5, data= data.GWPR, model="random", index=c("Kab.Kota","Tahun")) #Random effect
modelpanel2 = plm(Y~X1+X2+X3+X4+X5, data= data.GWPR,model="within", index=c("Kab.Kota","Tahun")) #Fixed effect
modelpanel3 = plm(Y~X1+X2+X3+X4+X5, data= data.GWPR,model="pooling", index=c("Kab.Kota","Tahun")) #Pooled OLS/common

#Uji Chow (fixed vs common)
pFtest(modelpanel2,modelpanel3)
##Hasil tolak H0, maka FEM > CEM
#Uji Hausman (fixed vs random)
phtest(modelpanel2,modelpanel1)
##Hasil tolak H0, maka FEM > REM
##Keputusan akhir: FEM Terpilih

#Untuk melihat uji parsial model panel terpilih
summary(modelpanel2)
#==========================================

#Jika hasilnya fixed effect, lanjutkan ke uji asumsi model REM
#1. Uji Normalitas
library(stats)
error = resid(modelpanel2)
shapiro.test(error)
qqnorm(error)
hist(error)

#2. Uji Heteroskedastisitas
bptest(modelpanel2)
#Berdasarkan hasil uji breush pagan, ternyata ada efek spasial
#Karena terdapat keragaman, gunakan GWPR

#3. Uji Autokorelasi
coords = coordinates(data.GWPR[5:6])
nb = knn2nb(knearneigh(coords, k = 3))
lw = nb2listw(nb, style = "W")
moran.test(error, lw)

#===================================
#GWR PANEL REGRESSION
#===================================
#Merubah data ke spasial titik data frame
data.sp.GWPR=data.GWPR
coordinates(data.sp.GWPR)=5:6
class(data.sp.GWPR)
head(data.sp.GWPR)

#Mencari bandwith optim.(Dari hasil regresi data panel)
#Cek kernel untuk gaussian dan exponential dan bandingkan AIC nya
bwd.GWPR<-bw.gwr(Y~X1+X2+X3+X4+X5,data=data.sp.GWPR,approach = "CV",kernel = "bisquare",adaptive = F)
hasil.GWPR<-gwr.basic(Y~X1+X2+X3+X4+X5,data=data.sp.GWPR,bw=bwd.GWPR,kernel = "bisquare",adaptive = F)

hasil.GWPR$GW.diagnostic$AIC
hasil.GWPR$GW.diagnostic$gw.R2
hasil.GWPR$SDF

#OUTPUT
#estimasi parameter
parameter.GWPR = as.data.frame(hasil.GWPR$SDF[,1:6])
#pvalue
p.value.GWPR = gwr.t.adjust(hasil.GWPR)$results$p
#R2
local.R2.GWPR = hasil.GWPR$SDF$Local_R2

#Export Hasil analisis GWPR ke Excel
output.GWPR=cbind(parameter.GWPR,p.value.GWPR,local.R2.GWPR)
output.GWPR
write.table(output.GWPR,"C:/Users/Nadia Salsabila/OneDrive/Output_SAC23.csv")

