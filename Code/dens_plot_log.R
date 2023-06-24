dens_plot_log <- function(alpha, binwidth){
  
Data1$`Crime Rate` = log(Data1$`Crime Rate`)
x <- Data1 %>% ggplot()+
  geom_histogram(aes(y= after_stat(density),x =`Crime Rate` ), colour = "black", fill="#CDCDCD", binwidth) +
  geom_density(aes(x =`Crime Rate`)) +
  geom_vline(aes(xintercept=mean(`Crime Rate`)),
             color="blue", linetype="dashed", linewidth = 1) +
  labs(title = "log Crime rate density")

print(x)

}
