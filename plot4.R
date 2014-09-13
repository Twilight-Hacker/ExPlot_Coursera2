#After determining that all EI.Sector values in SCC that contained "Coal" related to Combustion, 
# I used only that value to subset

fulldata<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
CoalSCC<-SCC[grepl("Coal",SCC[,4]),1]
CoalData<-fulldata[fulldata[,2] %in% CoalSCC,]
byyear<-aggregate(CoalData[,4],list(CoalData$year), FUN=sum)
png("plot4.png")
plot(byyear[,1],byyear[,2], type='b', main="Total Emissions from Coal Combustion by Year", xlab="Year", ylab="PM2.5 Emissions in tons", xaxt="n")
axis(1, at = seq(1999, 2008, by = 3))
dev.off()