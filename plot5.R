#As above, after I determined that all EI.Sector values in SCC that contained "Vehicle" where what
# I needed, I used only that value to subset

fulldata<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
VSCC<-SCC[grepl("Vehicle",SCC[,4]),1]
data<-fulldata[grep("24510",fulldata[,1]),]
VData<-fulldata[data[,2] %in% VSCC,]
byyear<-aggregate(VData[,4],list(VData$year), FUN=sum)
png("plot5.png")
plot(byyear[,1],byyear[,2], type='b', main="Total Emissions from Motor Vehicles by Year in Baltimore City", xlab="Year", ylab="PM2.5 Emissions in tons", xaxt="n")
axis(1, at = seq(1999, 2008, by = 3))
dev.off()