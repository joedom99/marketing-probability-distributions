# Exponential distribution example
# By Joe Domaleski

# Load necessary library
library(ggplot2)

# Set exponential distribution parameter (mean time between purchases)
lambda <- 0.1  # Rate parameter (1 / average time between purchases)
x_values <- seq(0, 50, by = 0.25)  # Time range (0 to 50 days)
y_values <- dexp(x_values, rate = lambda)  # Compute exponential probabilities
data <- data.frame(x = x_values, y = y_values)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_line(color = "blue", linewidth = 1.5) +
  geom_vline(xintercept = 10, linetype = "dotted", color = "black", linewidth = 1.2) +  # Mean time
  geom_vline(xintercept = c(5, 15), linetype = "dashed", color = "darkorange", linewidth = 1.2) +  # ±50% time range
  geom_vline(xintercept = c(2.5, 25), linetype = "dashed", color = "purple", linewidth = 1.2) +  # ±75% time range
  scale_x_continuous(limits = c(0, 50)) +
  labs(title = "Exponential Distribution of Time Between Purchases",
       x = "Days Until Next Purchase",
       y = "Probability Density") +
  theme_minimal(base_size = 14) +
  annotate("text", x = 10, y = 0.075, label = "Mean (10 days)", vjust = -1, fontface = "bold")