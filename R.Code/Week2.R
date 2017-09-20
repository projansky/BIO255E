# Week 2 

#install.packages('xlsx'), get access to read xlsx function
##library(xlsx)


setwd('/Users/dylanprojansky/Desktop/BIO255E/')

#ht= read.xlsx("data/Heating_trial_info.xlsx", sheetIndex = 1)
##This did not work for me because I could not load xlsx 

df = read.table("Data/SVLCallisaurus.csv", header = TRUE, sep = ",")
ht = read.table("Data/Heating_trial_info.csv", header = TRUE, sep = ",")


limp = read.table (file= 'Data/LimpetRaspingRate.txt', header = TRUE, 
            sep = "\t")
boxplot(limp$Growth)


test= readLines(con =  "Data/CDIP_158_201702.txt")

######## Plotting #####

dotchart(limp$Temperature)
dotchart(limp$Temperature, groups = limp$Species, 
         xlab = "Temperature, C")

limp$Species=="pelta"
limp$Temperature[limp$Species == "pelta"]

plot(x= limp$Temperature[limp$Species=="pelta"], 
     y= limp$RaspRate[limp$Species == "pelta"], 
     xlab = "Temperature, C", ylab= "Rasping Rate, per minute", 
     col= 4, pch= 2,
     xlim= range(limp$Temperature), ylim= range(limp$RaspRate))

points(x= limp$Temperature[limp$Species=="scabra"], 
       y= limp$RaspRate[limp$Species == "scabra"], 
        col = 3, pch= 19)
legend("topleft", legend = c("pelta", "scabra"),
       pch = c(2, 19), col = c(4, 3), title = 'Species')


