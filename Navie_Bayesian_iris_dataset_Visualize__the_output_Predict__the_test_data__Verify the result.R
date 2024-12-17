# Install and load required libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("e1071", quietly = TRUE)) install.packages("e1071")

library(ggplot2)
library(e1071)

# Prepare height and weight vectors
height <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
weight <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Step 1: Create a data frame
height_weight_data <- data.frame(height, weight)

# Step 2: Perform Linear Regression
linear_model <- lm(weight ~ height, data = height_weight_data)

# Display the summary of the model
print(summary(linear_model))

# Step 3: Visualize the Linear Regression
# Scatter plot of height vs weight with regression line
ggplot(height_weight_data, aes(x = height, y = weight)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Linear Regression: Weight vs Height", x = "Height", y = "Weight") +
  theme_minimal()

# Step 4: Analysis of the regression
# Calculate and display residuals
residuals <- resid(linear_model)
height_weight_data$residuals <- residuals

# Plot residuals to analyze the fit
plot(height_weight_data$height, residuals, 
     main = "Residual Plot", xlab = "Height", ylab = "Residuals", 
     col = "blue", pch = 19)
abline(h = 0, col = "red", lwd = 2)

# Display the data with residuals
print(height_weight_data)

# Step 5: Naive Bayes Classification using iris dataset
# Load iris dataset
data(iris)

# Split the dataset into training and testing sets
set.seed(123)
train_indices <- sample(1:nrow(iris), size = 0.7 * nrow(iris))
train_set <- iris[train_indices, ]
test_set <- iris[-train_indices, ]

# Train Naive Bayes model
nb_model <- naiveBayes(Species ~ ., data = train_set)

# Predict the test set
test_set$Predicted <- predict(nb_model, test_set)

# Visualize the output
library(ggplot2)
ggplot(test_set, aes(x = Petal.Length, y = Petal.Width, color = Predicted)) +
  geom_point(size = 3) +
  labs(title = "Naive Bayes Classification: Iris Dataset", x = "Petal Length", y = "Petal Width") +
  theme_minimal()

# Verify the result
confusion_matrix <- table(test_set$Predicted, test_set$Species)
print(confusion_matrix)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Accuracy:", accuracy, "\n")
