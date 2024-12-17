# Step 1: Load the required library
if(!require(arules)) install.packages("arules", dependencies=TRUE)
library(arules)

# Step 2: Prepare the dataset
# Create a list of transactions
transactions <- list(
  c("milk", "egg", "bread", "chip"),
  c("egg", "popcorn", "chip", "beer"),
  c("egg", "bread", "chip"),
  c("milk", "egg", "bread", "popcorn", "chip", "beer"),
  c("milk", "bread", "beer"),
  c("egg", "bread", "beer"),
  c("milk", "bread", "chip"),
  c("milk", "egg", "bread", "butter", "chip"),
  c("milk", "egg", "butter", "chip")
)

# Convert the list to a transactions object
trans <- as(transactions, "transactions")

# Step 3: Generate association rules with 30% support and 80% confidence
rules <- apriori(trans, parameter = list(supp = 0.3, conf = 0.8))

# Step 4: View the rules
inspect(rules)
