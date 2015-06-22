readGoogleData <- function(){
  googleDataFile = "Data/Google data.csv"
  googleData <- read.csv(file=googleDataFile, sep=",",head=TRUE)
  
  googleData$url <- apply(googleData, 1, function(row){
    url = row[2]
    substr(url, nchar("https://github.com/")+1, nchar(url))
  })
  
  return(googleData)
}

readActiveRepositories <- function(fileName) {
  repositoriesEvents <- readEvents(fileName, list("PushEvent", "CreateEvent", "PullRequestEvent"))
  
  repositories <- lapply(repositoriesEvents, function(x) {
    url = x$repo$url
    c("id"=x$repo$id, "url"=substr(url, nchar("https://api.github.com/repos/")+1, nchar(url)))
  })
  
  repositories <- unique(repositories)
  
  return(data.frame(do.call(rbind, repositories)))
}

#read active repositories
fileName <- "Data/2015-01-01-15.json"
repositories <- readActiveRepositories(fileName)
head(repositories)

#read google data
googleData <- readGoogleData()
head(googleData)

# combine data
repositories$language <- apply(repositories, 1, function(row){
  language = googleData[as.character(googleData$url) == as.character(row[2]), ]$repository_language
  
  #because some googleData have many hits
  as.character(language[1])
})
head(repositories)

rm(readGoogleData)
rm(readActiveRepositories)
rm(googleData)
rm(fileName)
rm(readEvents)
