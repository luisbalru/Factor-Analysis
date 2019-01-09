install.packages("dplyr")
install.packages("psych")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("gridExtra")

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/forest-fires/forestfires.csv"
fires <- read.csv(url)

fires$month <- as.numeric(fires$month)
fires$day <- as.numeric(fires$day)

library(dplyr)
fires %>% head() %>% kable()

library(psych)
fires_corr <- cor(fires)
KMO(fires_corr)

fires$month <- NULL
fires$RH <- NULL
fires$rain <- NULL
fires_corr <- cor(fires)
round(fires_corr, 2)

install.packages("GPArotation")
library(GPArotation)
nfactors <- 3
nvariables <- dim(fires_corr)[1]
factors <- fa(r = fires_corr, nfactors = nfactors, rotate = "oblimin")

library(ggplot2)
# Plot Eigenvalues / Represented Variance
eigenvalues <- data.frame(factors$e.values)
colnames(eigenvalues) <- c("Values")
eigenvalues$Number <- 1:nrow(fires_corr)

eigenvalues$RepresentedVariance <- NA
for (i in 1:nrow(fires_corr)) {
  eigenvalues$RepresentedVariance[i] <- sum(eigenvalues$Values[1:i])/sum(eigenvalues$Values) * 100
}
eigenvalues$RepresentedVariance_text <- paste(round(eigenvalues$RepresentedVariance, 
                                                    0), " %")

e1 <- ggplot(eigenvalues, aes(Number, y = Values), group = 1)
e1 <- e1 + geom_bar(stat = "identity")
e1 <- e1 + geom_line(aes(y = Values), group = 2)
e1 <- e1 + xlab("Number [-]")
e1 <- e1 + ylab("Eigenvalue [-]")
e1 <- e1 + geom_hline(aes(yintercept = 1), col = "red")
e1 <- e1 + geom_text(aes(label = RepresentedVariance_text), nudge_y = 0.2)
e1 <- e1 + ggtitle("Eigenvalues and explained Variance")
e1 <- e1 + theme_bw()
e1 <- e1 + scale_x_continuous(breaks = seq(1, 10, 1))
e1


library(dplyr)
library(tidyr)
loadings_mat <- as.data.frame(matrix(nrow = nvariables, ncol =nfactors))
loadings_mat$Variable <- colnames(fires)
for (i in 1:nfactors) {
  for (j in 1:nvariables) {
    loadings_mat[j, i] <- factors$loadings[j, i]  
  }
}
colnames(loadings_mat) <- c("Factor1", "Factor2", "Factor3", "Variable")
loadings_mat_gather <- loadings_mat %>% gather("Factor", "Value", 1:nfactors)

loadings_mat$Zero <- 0
f1 <- ggplot(loadings_mat, aes(Zero, Zero))
f1 <- f1 + geom_segment(aes(xend = Factor1, yend=Factor2), 
                        arrow = arrow(length = unit(0.3,"cm")), col="red")  # Variables
f1 <- f1 + geom_text(aes(x = Factor1, y = Factor2, label = Variable))  # Labels
f1 <- f1 + geom_segment(aes(xend = 1, yend=0), 
                        arrow = arrow(length = unit(0.3,"cm")), col="black")  # X-Axis
f1 <- f1 + geom_segment(aes(xend = 0, yend=1), 
                        arrow = arrow(length = unit(0.3,"cm")), col="black")  # X-Axis
f1 <- f1 + xlab("Factor 1")
f1 <- f1 + ylab("Factor 2")
f1 <- f1 + ggtitle("Factor Loadings")
f1 <- f1 + theme_bw(base_size=12)
f1 <- f1 + theme(legend.position="none")
f1

g1 <- ggplot(loadings_mat_gather, aes(Variable, abs(Value), fill=Value))
g1 <- g1 + facet_wrap(~ Factor, nrow=1)
g1 <- g1 +geom_bar(stat="identity")
g1 <- g1 + coord_flip()
g1 <- g1 + scale_fill_gradient2(name = "Loading", 
                                high = "blue", mid = "white", low = "red", 
                                midpoint=0, guide=F) 
g1 <- g1 + xlab("Variable")  # improve x-axis label
g1 <- g1 + ylab("Factor Loading")  #improve y-axis label
g1 <- g1 + ggtitle("Factors")
g1 <- g1 + theme(axis.text=element_text(size=12),
                 axis.title=element_text(size=12, face="bold"))
g1 <- g1 + theme(plot.title = element_text(size=12))
g1 <- g1 + theme_bw(base_size=12)
g1

library(reshape2)
library(gridExtra)
corr_reduced <- fires_corr
for (i in 1: nvariables) {
  corr_reduced[i, i] <- factors$communality[i]
}

corr_melt <- corr_reduced %>% melt()
corr_melt <- corr_melt[order(corr_melt$Var2), ]
p1 <- ggplot(corr_melt, aes(Var1, Var2, fill=abs(value))) 
p1 <- p1 + geom_tile()  #rectangles for each correlation
p1 <- p1 + geom_text(aes(label = round(value, 2)), size=4) 
#add actual correlation value in the rectangle
p1 <- p1 + theme_bw(base_size=10)  #black and white theme with set font size
#rotate x-axis labels so they don't overlap, 
#get rid of unnecessary axis titles
#adjust plot margins
p1 <- p1 + theme(axis.text.x = element_text(angle = 90), 
                 axis.title.x=element_blank(), 
                 axis.title.y=element_blank(), 
                 plot.margin = unit(c(3, 1, 0, 0), "mm")) 
#set correlation fill gradient
p1 <- p1 + scale_fill_gradient(low="white", high="red") + guides(fill=F) 
#omit unnecessary gradient legend

p2 <- ggplot(loadings_mat_gather, aes(Variable, abs(Value), fill=Factor))
p2 <- p2 + geom_bar(stat="identity") + coord_flip()  
p2 <- p2 + ylab("Factor Loading") 
p2 <- p2 + theme_bw(base_size=12) 
#remove labels and tweak margins for combining with the correlation matrix plot
p2 <- p2 +theme(axis.text.y = element_blank(), 
                axis.title.y = element_blank(), 
                plot.margin = unit(c(3, -5, -2, 3), "mm"))
grid.arrange(p1, p2, ncol=2, widths=c(2, 1)) #side-by-side, matrix gets more space


