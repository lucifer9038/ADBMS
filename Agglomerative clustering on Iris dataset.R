# Step 1: Load required libraries
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
if (!require(cluster)) install.packages("cluster", dependencies = TRUE)

# Load the libraries
library(ggplot2)
library(cluster)

# Step 2: Load the Iris dataset
data("iris")

# Step 3: Preprocessing the data
# Remove the Species column (categorical variable) for clustering
iris_data <- iris[, -5]

# Step 4: Compute the distance matrix
dist_matrix <- dist(iris_data)  # Compute Euclidean distance

# Step 5: Perform Agglomerative Clustering (Hierarchical Clustering)
agglo_clustering <- hclust(dist_matrix, method = "complete")  # Complete linkage

# Step 6: Plot the dendrogram
plot(agglo_clustering, main = "Agglomerative Clustering (Dendrogram)", 
     xlab = "Iris Samples", ylab = "Height")

# Step 7: Cut the dendrogram to form clusters
# Let's cut the dendrogram into 3 clusters (for the 3 species in the dataset)
clusters <- cutree(agglo_clustering, k = 3)

# Step 8: Add cluster assignments to the original dataset
iris$Cluster <- as.factor(clusters)

# Step 9: Visualize the clustering results using ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "Agglomerative Clustering of Iris Dataset", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()
