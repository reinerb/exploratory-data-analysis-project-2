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

# Get only rows for Baltimore
baltimore <- subset(nei, fips == '24510')

# Getting the total emissions for each year
emissionsByYear <- tapply(baltimore$Emissions, baltimore$year, sum)

# This is easily represented using a bar plot.
png(filename = 'Plot2.png')

barplot(emissionsByYear,
        main = 'Total Emissions in Baltimore By Year',
        xlab = 'Year',
        ylab = 'Total PM2.5 (tons)')

dev.off()