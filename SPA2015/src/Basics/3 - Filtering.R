#only strings of length 2

vectorToFilter <- c("aa", "abc", "bc")

filtered = vectorToFilter[nchar(vectorToFilter) == 2]
filtered

listToFilter <- list("aa", "abc", "bc")

filtered = listToFilter[nchar(listToFilter) == 2]
filtered

listToFilter <- list(a="aa", b="abc", c="bc")

filtered = listToFilter[nchar(listToFilter) == 2]
filtered

#only vectors of length 3

listToFilter = list(first=c(1, 2, 3), second=c(4, 5), third=c(6, 7, 8))
filtered = listToFilter[lapply(listToFilter, length) == 3]
filtered
filtered = Filter(function(element) {length(element) == 3}, listToFilter)
filtered

#filtering data frames
dfToFilter <- data.frame(list(first=c(1, 2, 3), second=c(4, 5, 6), third=c(7, 8, 9)))
dfToFilter

#by rows
filtered <- dfToFilter[dfToFilter$first %% 2 == 1,]
filtered

#by columns
filtered <- dfToFilter[,2]
filtered

filtered <- dfToFilter[,c(1,3)]
filtered

filtered <- dfToFilter[,c('first','second')]
filtered

rm(vectorToFilter)
rm(listToFilter)
rm(dfToFilter)
rm(filtered)
