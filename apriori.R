# Step 1: Load the required library
if(!require(arules)) install.packages("arules", dependencies=TRUE)
library(arules)

# Step 2: Load the Groceries dataset
data("Groceries")  # The Groceries dataset is part of the arules package
summary(Groceries)  # View a summary of the dataset

# Step 3: Apply the Apriori algorithm
rules <- apriori(
  Groceries,
  parameter = list(supp = 0.7, conf = 0.8)  # 70% Support and 80% Confidence
)

# Step 4: Inspect the rules
inspect(rules)  # Display the generated rules

rules <- apriori(Groceries, parameter = list(supp = 0.1, conf = 0.8))
inspect(rules)
