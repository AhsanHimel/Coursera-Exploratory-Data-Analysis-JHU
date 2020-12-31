# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Loading data
if(!exists("NEI")) NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("./Project 2/Source_Classification_Code.rds")

tot.emission <- aggregate(formula = Emissions ~ year, data = NEI, FUN = sum)

# Making plot
png("Project 2/plot1.png", width=480, height=480)
par(mai = c(1,1,0.6,0.2))
barplot(height = (tot.emission$Emissions)/10^6,
        names.arg = tot.emission$year, las = 1, 
        col = c("#023047","#219ebc","#8ecae6","#bde0fe"),
        xlab = "Year",
        ylab = expression(paste('Total PM '[2.5], ' emissions (', 10 ^ 6, ' Tons)')),
        ylim = c(0, 8),
        main = expression("Total PM"[2.5]*" Emissions in US"))
box(lwd = 1)
dev.off()
