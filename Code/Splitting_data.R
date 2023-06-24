library(rsample)
set.seed(123)  # Set the seed for reproducibility
split_1  <- initial_split(Data1, prop = 0.7)  # Split the dataset 
train_2  <- training(split_1)  # Training set
test_2   <- testing(split_1)  # Test set