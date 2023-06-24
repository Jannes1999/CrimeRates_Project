dens_plot_boxcox <- function(alpha, binwidth){
  
  library(MASS)
  
  Data1$`Crime Rate` = boxcox(Data1$`Crime Rate`)
  g <- Data1 %>% ggplot()+
    geom_histogram(aes(y= after_stat(density),x =`Crime Rate` ), colour = "black", fill="#CDCDCD") +
    geom_density(aes(x =`Crime Rate`)) +
    geom_vline(aes(xintercept=mean(`Crime Rate`)),
               color="blue", linetype="dashed", linewidth = 1) +
    labs(title = "log Crime rate density")
  
  print(g)
  
}
dens_plot_boxcox(alpha = 0.7, binwidth = 1)
