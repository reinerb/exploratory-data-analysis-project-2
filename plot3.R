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

# Get only rows for Baltimore
baltimore <- subset(nei, fips == '24510')

groupedData <- aggregate(Emissions ~ type + year, data = baltimore, FUN = sum)

neiPlot <- ggplot(groupedData) +
    geom_bar(aes(factor(year), Emissions, fill = type), stat = 'Identity') +
    facet_grid(. ~ type) +
    labs(title = 'Total Emissions By Source in Baltimore',
         x = 'Year',
         y = 'Total PM2.5 (tons)') +
    theme(legend.position = 'bottom')

ggsave('Plot3.png', plot = neiPlot)