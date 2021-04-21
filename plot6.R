library(ggplot2)

# Download and extract files, if needed.
if(!file.exists('pmdata.zip')){
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip', 
                  'pmdata.zip')
}

if(!file.exists('Source_Classification_Code.rds') | 
   !file.exists('summarySCC_PM25.rds')) {
    unzip('pmdata.zip')
}

# Read in the datasets.
# summarySCC_PM25.rds is enormous, so reading it in may take a while.
nei <- readRDS('summarySCC_PM25.rds')
scc <- readRDS('Source_Classification_Code.rds')

# Subset for ON-ROAD emissions
vehicles <- subset(nei, type == 'ON-ROAD')

# Get only rows for Baltimore & LA
baltimore <- subset(vehicles, fips == '24510')
baltimoreTotals <- with(baltimore, tapply(Emissions, year, sum))
losangeles <- subset(vehicles, fips == '06037')
laTotals <- with(losangeles, tapply(Emissions, year, sum))

png(filename = 'plot6.png')

par(mfrow=c(1,2))

barplot(baltimoreTotals,
        main = 'Baltimore Vehicle Emissions',
        xlab = 'Year',
        ylab = 'Total PM2.5 (tons)')
barplot(laTotals,
        main = 'Los Angeles Vehicle Emissions',
        xlab = 'Year',
        ylab = 'Total PM2.5 (tons)')

dev.off()