

knitr::opts_chunk$set(echo = TRUE)
suppressMessages({library(tidyverse)})
suppressMessages({library(readxl)})

Crime_Economics_data <- read_excel("Code/Data/Crime Economics - data.xlsx", skip = 1)

Data1 <- as_tibble(Crime_Economics_data)

Data1$`Per Capita Income` <-  gsub(",", " ", Data1$`Per Capita Income`)
Data1$`Population Density (per sq. km)` <-  gsub(",", " ", Data1$`Population Density (per sq. km)`)
Data1$`Per Capita Income` <-  gsub(" ", "", Data1$`Per Capita Income`)
Data1$`Population Density (per sq. km)` <-  gsub(" ", "", Data1$`Population Density (per sq. km)`)
sapply(Data1[,-1], as.numeric)

Data1 <- sapply(Data1[,-1], as.numeric)
Data1 <- as_tibble(Data1)

Data1 <- Data1 %>% rename(Crime_Rate = `Crime Rate`)
Data1 <- Data1 %>% rename(Unemployment_percentage = `Unemployment (%)`)
Data1 <- Data1 %>% rename(Population_Density_per_sq_km = `Population Density (per sq. km)`)
Data1 <- Data1 %>% rename(Weapons_per_100_persons = `Weapons per 100 persons`)
Data1 <- Data1 %>% rename(Per_Capita_Income = `Per Capita Income`)
Data1 <- Data1 %>% rename(Gini_Coefficient = `Gini Coefficient`)
Data1 <- Data1 %>% rename(Literacy_Rate = `Literacy Rate`)
Data1 <- Data1 %>% rename(Happiness_Index = `Happiness Index`)