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

#Create the first plot
png("plot1.png",width = 480,height = 480)
hist(power_consumption$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
