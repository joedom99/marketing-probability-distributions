# Poisson distribution example
# By Joe Domaleski

# Load necessary library
library(ggplot2)

# Set Poisson distribution parameter (average visits per hour)
lambda <- 50  # Average website visits per hour

# Generate Poisson distribution data
x_min <- max(0, lambda - 3 * sqrt(lambda))  # Ensure x_min is not negative
x_max <- lambda + 3 * sqrt(lambda)  # Set upper range dynamically
x_values <- seq(floor(x_min), ceiling(x_max), by = 1)  # Ensure valid integer range

# Compute Poisson probabilities and filter out near-zero probabilities
y_values <- dpois(x_values, lambda = lambda)
data <- data.frame(x = x_values, y = y_values)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.3) +
  geom_vline(xintercept = lambda, linetype = "dotted", color = "black", linewidth = 1.2) +  # Mean line
  geom_vline(xintercept = c(lambda - sqrt(lambda), lambda + sqrt(lambda)), 
             linetype = "dashed", color = "darkorange", linewidth = 1.2) +  # ±1 SD lines
  geom_vline(xintercept = c(lambda - 2 * sqrt(lambda), lambda + 2 * sqrt(lambda)), 
             linetype = "dashed", color = "purple", linewidth = 1.2) +  # ±2 SD lines
  scale_x_continuous(limits = c(floor(x_min), ceiling(x_max))) +  
  labs(title = "Poisson Distribution of Website Traffic (λ = 50)",
       x = "Number of Website Visits per Hour",
       y = "Probability") +
  theme_minimal(base_size = 14)