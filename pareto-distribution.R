# Pareto distribution example
# By Joe Domaleski

# Define Pareto PDF
dpareto <- function(x, x_m, alpha) {
  # PDF: f(x) = alpha * x_m^alpha / x^(alpha+1), for x >= x_m
  ifelse(x >= x_m, alpha * x_m^alpha / x^(alpha+1), 0)
}

# Load necessary libraries
library(ggplot2)
library(scales)  # For better axis label formatting

# Set Pareto distribution parameters
x_m <- 100    # Minimum value (customer revenue threshold)
alpha <- 2.5  # Shape parameter controlling skewness

# Generate Pareto distribution data
x_values <- seq(100, 5000, by = 50)
y_values <- dpareto(x_values, x_m, alpha)
data <- data.frame(x = x_values, y = y_values)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_line(color = "blue", linewidth = 1.5) +
  # Add vertical lines to illustrate certain milestones
  geom_vline(xintercept = 500, linetype = "dotted", color = "black", linewidth = 1.2) +  # Example median or milestone
  geom_vline(xintercept = c(250, 1000), 
             linetype = "dashed", color = "darkorange", linewidth = 1.2) +  
  geom_vline(xintercept = c(125, 2000), 
             linetype = "dashed", color = "purple", linewidth = 1.2) +  
  scale_x_continuous(limits = c(100, 5000)) +
  scale_y_continuous(labels = comma_format()) +
  labs(title = "Pareto Distribution of Customer Revenue",
       x = "Customer Revenue ($)",
       y = "Probability Density") +
  theme_minimal(base_size = 14)