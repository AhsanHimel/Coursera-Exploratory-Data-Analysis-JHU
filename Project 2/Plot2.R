# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Loading data
if(!exists("NEI")) NEI <- readRDS("./Project 2/summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("./Project 2/Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
tot.emission.balti <- aggregate(Emissions ~ year, baltimore, sum)

# Making plot
png("Project 2/plot2.png", width = 500, height = 480)
par(mai = c(1,1,0.6,0.2))
barplot(tot.emission.balti$Emissions/10^3,
        names.arg = tot.emission.balti$year, las = 1,
        xlab = "Year",
        ylab = expression(paste('Total PM '[2.5],' emissions (',10^3,' Tons)')),
        ylim = c(0, 4),
        main = expression("Total PM"[2.5]*" Emissions in Baltimore City, Maryland"))
dev.off()
