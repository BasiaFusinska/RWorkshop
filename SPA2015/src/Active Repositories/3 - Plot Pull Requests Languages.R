#count occurences of languages
languages <- table(pullRequests$language)
languages

#languages marked the same as repository id
languagesNames <- names(languages)
languagesNames

print(pullRequests[pullRequests$language == '22369870',]$id)
print(pullRequests[pullRequests$language == '21061553',]$id)

pullRequests <- pullRequests[
  as.character(pullRequests$language) != as.character(pullRequests$id),]

languages <- table(pullRequests$language)
head(languages)

languages <- languages[languages > 5]
barplot(languages)

languages <- sort(languages, decreasing=TRUE)
languagesNames <- names(languages)
languagesNames

barplot(languages)

rm(languages)
rm(languagesNames)
rm(pullRequests)
