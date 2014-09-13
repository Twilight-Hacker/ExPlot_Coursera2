fulldata<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data<-fulldata[grep("24510",fulldata[,1]),]
byyear<-aggregate(data[,4],list(data$year), FUN=sum)
png("plot2.png")
plot(byyear[,1],byyear[,2], type='b', main="Total Emissions by Year in Baltimore City, Maryland", xlab="Year", ylab="PM2.5 Emissions in tons", xaxt="n")
axis(1, at = seq(1999, 2008, by = 3))
dev.off()