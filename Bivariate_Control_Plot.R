library(ggplot2)
library(tidyverse)
library(plot3D)

### MARGINAL VISUALIZATION (per day period)
hum_pd_min <- read.csv("https://raw.githubusercontent.com/ProfNascimento/Unit-Lindley/refs/heads/main/min.csv",sep="")
hum_pd_max <- read.csv("https://raw.githubusercontent.com/ProfNascimento/Unit-Lindley/refs/heads/main/max.csv",sep="")

joined_DB <- merge(hum_pd_min, hum_pd_max, by.x = c("data","pd"), 
                   by.y = c("data","pd"), all.x = TRUE, all.y = FALSE)

## PART 1 (22/12/2016 - 31/12/2020)
joined_df=joined_DB[joined_DB$data < "2021-01-01",]
joined_df[,1]=as.Date(joined_df[,1])

ggplot(subset(joined_df, pd %in% "dawn"), aes(x=data, y=minima, group = 1)) + 
  geom_line(aes(y = minima),size = 0.2) + 
  geom_line(aes(y = maxima),size = 0.2) +
  geom_ribbon(aes(ymin=minima,ymax=maxima), fill="blue", alpha=0.5)+
  # UNIT-LINDLEY CI_85%
  geom_hline(yintercept=0.927, linetype="dashed", size=1.5, color = "red")+
  geom_hline(yintercept=0.197, linetype="dashed", size=1.5, color = "red")+
  # UNIT-LINDLEY CI_90%
  geom_hline(yintercept=0.934, linetype="dashed", size=0.5, color = "red")+
  geom_hline(yintercept=0.142, linetype="dashed", size=0.5, color = "red")+
  # UNIT-LINDLEY CI_99%
  geom_hline(yintercept=0.958, color = "red")+
  geom_hline(yintercept=0.017, color = "red")+
  ylab("Humidity Monitoring (Interval Representation)")+ 
  xlab("Period Observation (DAWN)")+
  scale_x_date(date_labels = "%b/%Y")

##BETA + ESTIMATED PARAMETERS (INVARIANTE CONTROL LIMITS)
ggplot(subset(joined_df, pd %in% "morn"), aes(x=data, y=minima, group = 1)) + 
  geom_line(aes(y = minima),size = 0.2) + 
  geom_line(aes(y = maxima),size = 0.2) +
  geom_ribbon(aes(ymin=minima,ymax=maxima), fill="blue", alpha=0.5)+
  # UNIT-LINDLEY CI_85%
  geom_hline(yintercept=0.927, linetype="dashed", size=1.5, color = "red")+
  geom_hline(yintercept=0.197, linetype="dashed", size=1.5, color = "red")+
  # UNIT-LINDLEY CI_90%
  geom_hline(yintercept=0.934, linetype="dashed", size=0.5, color = "red")+
  geom_hline(yintercept=0.142, linetype="dashed", size=0.5, color = "red")+
  # UNIT-LINDLEY CI_99%
  geom_hline(yintercept=0.958, color = "red")+
  geom_hline(yintercept=0.017, color = "red")+
  ylab("Humidity Monitoring (Interval Representation)")+ 
  xlab("Period Observation (MORNING)")+
  scale_x_date(date_labels = "%b/%Y")

ggplot(subset(joined_df, pd %in% "after"), aes(x=data, y=minima, group = 1)) + 
  geom_line(aes(y = minima),size = 0.2) + 
  geom_line(aes(y = maxima),size = 0.2) +
  geom_ribbon(aes(ymin=minima,ymax=maxima), fill="blue", alpha=0.5)+
  # UNIT-LINDLEY CI_85%
  geom_hline(yintercept=0.927, linetype="dashed", size=1.5, color = "red")+
  geom_hline(yintercept=0.197, linetype="dashed", size=1.5, color = "red")+
  # UNIT-LINDLEY CI_90%
  geom_hline(yintercept=0.934, linetype="dashed", size=0.5, color = "red")+
  geom_hline(yintercept=0.142, linetype="dashed", size=0.5, color = "red")+
  # UNIT-LINDLEY CI_99%
  geom_hline(yintercept=0.958, color = "red")+
  geom_hline(yintercept=0.017, color = "red")+
  ylab("Humidity Monitoring (Interval Representation)")+ 
  xlab("Period Observation (AFTERNOON)")+
  scale_x_date(date_labels = "%b/%Y")

ggplot(subset(joined_df, pd %in% "night"), aes(x=data, y=minima, group = 1)) + 
  geom_line(aes(y = minima),size = 0.2) + 
  geom_line(aes(y = maxima),size = 0.2) +
  geom_ribbon(aes(ymin=minima,ymax=maxima), fill="blue", alpha=0.5)+
  # UNIT-LINDLEY CI_85%
  geom_hline(yintercept=0.927, linetype="dashed", size=1.5, color = "red")+
  geom_hline(yintercept=0.197, linetype="dashed", size=1.5, color = "red")+
  # UNIT-LINDLEY CI_90%
  geom_hline(yintercept=0.934, linetype="dashed", size=0.5, color = "red")+
  geom_hline(yintercept=0.142, linetype="dashed", size=0.5, color = "red")+
  # UNIT-LINDLEY CI_99%
  geom_hline(yintercept=0.958, color = "red")+
  geom_hline(yintercept=0.017, color = "red")+
  ylab("Humidity Monitoring (Interval Representation)")+ 
  xlab("Period Observation (NIGHT)")+
  scale_x_date(date_labels = "%b/%Y")


