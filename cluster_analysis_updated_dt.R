# R example for Cluster analysis

# K-means

# Iris data from three species
head(iris) 

# k-means with three clusters
km <- kmeans(iris[,1:4],centers=3) 

km

# How well are original species reproduced?
xtabs(~ km$cluster + iris$Species)

# Plot clusters on principal components scores
au <- princomp(iris[,1:4],cor=TRUE,scores=TRUE)

plot(au$scores[,1],au$scores[,2],asp=1,xlab="1st principal component",ylab="2nd principal component",main="Scores plot",col=km$cluster)

# k-means with five clusters
km5 <- kmeans(iris[,1:4],centers=5)

km5

xtabs(~ km5$cluster + iris$Species)



# Hierarchical cluster analysis
gdist <-read.csv("C:/users/derek/work/teaching/BIOL 4062/2023/gen_dist_mat.csv",header=T)

# Make distance matrix
ggdist<-as.dist(gdist)

# Average linkage
hc<-hclust(ggdist,"ave")

# This plot looks like an additive tree, but isn't!
plot(hc)

# Better
plot(hc,main="Average linkage cluster analysis",ylab="Genetic distance",xlab="",sub="",hang=-1)

# Cophenetic distances
cbind(cophenetic(hc),ggdist)

# Cophenetic correlation coefficient
cor(cophenetic(hc),ggdist)



# Single linkage cluster analysis
hcs<-hclust(ggdist,"sin")

plot(hcs,main="Single linkage cluster analysis",ylab="Genetic distance",xlab="",sub="",hang=-1)

# Cophenetic correlation coefficient
cor(cophenetic(hcs),ggdist)
