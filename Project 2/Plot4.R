# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# loading package
if(!require(ggplot2)) library(ggplot2)

# loading data
if(!exists("NEI")) NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("./Project 2/Source_Classification_Code.rds")

coal.SCC <- SCC[grepl("coal", SCC$EI.Sector, ignore.case = T), "SCC"]
coal.NEI <- NEI[which(NEI$SCC %in% coal.SCC),]

col.agg <- aggregate(Emissions~year, data = coal.NEI, FUN = sum)

# Making plot
png("Project 2/plot4.png", width=480, height=480)
ggplot(col.agg, aes(x = as.factor(year), y = Emissions/10^3,  
                    label = round(Emissions /10^3, 2))) +
    geom_bar(stat="identity", width = 0.5) + 
    geom_label(colour = "black") +
    labs(title = "Coal Combustion Emissions", subtitle = "Year 1999 to 2008",
         y = expression('PM'[2.5]*' Emissions (Kilotons)'),
         x = "Year") +
    theme_light()
dev.off()
