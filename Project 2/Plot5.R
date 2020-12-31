# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# loading package
if(!require(ggplot2)) library(ggplot2)

# loading data
if(!exists("NEI")) NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("./Project 2/Source_Classification_Code.rds")

vehicle.SCC <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = T), "SCC"]
vehicle.NEI <- NEI[NEI$SCC %in% vehicle.SCC,]
baltimore.vehicle <- subset(vehicle.NEI, fips=="24510")

agg.balti.vehi <- aggregate(Emissions~year, data = baltimore.vehicle, FUN = sum)

# Making plot
png("Project 2/plot5.png", width=480, height=480)
ggplot(data = agg.balti.vehi, aes(y = Emissions, x=as.factor(year))) + 
    geom_bar(stat="identity") +
    geom_label(aes(label = round(Emissions,2)), colour = "black") +
    labs(title = "Coal Combustion Emissions in Baltimore City", 
         subtitle = "By Motor Vehicles",
         y = expression('PM'[2.5]*' Emissions (Tons)'),
         x = "Year")
dev.off()
