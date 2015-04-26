library(plyr)
library(ggplot2)
library(data.table)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Convert into data.table
NEI.DT = data.table(NEI)
SCC.DT = data.table(SCC)
total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))
png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot(total.emissions, type = "b", pch = 18, col = "green", ylab = "Emissions", 
     xlab = "Year", main = "Annual Emissions")
dev.off()