
# Using rsample package
library(rsample)
set.seed(123)  # Set the seed for reproducibility
split_1  <- initial_split(Data1, prop = 0.7)  # Split the dataset 
train_2  <- training(split_1)  # Training set
test_2   <- testing(split_1)  # Test set


# we use model.matrix(...)[, -1] to discard the intercept

library(vip)
library(caret)
library(glmnet)
X <- model.matrix(train_2$`Crime Rate` ~ ., train_2)[, -1]
Y <- log((train_2$`Crime Rate`))
ridge <- glmnet(
  x = X,
  y = Y,
  alpha = 0
)

plot(ridge, xvar = "lambda")

set.seed(123)

# grid search across 
cv_glmnet <- train(
  x = X,
  y = Y,
  method = "glmnet",
  preProc = c("zv", "center", "scale"),
  trControl = trainControl(method = "cv", number = 10),
  tuneLength = 10
)

vip(cv_glmnet, num_features = 20, geom = "point")




