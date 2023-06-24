dens_plot <- function(alpha, binwidth){
 
  y <- Data1 %>% ggplot()+
    geom_histogram(aes(y= after_stat(density),x =`Crime Rate` ), colour = "black", fill="#CDCDCD", binwidth = binwidth) +
    geom_density(aes(x =`Crime Rate`)) +
    geom_vline(aes(xintercept=mean(`Crime Rate`)),
               color="blue", linetype="dashed", linewidth = 1) +
    labs(title = "Crime rate density")
    theme_bw()
    
  print(y)
  
}


