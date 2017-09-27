mySE= function(x) { 
  # Assume the input x is a vector of numbers 
  # First calculate the variance 
  myvar= var(x)
  # Then calculate the number of values in the sample 
  myn= length(x)
  # Next calculate the square root of the variance, 
  # divide by the sample size
  mySE= sqrt(myvar/myn)
  # The value returned will be the last object created in the funciton, 
  # in this case my SE
  mySE 
  # Repeating just the last variable here will cause the result to print out when run
} 