# Log-Normal distribution example
# By Joe Domaleski

# Load necessary library
library(ggplot2)
library(scales)  # For better y-axis formatting

# Set log-normal distribution parameters
mu <- log(500)  # Mean in log-space (assuming typical CLV is around $500)
sigma <- 0.75  # Standard deviation in log-space (controls spread)

# Generate log-normal distribution data
x_values <- seq(50, 5000, by = 50)  # Range of possible customer spend values
y_values <- dlnorm(x_values, meanlog = mu, sdlog = sigma)  # Compute log-normal probabilities
data <- data.frame(x = x_values, y = y_values)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_line(color = "blue", linewidth = 2) +  # Increased line thickness
  geom_vline(xintercept = 500, linetype = "dotted", color = "black", linewidth = 1.2) +  # Median CLV
  geom_vline(xintercept = c(250, 1000), linetype = "dashed", color = "darkorange", linewidth = 1.2) +  # ±50% range
  geom_vline(xintercept = c(125, 2000), linetype = "dashed", color = "purple", linewidth = 1.2) +  # ±75% range
  scale_x_continuous(limits = c(0, 5000)) +
  scale_y_continuous(labels = comma_format()) +  # Format y-axis for better readability
  labs(title = "Log-Normal Distribution of Customer Lifetime Value (CLV)",
       x = "Customer Lifetime Value ($)",
       y = "Probability Density") +
  theme_minimal(base_size = 14)