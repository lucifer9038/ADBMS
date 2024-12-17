# Step 1: Install and load required libraries
if (!require(arules)) install.packages("arules", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

# Load the libraries
library(arules)
library(ggplot2)

# Step 2: Load the iris dataset
data("iris")

# Step 3: Preprocess the data
# Remove the Species column (categorical variable) for clustering
iris_data <- iris[, -5]

# Scale the data to normalize feature values
iris_scaled <- scale(iris_data)

# Step 4: Apply K-Means Clustering
set.seed(42)  # Set seed for reproducibility
kmeans_result <- kmeans(iris_scaled, centers = 3, nstart = 25)  # 3 clusters

# Step 5: Add cluster assignments to the original data
iris$Cluster <- as.factor(kmeans_result$cluster)

# Step 6: Plot the clusters
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering of Iris Dataset", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()

# Optional: View cluster centers
print("Cluster Centers:")
print(kmeans_result$centers)

# Optional: Evaluate clustering result
table(iris$Cluster, iris$Species)  # Compare clusters with actual species
