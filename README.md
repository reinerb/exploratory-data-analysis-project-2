# Exploratory Data Analysis Project 2

## Assignment
(From the Coursera course Exploratory Data Analysis)

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

### Questions
You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Methods & Other Comments
Since this is not continuous data, bar plots are appropriate for each of these questions. We can't make inferences about the data from unlisted years. Using a continuous plot (line, scatter, etc.) would be deceptive.

For question 4, the assumption is made that anything with an EI.Sector containing "Comb" and "Coal" (note: not "Charcoal", which is not coal) is sufficient to define "coal combustion."

For questions 5 and 6, the assumption is made that anything with type ON-ROAD is a motor vehicle. An argument could be made to include airplanes or ships, but "motor vehicle" is generally meant to indicate a road vehicle.

For question 6, there was initially some worry about normalizing the graphs, as Los Angeles has far more emissions data than Baltimore. However, upon initial plotting, it became apparent that Los Angeles' motor vehicle emissions actually *increased* over the time frame, while Baltimore's decreased, and, as such, normalization was not needed.
