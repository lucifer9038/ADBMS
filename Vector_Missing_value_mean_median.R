# Create the vector
vec <- c(22, NA, 45, 30, NA, 50, 20)

# Display second element of vector
second_element <- vec[2]
cat("Second element of vector:", second_element, "\n")

# Check how many NA elements are in the vector, and calculate how many non-NA elements
na_count <- sum(is.na(vec))  # Count NA elements
non_na_count <- sum(!is.na(vec))  # Count non-NA elements
cat("Number of NA elements:", na_count, "\n")
cat("Number of non-NA elements:", non_na_count, "\n")

# Calculate mean and median of the vector
mean_value <- mean(vec, na.rm = TRUE)  # Calculate mean excluding NAs
median_value <- median(vec, na.rm = TRUE)  # Calculate median excluding NAs
cat("Mean:", mean_value, "\n")
cat("Median:", median_value, "\n")

# Replace missing values (NA) with mean and median

# Assuming age column has the same structure
age <- c(22, NA, 45, 30, NA, 50, 20)

# Replace NA with mean
age_with_mean <- age
age_with_mean[is.na(age_with_mean)] <- mean(age_with_mean, na.rm = TRUE)
cat("Age column with NAs replaced by mean:", age_with_mean, "\n")

# Replace NA with median
age_with_median <- age
age_with_median[is.na(age_with_median)] <- median(age_with_median, na.rm = TRUE)
cat("Age column with NAs replaced by median:", age_with_median, "\n")
