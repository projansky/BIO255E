## 09.06.17 

library(readxl)
df= read_excel(path= "data/Reinhart-Rogoff.xlsx", na= 'n.a.' )

mean(df$`90 or above`, na.rm = TRUE)

mean(df$`90 or above`[1:15], na.rm = TRUE) 

####################################################################

df= read.csv('data/Messy_means2.csv')

dotchart(df$Value)
# Dotchart shows one very large and one very small value that are 
# suspect. Let's remove those two values, turned to NA

df[which.min(df$Value, na.rm= TRUE), 'Value'] = NA 
# Set the minimum/maximum value in the dataset to NA
df[which.max(df$Value, na.rm= TRUE), 'Value'] = NA 

# This is safer to use because the data set could be altered 
# This ensures that the min or max will always be found 

dotchart(df$Value)
# New chart should show cluster of nice data points 

df$Value[df$Type == "Mean"]
df[df$Type == "Mean", "Value"]
## Effectively equivalent 
mymeans= df[df$Type == "Mean", "Value"]
mean(mymeans)

###################################################################

df= read_excel("data/Heating_trial_info.xlsx")
str(df)

# Some of these columns (3-8) should be factors 
df[, 3:8] = lapply(df[,3:8], factor)

# Use levels() to see all levels of a categorical factor 
levels(df$TCchannel)
levels(df$MusselTagID)
levels(df$`Gaping?`)

# Use summary() to show counts of factor columns 
summary(df)
summary(df$MusselTagID)
# summary() used on numeric columns shows quartiles 
summary(df$TrialNumber)

# Use table() to show counts of categorical variables in a column 

# Use xtabs() to make a contingency table of counts of factors 
xtabs( ~AliveDead + MusselTagID, data = df) 
# For 3 columns, you get a 3-dimensional table 
xtabs( ~AliveDead + MusselTagID + TCLocation, data=df) 

#####################################################################

# Read in one SVLCallisaurus file 
svl1= read.csv('data/SVLCallisaurus.csv')
str(svl1)
# Read in the other 
svl2= read.csv('data/SVLCallisaurus2.csv')
str(svl2)

# Both data frames, svl1 and svl2, share the same column titles and order

svlAll= rbind(svl1, svl2)

colnames(svl1)= c('Animal.ID', 'Sex', 'SVL.mm')
colnames(svl2)= c('Animal.ID', 'Sex', 'SVL.mm')

# Save the joined files as a new scv file 
write.csv(x= svlAll, file = "SVLjoined.csv", row.names= FALSE)

#####################################################################

boxplot(SVL.mm ~ Sex, data = svlAll, xlab= "Sex", 
        ylab= "Snout Vent Length, mm")
