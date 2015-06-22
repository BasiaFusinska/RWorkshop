languages <- table(repositories$language)
languages <- sort(languages, decreasing=TRUE)
barplot(languages)

languages <- table(repositories[as.character(repositories$language) != "null",]$language)
languages <- sort(languages[languages > 50], decreasing=TRUE)

barplot(languages)

rm(languages)
rm(repositories)
