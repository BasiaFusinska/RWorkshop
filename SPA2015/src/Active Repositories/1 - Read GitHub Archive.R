library("rjson")

readEvents <- function(fileName, eventNames) {
  lines <- readLines(fileName)
  jsonEvents <- lapply(lines, fromJSON)
  
  filteredEvents <- Filter(function(e){ e$type %in% eventNames}, jsonEvents)
  
  return(filteredEvents)
}
