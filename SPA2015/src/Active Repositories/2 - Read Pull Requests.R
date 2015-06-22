
readPullRequests <- function(fileName) {
  pullRequestEvents <- readEvents(fileName, list("PullRequestEvent"))
  
  pullRequests <- lapply(pullRequestEvents, function(x) {
    c(id=x$payload$pull_request$base$repo$id, 
      language=x$payload$pull_request$base$repo$language)
  })

  #some repositories have the same occurence
  notUniqueResults = data.frame(do.call(rbind, pullRequests))
  print(head(notUniqueResults))
  print(summary((notUniqueResults)))
  
  #for the same repository we want only one occurence
  pullRequests <- unique(pullRequests)
  
  return(data.frame(do.call(rbind, pullRequests)))
}

fileName <- "Data/2015-01-01-15.json"
pullRequests <- readPullRequests(fileName)
head(pullRequests)
summary(pullRequests)

rm(fileName)
rm(readPullRequests)
