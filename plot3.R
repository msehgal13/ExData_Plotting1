#Load the library
library(dplyr)
library(lubridate)

# Mention the directory path
dir<-"/Users/manavsehgal/Library/Mobile Documents/com~apple~CloudDocs/Work/Study/Coursera/Data-Scientist/datasciencecoursera/ExData_Plotting1"

# Mention the name of the file
file_name<-"household_power_consumption.txt"

#Load the variable names
var_names<-names(read.table(file_name,header = TRUE,sep=";",nrow=1))

# Load the file into a dataset
power_consumption<-read.table(file_name,header = FALSE,sep=";",skip = grep("^1/2/2007",readLines(file_name)),nrow=length(grep("^1/2/2007|^2/2/2007",readLines(file_name)))-1)
names(power_consumption)<-var_names

#Convert the dataset into tibble for easy viewing
power_consumption<-tbl_df(power_consumption)
print(power_consumption)

#Create a datetime variable
date_time<-strptime(paste(power_consumption$Date,power_consumption$Time),"%d/%m/%Y %H:%M:%S")

#Create the second plot
png("plot3.png",width = 480,height = 480)
plot(date_time,power_consumption$Sub_metering_1,type = "l",ylab="Energy Sub metering",xlab="")
lines(date_time,power_consumption$Sub_metering_2,type = "l",col="red")
lines(date_time,power_consumption$Sub_metering_3,type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
