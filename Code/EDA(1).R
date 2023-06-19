Data1 <- as.tibble(Crime_Economics_data)
Data1$`Per Capita Income` <-  gsub(",", " ", Data1$`Per Capita Income`)
Data1$`Population Density (per sq. km)` <-  gsub(",", " ", Data1$`Population Density (per sq. km)`)
Data1$`Per Capita Income` <-  gsub(" ", "", Data1$`Per Capita Income`)
Data1$`Population Density (per sq. km)` <-  gsub(" ", "", Data1$`Population Density (per sq. km)`)
sapply(Data1[,-1], as.numeric)

Data1[,-1] <- sapply(Data1[,-1], as.numeric)

# predictor correlation

Data1_corr <- cor(Data1[,-1])
library(corrplot)
corrplot(Data1_corr)
# the heatmap looks a lot better
palette = colorRampPalette(c("darkgreen", "white", "darkred")) (20)
heatmap(x = Data1_corr, col = palette, symm = TRUE, main = "Heatmap")

#It makes sence that happiness and hdi have a high correlation as hdi uses happines as in unput in some sense
# decide what threshold to use eg. r > 0.9. 

install.packages("heatmaply")
library(heatmaply)

heatmaply_cor(cor(Data1[,-1]),
              xlab = "Features",
              ylab = "Features",
              k_col = 2,
              k_row = 2)

vip(Crime_Economics_data, num_features = 9, geom = "point")





