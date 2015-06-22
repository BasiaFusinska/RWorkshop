readWeekData <- function() {
  weekDataFile <- "Data/weekData.csv"
  
  weekData <- read.csv(file=weekDataFile, sep=",",head=TRUE)
  
  print(head(weekData))
  #delete X column
  weekData$X = NULL
  
  #because h column is treated as int
  weekData$h <- factor(weekData$hours)
  return(weekData)
}

weekData <- readWeekData()
head(weekData)

#categorize parts of the day
weekData$daypart <-cut(weekData$hours,c(-Inf,2,7,10,13,18,20,23))
head(weekData)

library("doBy")

#sumrization by daypart
siterange <- function(x){c(length(x), min(x), mean(x), max(x))}
summaryBy(Monday~daypart, data =weekData, FUN=siterange)
summaryBy(Monday+Wednesday+Friday~daypart, data =weekData)


rm(readWeekData)
rm(siterange)
