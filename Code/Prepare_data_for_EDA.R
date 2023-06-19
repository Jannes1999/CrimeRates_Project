
Data1 <- as_tibble(Crime_Economics_data)

Data1$`Per Capita Income` <-  gsub(",", " ", Data1$`Per Capita Income`)
Data1$`Population Density (per sq. km)` <-  gsub(",", " ", Data1$`Population Density (per sq. km)`)
Data1$`Per Capita Income` <-  gsub(" ", "", Data1$`Per Capita Income`)
Data1$`Population Density (per sq. km)` <-  gsub(" ", "", Data1$`Population Density (per sq. km)`)
sapply(Data1[,-1], as.numeric)

Data1[,-1] <- sapply(Data1[,-1], as.numeric)