### BIVARIATE CONTROL CHART (PART 2)
DB=joined_DB[joined_DB$data > "2020-12-31",]

## IMPORTING DATA
n = dim(DB)[1]
data = tibble(t = 1:n,
              v1.ob = DB$maxima,
              v2.ob = DB$minima); data

## UNIT-LINDLEY ESTIMATED PARAMETERS (INVARIANTE CONTROL LIMITS)
v1.li = 0.447; v1.ls = 0.927
v2.li = 0.197; v2.ls = 0.84
alpha = 0.05

data = 
  data %>% 
  mutate(
    t01 = (t-min(t))/(max(t)-min(t)),
    cor = factor(ifelse( v1.ob > v1.li & v1.ob < v1.ls & v2.ob > v2.li & v2.ob < v2.ls, 'black', 'red')),
    cex = ifelse( v1.ob > v1.li & v1.ob < v1.ls & v2.ob > v2.li & v2.ob < v2.ls, 0.5, 0.8 ))

data.out = data %>% filter(cor=='red')

panelfirst <- function(pmat) {
  #
  # PROJECAO V1
  #
  XY <- trans3D(x = data$t, y = rep(1.1,n), z = data$v1.ob, pmat = pmat)
  lines(XY, col = "lightblue", lwd = 0.5)
  XY <- trans3D(x = range(data$t), y = rep(1.1,2), z = rep(v1.ls,2), pmat = pmat)
  lines(XY, col = "blue", lwd = 0.5, lty = 2)
  XY <- trans3D(x = range(data$t), y = rep(1.1,2), z = rep(v1.li,2), pmat = pmat)
  lines(XY, col = "blue", lwd = 0.5, lty = 2)
  #
  # PROJECAO V2
  #
  XY <- trans3D(x = data$t, y = data$v2.ob, z = rep(-0.1,n), pmat = pmat)
  lines(XY, col = "lightblue", lwd = 0.5)
  XY <- trans3D(x = range(data$t), y = rep(v2.ls,2), z = rep(-0.1,2), pmat = pmat)
  lines(XY, col = "blue", lwd = 0.5, lty = 2)
  XY <- trans3D(x = range(data$t), y = rep(v2.li,2), z = rep(-0.1,2), pmat = pmat)
  lines(XY, col = "blue", lwd = 0.5, lty = 2)
  #
}

## CREATING THE 3D FRAME WITH THE PAIRWISE PLOT
scatter3D(x = data$t, y = data$v2.ob, z = data$v1.ob, # type = 'b',
          # expand = 0.9,
          xlim = c(0,n), ylim = c(-0.1, 1.1), zlim = c(-0.1,1.1),
          bty='u', theta = 30, phi = 25, col.axis = "grey", d = 10, 
          pch = 16, cex = data$cex, lwd = data$cex,  
          colvar = as.integer(data$cor), col = as.character(levels(data$cor)), 
          colkey = FALSE,
          # contour = TRUE, 
          xlab = "OBSERVATION POINT", ylab = "MINIMUM", zlab = "MAXIMUM",
          main = "Statistical Process Control (SPC) - PHASE II (2021)",
          panel.first = panelfirst,
          facets = TRUE, scale = TRUE, ticktype = "detailed")

##  ADDING PROJECTIONS (out-of-control points)
l = nrow(data.out)
arrows3D(x0 = data.out$t,     x1 = data.out$t,
         y0 = data.out$v2.ob, y1 = rep(1.1,l), 
         z0 = data.out$v1.ob, z1 = data.out$v1.ob,
         lwd=data$cex, lty=2, col = data.out$cor, length = 0.1, add = T)
arrows3D(x0 = data.out$t,     x1 = data.out$t,
         y0 = data.out$v2.ob, y1 = data.out$v2.ob,
         z0 = data.out$v1.ob, z1 = rep(-0.1,l),
         lwd = data.out$cex, lty=2, col = data.out$cor, length = 0.1, add = T)

## ADDING SHADES - 3D CONTROL LIMITS
# SYMBOLIC BOUNDS (DAILY MIN HUMIDITY)
image3D(x = range(data$t), y = v2.li, z = seq(v1.li,v1.ls,l=2), colvar = NULL, border = 'gray',
        add = TRUE, col = "lightgray", alpha = alpha, plot = TRUE)
image3D(x = range(data$t), y = v2.ls, z = seq(v1.li,v1.ls,l=2), colvar = NULL, border = 'gray',
        add = TRUE, col = "lightgray", alpha = alpha, plot = TRUE)
# SYMBOLIC BOUNDS (DAILY MAX HUMIDITY)
image3D(x = range(data$t), y = seq(v2.li,v2.ls,l=2), z = v1.li, colvar = NULL, border = 'gray',
        add = TRUE, col = "lightgray", alpha = alpha, plot = TRUE)
image3D(x = range(data$t), y = seq(v2.li,v2.ls,l=2), z = v1.ls, colvar = NULL, border = 'gray',
        add = TRUE, col = "lightgray", alpha = alpha, plot = TRUE)

