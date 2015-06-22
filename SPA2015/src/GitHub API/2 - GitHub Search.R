# using GitHub search to search for repositories created on 2015-01-01

createdRepositories <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01")
repositoriesContent = content(createdRepositories)
repositoriesContent
length(repositoriesContent$items)

repositoriesContent$items[[10]]$language
repositoriesContent$items[[10]]$url
repositoriesContent$items[[10]]$stargazers_count

#paging
nextPage <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01&page=2")
nextPageContent = content(nextPage)

nextPageContent$items[[1]]$language
nextPageContent$items[[1]]$url
nextPageContent$items[[1]]$stargazers_count

nextPageContent$items[[10]]$language
nextPageContent$items[[10]]$url
nextPageContent$items[[10]]$stargazers_count

rm(createdRepositories)
rm(repositoriesContent)
rm(nextPage)
rm(nextPageContent)
