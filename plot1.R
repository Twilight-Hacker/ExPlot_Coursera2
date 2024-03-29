fulldata<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
byyear<-aggregate(fulldata[,4],list(fulldata$year), FUN=sum)
png("plot1.png")
plot(byyear[,1],byyear[,2], type='b', main="Total Emissions by Year", xlab="Year", ylab="PM2.5 Emissions in tons", xaxt="n")
axis(1, at = seq(1999, 2008, by = 3))
dev.off()