# Install and load required libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(ggplot2)

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
