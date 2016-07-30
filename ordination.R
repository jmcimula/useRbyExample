library(MASS) #Modern Applied Statistics with S
library(vegan) #Community Ecology Package

#Using default datasets

data(varespec)   #species data
data(varechem)   #environmental data

#Distance matrix
bray <- vegdist(varespec, method = "bray")

#Displaying dissimilarity using NMDS
#semi-black box NMDS function
nmds <- metaMDS(varespec, k = 2,distance = 'bray', autotransform = FALSE) 	

#Plot NMDS ordination
ordiplot(nmds, type = "text")

#Calculates environmental vectors			      
fit <- envfit(nmds, varechem[ ,1:4])			   
print(fit)

#Lists vector endpoint coordinates and r-squared values
plot(fit)						   

#a linear representation of environmental variables is not always appropiate
#we could also add a smooth surface of the variable to the plot
ordisurf(nmds, varechem$N, add = TRUE, col = "darkgreen")

#stress value
nmds$stress                                             
