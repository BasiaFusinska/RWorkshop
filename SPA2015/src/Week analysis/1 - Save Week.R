countEvents <- function(stream, eventNames) {
  eventCount = 0
  
  while(length(line <- readLines(stream, n = 1, warn = FALSE)) > 0) {
    json <- fromJSON(line)
    
    if (json$type %in% eventNames) {
      eventCount <- eventCount + 1
    }
  }
  return(eventCount)  
}

readPushesLineByLine <- function(fileName) {
  stream <- file(fileName, open="r")
  pushes = countEvents(stream, list("PushEvent"))
  close(stream)
  return(pushes)
}

dataFolder = "Data/Week"
mondayFile = paste(dataFolder, "/Monday-10.json", sep="")
wednesdayFile = paste(dataFolder, "/Wednesday-10.json", sep="")
fridayFile = paste(dataFolder, "/Friday-10.json", sep="")  

mondayPushes = readPushesLineByLine(mondayFile)
wednesdayPushes = readPushesLineByLine(wednesdayFile)
fridayPushes = readPushesLineByLine(fridayFile)

week = data.frame(hours = c(1, 10))
week$Moday = c(0, mondayPushes)
week$Wednesday = c(0, wednesdayPushes)
week$Friday = c(0, fridayPushes)
week

write.csv(week, file="Data/week.csv")

rm(countEvents)
rm(readPushesLineByLine)
rm(dataFolder)
rm(mondayFile)
rm(wednesdayFile)
rm(fridayFile)
rm(mondayPushes)
rm(wednesdayPushes)
rm(fridayPushes)
rm(week)