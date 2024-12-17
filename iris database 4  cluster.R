# Step 1: Install and load necessary libraries
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

# Load the ggplot2 library for visualization
library(ggplot2)

# Step 2: Load the Iris dataset
data("iris")

# Step 3: Preprocess the data
# Remove the Species column (categorical variable) for clustering
iris_data <- iris[, -5]

# Step 4: Scale the data (important for K-Means)
iris_scaled <- scale(iris_data)  # Scaling ensures each feature contributes equally

# Step 5: Apply K-Means Clustering
set.seed(123)  # Set seed for reproducibility
kmeans_result <- kmeans(iris_scaled, centers = 4, nstart = 25)  # 4 clusters

# Step 6: Add cluster assignments to the original data
iris$Cluster <- as.factor(kmeans_result$cluster)

# Step 7: Visualize the clusters using ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering of Iris Dataset", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()

# Optional: View the cluster centers
print("Cluster Centers:")
print(kmeans_result$centers)

# Optional: Evaluate clustering result by comparing the clusters with actual species
table(iris$Cluster, iris$Species)  # Cross-tabulation of clusters and actual species
