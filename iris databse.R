# Install and load required libraries
if (!requireNamespace("cluster", quietly = TRUE)) install.packages("cluster")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(cluster)
library(ggplot2)

# Load the iris dataset
data(iris)

# Step 1: Preprocess the data (remove non-numeric columns)
# We'll use only the numeric columns for clustering.
iris_data <- iris[, 1:4]

# Step 2: Perform K-means clustering
set.seed(123) # For reproducibility
kmeans_result <- kmeans(iris_data, centers = 3, nstart = 20)

# Add the cluster results to the original dataset
iris$Cluster <- as.factor(kmeans_result$cluster)

# Step 3: Visualize the clusters using ggplot2
# We'll plot Sepal.Length vs Sepal.Width and color by clusters
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-means Clustering on Iris Dataset", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()

# Step 4: Analyze clustering results
# Compare clusters with actual species
table(iris$Cluster, iris$Species)

# Step 5: Predict clusters for a test set
# Create a testing set (using 20% of the data)
set.seed(123)
test_indices <- sample(1:nrow(iris_data), size = 0.2 * nrow(iris_data))
test_set <- iris_data[test_indices, ]

# Use the k-means centers to predict the cluster for the testing set
predict_cluster <- function(data, centers) {
  apply(data, 1, function(row) {
    which.min(apply(centers, 1, function(center) sum((row - center)^2)))
  })
}

test_set_clusters <- predict_cluster(test_set, kmeans_result$centers)

# Add predicted clusters to test set and display
predicted_test_data <- data.frame(test_set, Predicted_Cluster = test_set_clusters)
print(predicted_test_data)
