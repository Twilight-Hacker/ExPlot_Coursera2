#As above, after I determined that all EI.Sector values in SCC that contained "Vehicle" where what
# I needed, I used only that value to subset

fulldata<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
VSCC<-SCC[grepl("Vehicle",SCC[,4]),1]
data<-fulldata[grep("24510",fulldata[,1]),]
data2<-fulldata[grep("06037",fulldata[,1]),]
VData<-fulldata[data[,2] %in% VSCC,]
VData2<-fulldata[data2[,2] %in% VSCC,]
byyear<-aggregate(VData[,4],list(VData$year), FUN=sum)
byyear2<-aggregate(VData2[,4],list(VData2$year), FUN=sum)
png("plot6.png")
plot(byyear[,1],byyear[,2], type='b', col="red", main="Comparison of Vehicle Emissions by Year in Baltimore and LA", xlab="Year", ylab="PM2.5 Emissions in tons", xaxt="n", ylim=c(200000,4000000))
axis(1, at = seq(1999, 2008, by = 3))
lines(byyear2[,1],byyear2[,2], type ='b', col="green")
legend('topright', c("Baltimore City","Los Angeles") , lty=1, col=c('red','green', cex=.75))
dev.off()