
# code to import data using a relative path to /data/

# subset out data for a particular job title 

# make a boxplot, with a proper y-axis label, 
# titled with job title you subset out 

# PRESIDENT
# Base Salery 


csu = read.csv("data/california-state-university-2015.csv", 
                 header = TRUE)
csu$Base.Pay[csu$Job.Title == "PRESIDENT"]
#List the base salries of all of the presidents

boxplot(csu$Base.Pay[csu$Job.Title == "PRESIDENT"], 
        main= "CSU Presidents' Base Salary", 
        ylab= "Base Salary in Dollars")

        