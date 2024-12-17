# Install and load necessary libraries
if (!require(caTools)) install.packages("caTools", dependencies = TRUE)
if (!require(e1071)) install.packages("e1071", dependencies = TRUE)
if (!require(caret)) install.packages("caret", dependencies = TRUE)

# Load the libraries
library(caTools)
library(e1071)
library(caret)

# Step 1: Load Titanic dataset
data("Titanic")

# Step 2: Convert Titanic dataset to data frame
dfdata <- as.data.frame(Titanic)

# Step 3: Check structure and data preview
str(dfdata)
head(dfdata)
names(dfdata)
dim(dfdata)

# Step 4: Preprocessing
# Convert the Survived column into a factor
dfdata$Survived <- factor(dfdata$Survived, levels = c("No", "Yes"))

# Step 5: Split the data into training and test sets (80% training, 20% test)
set.seed(123)
t_split <- sample.split(dfdata$Survived, SplitRatio = 0.8)

training_set1 <- subset(dfdata, t_split == TRUE)
test_set1 <- subset(dfdata, t_split == FALSE)

# Step 6: Train the Naive Bayes classifier
titanic_classifier <- naiveBayes(Survived ~ ., data = training_set1)

# View the model
print(titanic_classifier)

# Step 7: Predict using the Naive Bayes model on the test set
titanic_test_pred <- predict(titanic_classifier, test_set1)

# Step 8: Display the predicted values
print(titanic_test_pred)

# Step 9: Confusion Matrix to evaluate the performance of the model
conf_matrix <- confusionMatrix(titanic_test_pred, test_set1$Survived)
print(conf_matrix)

# Step 10: Print detailed performance metrics
print(paste("Accuracy: ", conf_matrix$overall['Accuracy']))
print(paste("Sensitivity: ", conf_matrix$byClass['Sensitivity']))
print(paste("Specificity: ", conf_matrix$byClass['Specificity']))
