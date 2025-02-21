# Binomial distribution example
# By Joe Domaleski
# Load necessary library
library(ggplot2)

# Set parameters for the binomial distribution
n <- 10000  # Total trials (emails sent)
p <- 0.2    # Probability of success (email open rate)

# Generate binomial distribution data
x_values <- seq(1800, 2200, by = 1)
y_values <- dbinom(x_values, size = n, prob = p)
data <- data.frame(x = x_values, y = y_values)

# Calculate mean and standard deviation
mean_val <- n * p
sd_val <- sqrt(n * p * (1 - p))

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.3) +
  geom_vline(xintercept = mean_val, linetype = "dotted", color = "black", linewidth = 1.2) +
  geom_vline(xintercept = c(mean_val - sd_val, mean_val + sd_val), 
             linetype = "dashed", color = "darkorange", linewidth = 1.2) +
  geom_vline(xintercept = c(mean_val - 2 * sd_val, mean_val + 2 * sd_val), 
             linetype = "dashed", color = "purple", linewidth = 1.2) +
  scale_x_continuous(limits = c(1750, 2250)) +
  labs(title = "Binomial Distribution (n=10000, p=0.2)",
       x = "Number of Emails Opened",
       y = "Probability") +
  theme_minimal(base_size = 14)