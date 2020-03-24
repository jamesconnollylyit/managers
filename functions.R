# Function needed to allow us to input a number, or set of numbers
# The function should calculate the percentage value for each number, 
# reduce  output to 1 decimal place, and display the “%” symbol as part of the answer
# Function should then allow us to store the answers in a variable



add_percent <- function(my_number)
{
  # Multiply the number by 100, and only show 1 digit
  
  percent <- round(my_number * 100, digits = 1)
  result <- paste(percent, "%", sep = "")
  
  # Return the calculation
  return(result)
}

# Test the function
sample_vector <- c(0.458, 1.663, 0.8654)
add_percent(sample_vector)

# Add another argument in the function which will be used as the formula multiplier
# And add another argument that will control the number of digits

add_percent <- function(my_number, multiplier = 100, no_digits = 1)
{
  # Multiply the number by 100, and only show 1 digit
  
  percent <- round(my_number * multiplier, digits = no_digits)
  result <- paste(percent, "%", sep = "")
  
  # Return the calculation
  return(result)
}

# Test out function
sample_vector <- c(0.458, 1.663, 0.8654)
my_result <- add_percent(sample_vector, 5)
my_result



my_stats <- function(values, parametric = TRUE, allow_display = TRUE) 
{
  if (parametric) 
  {
    central_tendency <- mean(values)
    spread <- sd(values)
  }
  else
  {
    central_tendency <- median(values)
    spread <- mad(values)
  }
  if (allow_display & parametric) 
  {
    # construct relevant output
    cat("Mean = ", central_tendency, "\n", "SD = ", spread, "\n" )
    result <- paste("Mean = ", central_tendency, "\n", "SD = ", spread, "\n")
  }
  else if (allow_display & !parametric)
  {
    cat("Median = ", central_tendency, "\n", "MAD = ", spread, "\n")
  }
  return(result)
}

sample_vector <- c(0.458, 1.663, 0.8654)

result <- my_stats(sample_vector, FALSE, TRUE)
result


