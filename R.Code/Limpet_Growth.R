## HMS 2014 Limpet Growth 

# library(readxl)
# Used to import the excell file into r 
# setwd("~/Desktop/San Jose State University /Research/Limpet_Growth")

df= read_xlsx("HMS_2014_limpet_growth_master_20171018.xlsx")

# Combine the Tag color and Tag number for each month 
df$Tag.color = paste(df$Tag.color, df$Tag.number.Jun, sep= '')
df$Tag.color__1 = paste(df$Tag.color__1, df$Tag.number.Jul, sep= '')
df$Tag.color__2= paste(df$Tag.color__2, df$Tag.number.Aug, sep = '')
df$Tag.color__3= paste(df$Tag.color__3, df$Tag.number.Sep, sep= '')
df$Tag.color__4= paste(df$Tag.color__4, df$Tag.number.Oct, sep= '')
df$Tag.color__5= paste(df$Tag.color__5, df$Tag.number.Nov, sep= '')
df$Tag.color__6= paste(df$Tag.color__6, df$Tag.number.Dec, sep= '')
df$Tag.color__7= paste(df$Tag.color__7, df$Tag.number.Jan, sep = '')

limpet= subset(df, select = c(2:5, 9, 16:18, 21, 24, 34:36, 39, 42, 52:54, 
                              57, 60, 70:72, 75, 78, 88:90, 93, 96, 
                              106:108, 111, 114, 124:126, 129, 132)) 

# Rename the Tag headers from Tag.color to Tag.Month 
colnames(limpet)[4]= 'Tag.Jun'
colnames(limpet)[8]= 'Tag.Jul'
colnames(limpet)[13]= 'Tag.Aug'
colnames(limpet)[18]= 'Tag.Sep'
colnames(limpet)[23]= 'Tag.Oct'
colnames(limpet)[28]= 'Tag.Nov'
colnames(limpet)[33]= 'Tag.Dec'
colnames(limpet)[38]= 'Tag.Jan'

# Convert all of the Areas into numeric values capable of determining the difference 
# between them 
limpet$AreaJun.mm2= as.numeric(limpet$AreaJun.mm2)
limpet$AreaJul.mm2= as.numeric(limpet$AreaJul.mm2)
limpet$AreaAug.mm2= as.numeric(limpet$AreaAug.mm2)
limpet$AreaSep.mm2= as.numeric(limpet$AreaSep.mm2)
limpet$AreaOct.mm2= as.numeric(limpet$AreaOct.mm2)
limpet$AreaNov.mm2= as.numeric(limpet$AreaNov.mm2)
limpet$AreaDec.mm2= as.numeric(limpet$AreaDec.mm2)
limpet$AreaJan.mm2= as.numeric(limpet$AreaJan.mm2)


# Plot of plate 1, Jun to Jul (Random plot example)
diff=limpet$AreaJul.mm2[limpet$Plate == 1] - limpet$AreaJun.mm2[limpet$Plate == 1]
plot(x= limpet$Plate[limpet$Plate ==1], y= diff)
text(x= limpet$Plate[limpet$Plate ==1], y= diff, 
     labels=limpet$Tag.Jun[limpet$Plate==1],
     cex= 0.7, pos = 4)

# Plot of plate 3, Dec to Jan (Random plot example)
diff= limpet$AreaDec.mm2[limpet$Plate == 3] - limpet$AreaJan.mm2[limpet$Plate == 3]
plot(x= limpet$Plate[limpet$Plate ==3], y= diff)
text(x= limpet$Plate[limpet$Plate ==3], y= diff, 
     labels=limpet$Tag.Dec[limpet$Plate==3],
     cex= 0.7, pos = 4)


# Plot of Dec to Jan with all plates 
diff= limpet$AreaJan.mm2 - limpet$AreaDec.mm2
plot(x= limpet$Plate, y= diff)
text(x= limpet$Plate, y=diff, labels= limpet$Tag.Dec, cex=0.7, pos = 4)


#Trying to make a function to do it 
limpet.function= function(plate, month1, month2){
  
  temp= as.data.frame(limpet[limpet$Plate == plate,])
  
  startMonth= paste('Area', month1, '.mm2', sep= '' )
  
  endMonth= paste('Area', month2, '.mm2', sep = '')
  
  tagMonth= paste('Tag.', month1, sep = '')
  
  replacementMonth= paste('Replacement', month2, sep = '')
  
  temp$diff= temp[, endMonth] -  temp[, startMonth]
  
  as.character(temp[, replacementMonth])
  
  # temp[replacementMonth == TRUE, "diff"]= NA
  
  # Check for replacement 
  # if (temp[,replacementMonth == TRUE]){
  #   temp$diff = NA} 
  
  temp= temp[!is.na(temp$diff),]
  
  plot(x= temp$Plate, y= temp$diff, xlim = c(plate - 2, plate + 2) )
  text(x= temp$Plate, y=temp$diff, 
       labels = temp[, tagMonth],
       cex=0.7, pos = 4)
  abline(b= 0, h= 5, col= "red")
  abline(b=0, h= -5, col= "red")
                                  
}

diff= limpet$AreaJul.mm2[limpet$Plate == 3] - limpet$AreaJun.mm2[limpet$Plate == 3]
plot(x= limpet$Plate[limpet$Plate ==3], y= diff)
text(x= limpet$Plate[limpet$Plate ==3], y= diff, 
     labels=limpet$Tag.Jun[limpet$Plate==3],
     cex= 0.7, pos = 4)

