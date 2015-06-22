dataTableList = list(first=c(1, 2, 3), second=c(4, 5, 6))
dataTableList

#rearrange the list
dataTableList[c("second", "first")]

#data frame by columns
dataFrame <- data.frame(dataTableList)
dataFrame
typeof(dataFrame)

summary(dataFrame)

dataTableList = list(c(first=1, second=2, third=3), c(first=4, second=5, third=6))
dataTableList
#data frame by rows
dataFrame <- data.frame(do.call(rbind, dataTableList))
dataFrame

#matrix
myMatrix <- matrix(c(dataFrame$first, dataFrame$second), nrow=2)
myMatrix
typeof(myMatrix)


rm(dataTableList)
rm(dataFrame)
rm(myMatrix)