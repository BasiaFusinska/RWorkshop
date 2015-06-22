library("httr")

# Using GitHub API
repositoryLanguageAPIInfo <- GET("https://api.github.com/repos/BasiaFusinska/RWorkshop/languages")

head(repositoryLanguageAPIInfo)
repositoryLanguageAPIInfo$content

languageContent <- content(repositoryLanguageAPIInfo)
languageContent

rm(repositoryLanguageAPIInfo)
rm(languageContent)
