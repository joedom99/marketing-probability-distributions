# Generate a plot of random variables for a normal distribution
# By Joe Domaleski
# Load necessary library
library(ggplot2)

# Set parameters for normal distribution
mu <- 0  # Mean
sigma <- 1  # Standard deviation
n <- 10000  # Number of data points

# Generate random data following a normal distribution
set.seed(123)  # For reproducibility
data <- data.frame(x = rnorm(n, mean = mu, sd = sigma))

# Create the plot
ggplot(data, aes(x = x)) +
  geom_density(fill = "blue", alpha = 0.2) +  # Adjusted transparency for density curve
  stat_function(fun = dnorm, args = list(mean = mu, sd = sigma), 
                color = "red", linetype = "dashed", linewidth = 1) +  # Normal curve overlay
  geom_vline(xintercept = mu, linetype = "dotted", color = "black", linewidth = 1.2) +  # Mean line
  geom_vline(xintercept = c(mu - sigma, mu + sigma), linetype = "dashed", color = "darkorange", linewidth = 1.2) +  # ±1 SD lines
  geom_vline(xintercept = c(mu - 2*sigma, mu + 2*sigma), linetype = "dashed", color = "purple", linewidth = 1.2) +  # ±2 SD lines
  labs(title = "Normal Distribution (μ=0, σ=1)",
       x = "Value",
       y = "Density") +
  theme_minimal(base_size = 14)