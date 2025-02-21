# Beta distribution example
# By Joe Domaleski

# Load necessary libraries
library(ggplot2)

# Adjust beta distribution parameters to better match Poisson-like spread
alpha <- 25   # Number of observed successes (e.g., conversions)
beta <- 75    # Number of observed failures (e.g., non-conversions)

# Generate beta distribution data
x_values <- seq(0, 1, by = 0.0005)  # Higher resolution for smoothness
y_values <- dbeta(x_values, shape1 = alpha, shape2 = beta)  # Compute beta probabilities
data <- data.frame(x = x_values, y = y_values)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_area(fill = "blue", alpha = 0.3) +  # Mimic Poisson-like density with a filled area
  geom_line(color = "blue", linewidth = 1.5) +  # Smooth beta curve
  geom_vline(xintercept = (alpha - 1) / (alpha + beta - 2), 
             linetype = "dotted", color = "black", linewidth = 1.2) +  # Mean conversion rate
  geom_vline(xintercept = qbeta(c(0.25, 0.75), alpha, beta), 
             linetype = "dashed", color = "darkorange", linewidth = 1.2) +  # 50% credible interval
  geom_vline(xintercept = qbeta(c(0.1, 0.9), alpha, beta), 
             linetype = "dashed", color = "purple", linewidth = 1.2) +  # 80% credible interval
  scale_x_continuous(limits = c(0, 1)) +  # Keep probability scale from 0 to 1
  labs(title = "Beta Distribution for A/B Test Conversion Rate",
       x = "Conversion Rate",
       y = "Probability Density") +
  theme_minimal(base_size = 14)