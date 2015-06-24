#---------------bar plots--------------------------
ggplot(weekData, aes(daypart)) + geom_bar()

# stat="Identity" because default is "bin" which give the number
ggplot(weekData, aes(x=h, y=Monday)) + geom_bar(stat="Identity")

#description
ggplot(weekData, aes(x=h, y=Monday, fill="Monday")) + geom_bar(stat="Identity") + scale_fill_hue("Day") +
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week")

ggplot(weekData, aes(x=h)) + 
  scale_fill_hue("Day") + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  geom_bar(aes(y=Monday, fill="Monday"), stat="Identity") +
  geom_bar(aes(y=Wednesday, fill="Wednesday"), stat="Identity") +
  geom_bar(aes(y=Friday, fill="Friday"), stat="Identity")

ggplot(weekData, aes(x=h)) + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  geom_bar(aes(y=Monday, fill="Monday"), stat="Identity") +
  geom_bar(aes(y=Wednesday, fill="Wednesday"), stat="Identity") +
  geom_bar(aes(y=Friday, fill="Friday"), stat="Identity") +
  scale_fill_manual(values = c("red", "green", "blue"), name= "Day")


ggplot(weekData, aes(x=h)) + 
  scale_fill_hue("Day") + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  geom_bar(aes(y=Monday, fill="Monday"), stat="Identity", position="dodge") +
  geom_bar(aes(y=Wednesday, fill="Wednesday"), stat="Identity", position="dodge") +
  geom_bar(aes(y=Friday, fill="Friday"), stat="Identity", position="dodge")


library(reshape2)
meltedWeek <- melt(weekData[,c('h','Monday','Wednesday', 'Friday')],id.vars = 1)

ggplot(meltedWeek, aes(x=h, y=value)) + geom_bar(aes(fill=variable), stat="Identity")

ggplot(meltedWeek, aes(x=h, y=value)) + geom_bar(aes(fill=variable), stat="Identity", position="dodge")
