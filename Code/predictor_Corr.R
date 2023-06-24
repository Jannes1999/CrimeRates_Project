
# predictor correlation

suppressMessages({library(heatmaply)})
Data1_corr <- cor(Data1[,-1])
library(corrplot)
palette = colorRampPalette(c("darkgreen", "white", "darkred")) (20)
heatmap(x = Data1_corr, col = palette, symm = TRUE, main = "Heatmap")



