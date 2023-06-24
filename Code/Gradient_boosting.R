suppressMessages({library(gbm)})      # for original implementation of regular and stochastic GBMs
suppressMessages({library(h2o)})     # for a java-based implementation of GBM variants
suppressMessages({library(xgboost)})

# run a basic GBM model
set.seed(123)  # for reproducibility
Data1_gbm1 <- gbm(
  formula = Crime_Rate ~ .,
  data = train_2,
  distribution = "gaussian",  # SSE loss function
  n.trees = 5000,
  shrinkage = 0.1,
  interaction.depth = 3,
  n.minobsinnode = 10,
  cv.folds = 10
)

# find index for number trees with minimum CV error
best <- which.min(Data1_gbm1$cv.error)
# get MSE and compute RMSE
sqrt(Data1_gbm1$cv.error[best])
## [1] 23240.38

# plot error curve
gbm.perf(Data1_gbm1, method = "cv")