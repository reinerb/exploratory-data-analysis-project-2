library(ggplot2)
library(RcolorBrewer)

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

groupedData <- aggregate(Emissions ~ type + year, data = nei, FUN = sum)

neiPlot <- ggplot(groupedData) +
    geom_bar(aes(year, Emissions, fill = type), stat = 'Identity') +
    facet_grid(. ~ type) +
    labs(title = 'Total Emissions By Source',
         x = 'Year',
         y = 'Total PM2.5 (tons)')

ggsave('Plot3.png', plot = neiPlot)