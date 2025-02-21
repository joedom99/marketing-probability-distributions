# Negative binomial distribution example
# By Joe Domaleski

# Load necessary library
library(ggplot2)

# Set negative binomial distribution parameters
r <- 5     # Number of required conversions (successes)
p <- 0.3   # Probability of conversion per interaction

# Generate negative binomial distribution data
x_values <- seq(0, 30, by = 1)  # Number of interactions before conversion
y_values <- dnbinom(x_values, size = r, prob = p)  # Compute probabilities
data <- data.frame(x = x_values, y = y_values)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.3) +
  geom_vline(xintercept = mean(r / p), linetype = "dotted", color = "black", linewidth = 1.2) +  # Mean interactions
  geom_vline(xintercept = c(qnbinom(0.25, r, p), qnbinom(0.75, r, p)), 
             linetype = "dashed", color = "darkorange", linewidth = 1.2) +  # Interquartile range (25%–75%)
  geom_vline(xintercept = c(qnbinom(0.1, r, p), qnbinom(0.9, r, p)), 
             linetype = "dashed", color = "purple", linewidth = 1.2) +  # 10%-90% range
  scale_x_continuous(limits = c(0, 30)) +
  labs(title = "Negative Binomial Distribution of Customer Engagement",
       x = "Number of Interactions Before Conversion",
       y = "Probability") +
  theme_minimal(base_size = 14)