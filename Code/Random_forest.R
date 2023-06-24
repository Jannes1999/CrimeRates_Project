# number of features
n_features <- length(setdiff(names(train_2), "Crime_Rate"))
library(ranger)
# train a default random forest model
data1_rf1 <- ranger(
  train_2$Crime_Rate ~ ., 
  data = train_2,
  mtry = floor(n_features / 3),
  respect.unordered.factors = "order",
  seed = 123
)

# get OOB RMSE
(default_rmse <- sqrt(data1_rf1$prediction.error))


num_trees <- seq(100, 1000, by = 10)

# Create empty vectors to store the RMSE and number of trees
rmse_values <- numeric()
tree_values <- numeric()

# Train random forest models with different numbers of trees
for (n_trees in num_trees) {
  # Train the random forest model
  model <- ranger(
    train_2$Crime_Rate ~ ., 
    data = train_2,
    mtry = floor(n_features / 3),
    respect.unordered.factors = "order",
    num.trees = n_trees,
    seed = 123
  )
  
  # Calculate the RMSE
  rmse <- sqrt(model$prediction.error)
  # Store the RMSE and number of trees
  rmse_values <- c(rmse_values, rmse)
  tree_values <- c(tree_values, n_trees)
}

# Create a data frame with the RMSE and number of trees
plot_data <- data.frame(RMSE = rmse_values, Trees = tree_values)

min_rmse_trees <- plot_data$Trees[which.min(plot_data$RMSE)]
min_rmse <- min(plot_data$RMSE)

# Plot the RMSE vs. number of trees
ggplot(plot_data, aes(x = Trees, y = RMSE)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = ifelse(Trees == min_rmse_trees, paste("Lowest RMSE:", min_rmse), "")),
            x = min_rmse_trees, y = min_rmse, vjust = -1.5, hjust = -0.5, color = "red") +
  geom_text(aes(label = paste("Optimal number of trees:", min_rmse_trees)),
            x = min_rmse_trees, y = min_rmse, vjust = 2, hjust = 0.5, color = "red") +
  labs(x = "Number of Trees", y = "RMSE", title = "RMSE vs. Number of Trees") +
  theme_bw()


predictions <- predict(data1_rf1, newdata = test_2)

performance_metrics <- your_evaluation_function(predictions, test_2$Crime_Rate)

# re-run model with impurity-based variable importance
rf_impurity <- ranger(
  formula = Crime_Rate ~ ., 
  data = train_2, 
  num.trees = 330,
  mtry = floor(n_features / 3),
  min.node.size = 1,
  sample.fraction = .80,
  replace = FALSE,
  importance = "impurity",
  respect.unordered.factors = "order",
  verbose = FALSE,
  seed  = 123
)

# re-run model with permutation-based variable importance
rf_permutation <- ranger(
  formula = Crime_Rate ~ ., 
  data = train_2, 
  num.trees = 330,
  mtry = floor(n_features / 3),
  min.node.size = 1,
  sample.fraction = .80,
  replace = FALSE,
  importance = "permutation",
  respect.unordered.factors = "order",
  verbose = FALSE,
  seed  = 123
)

p1 <- vip::vip(rf_impurity, num_features = 8, geom = "point")
p2 <- vip::vip(rf_permutation, num_features = 8, geom = "point")
p1
p2
