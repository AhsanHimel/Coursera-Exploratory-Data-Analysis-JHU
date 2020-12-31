# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# loading package
if(!require(ggplot2)) library(ggplot2)

# loading data
if(!exists("NEI")) NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("./Project 2/Source_Classification_Code.rds")


vehicle.SCC <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = T), "SCC"]
vehicle.NEI <- NEI[NEI$SCC %in% vehicle.SCC & NEI$fips %in% c("06037", "24510"),]
vehicle.NEI$city <- ifelse(vehicle.NEI$fips == "06037", "California", "Baltimore")

agg <- aggregate(Emissions~year+city, data = vehicle.NEI, FUN = sum)

# Making plot
png("Project 2/plot6.png", width=480, height=480)
ggplot(data = agg, aes(y = Emissions, x=as.factor(year), fill = city)) + 
    geom_bar(stat="identity", position = "dodge") +
    labs(title = 'Total Emissions from motor vehicle', 
         subtitle = "In Baltimore and Los Angeles (1999-2008) By Motor Vehicles",
         y = expression('PM'[2.5]*' Emissions (Tons)'),
         x = "Year")
dev.off()
