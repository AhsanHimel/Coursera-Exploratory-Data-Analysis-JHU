# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# loading package
if(!require(ggplot2)) library(ggplot2)

# loading data
if(!exists("NEI")) NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("./Project 2/Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
balti.agg.emission <- aggregate(Emissions ~ year + type, data = baltimore,FUN = sum)

# Making plot
png("Project 2/plot3.png", width=480, height=480)
ggplot(data = balti.agg.emission, 
       aes(x = year, y = Emissions, color = type)) + 
    # geom_bar(stat = "identity") +
    # facet_wrap( ~ type) +
    geom_line() +
    labs(title = expression("Total PM"[2.5]*" Emissions in Baltimore City, Maryland"),
         subtitle = "By Source Type",
         x = "Year", 
         y = expression("PM"[2.5]*" Emissions (Tons)"))
dev.off()
