### Homework Week 3, California Salary Data 

csu= read.csv('data/california-state-university-2015.csv', header = TRUE)

levels(csu$Job.Title)

# REPROGRAPHICS SPECIALIST I
# REPROGRAPHICS SPECIALIST II
# REPROGRAPHICS SPECIALIST III
# REPROGRAPHICS SPECIALIST IV

rs1= subset(csu, Job.Title == "REPROGRAPHICS SPECIALIST I")
rs2= subset(csu, Job.Title == "REPROGRAPHICS SPECIALIST II")
rs3= subset(csu, Job.Title == "REPROGRAPHICS SPECIALIST III")
rs4= subset(csu, Job.Title == "REPROGRAPHICS SPECIALIST IV")

rs3[which.min(rs3$Base.Pay), 'Base.Pay'] = NA
# This value was removed bc Alfred R. Partida had a base pay of $0.00

csusub= rbind(rs1, rs2, rs3, rs4)
csusub= droplevels(csusub)

boxplot(Base.Pay ~ Job.Title, data = csusub, 
        names= c("RS I", "RS II", "RS III", "RS IV"), 
        xlab= "Reprographics Specialist Level", 
        ylab= "Base Pay, $", 
        col= "peachpuff")

print(aggregate(Base.Pay ~ Job.Title, data= csusub, FUN= mean))