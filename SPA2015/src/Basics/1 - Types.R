# numeric type
myNumber = 1
myNumber
typeof(myNumber)

# character
myChar <- "a"
myChar
typeof(myChar)

#vector
myVector <- c("a", "b", "c")
myVector
typeof(myVector)
myVector[2]
myVector[5]

myNamedVector <- c(first="a", second="b", third="c")
myNamedVector

myNamedVector[1]
myNamedVector[[1]]
myNamedVector['first']
myNamedVector[['first']]

#list
myList <- list("a", "b", "c")
myList
typeof(myList)
myList[2]
myList[[2]]

myMixedList <- list(1, "a", c("b", "c"))
myMixedList
typeof(myMixedList)
myMixedList[2]
myMixedList[[2]]

myNamedList <- list(first="a", second="b", third="c")
myNamedList

myNamedList[1]
myNamedList[[1]]
myNamedList['second']
myNamedList[['second']]
myNamedList$second

#cleaning
rm(myNumber)
rm(myChar)
rm(myVector)
rm(myNamedVector)
rm(myList)
rm(myMixedList)
rm(myNamedList)
