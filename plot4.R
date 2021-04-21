library(ggplot2)
library(dplyr)

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

# Identify what codes indicate coal combustion, and pull relevant rows.
coalCombustion <- subset(scc$SCC, grepl('[Cc]omb.*Coal', scc$EI.Sector))
coalData <- subset(nei, nei$SCC %in% coalCombustion)
coalTotals <- with(coalData, tapply(Emissions, year, sum))

png(filename = 'Plot4.png')

barplot(coalTotals,
        main = 'Total PM2.5 Emissions from Coal Combustion by Year',
        xlab = 'Year',
        ylab = 'Total PM2.5 (tons)')

dev.off()