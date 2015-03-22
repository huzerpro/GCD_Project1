library(dplyr)
library(plyr)
library(reshape2)
#
setwd("~/Coursera/Data mining specialization/3_Getting and cleaning data/week 3/project")

#1)
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")

data <- rbind(test,train)

#2)
features <- read.table("./UCI HAR Dataset/features.txt")
mean <- grep("mean",features$V2)
#meanF <- grep("meanF",features$V2)
#mean <- mean[! mean %in% meanF]
std <- grep("std",features$V2)
index <- sort(c(mean,std))

data <- data[,index]

#3)
test.activity <- as.vector(t(read.table("./UCI HAR Dataset/test/y_test.txt")))
train.activity <- as.vector(t(read.table("./UCI HAR Dataset/train/y_train.txt")))
data.activity <- c(test.activity,train.activity)

data <- cbind(data.activity,data)

activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity.labels) <- c("data.activity","Activity")

data <- join(activity.labels,data,by="data.activity",type="right")
data <- data[c(2:81)]
print(object.size(data),units="MB")

#4)
data.labels <- as.vector(t(features$V2))
data.labels <- data.labels[index]
data.labels <- gsub("()","",data.labels,fixed=TRUE)
data.labels <- gsub("-","",data.labels,fixed=TRUE)

colnames(data) <- c("Activity",data.labels)

#5)
test.subject <- as.vector(t(read.table("./UCI HAR Dataset/test/subject_test.txt")))
test.subject <-paste("Subject",as.character(test.subject))
train.subject <- as.vector(t(read.table("./UCI HAR Dataset/train/subject_train.txt")))
train.subject <-paste("Subject",as.character(train.subject))
Subject <- c(test.subject,train.subject)

data2 <- cbind(Subject,data)

data.summary <- data2 %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

write.table(data.summary,file="data_summary.txt",row.names=FALSE)

