<<<<<<< HEAD
# GCD_Project1

Getting and Cleaning Data - Course Project

The run_analysis.R code is divided in five parts according to the steps we do to make our analysis.

Before we begin our analysis, we load the requiring packages and set our working directory properly.

In the first part, we load the test (X_test.txt) and train (X_train.txt) files, and merge them using rbind to create our data frame called "data".

In the second part, we load the features.txt file, so we can search for the mean and standard deviation measures and filter them. We acomplish this by searching "mean" and "std" in V2 of features data frame. After we locate the measures we want, we subset the "data" data frame.

In the third part, our porpuse is to name properly the activity variable in our "data" data frame. We start reading the y_text.txt, y_train.txt and cbind the with our "data" dataframe. Then we read the activity_labels.txt into the activity.labels data frame, join it with our "data" dataframe and subseting the resulting data with the Activity variable properly named.

In the fourth part, we name the column of our "data" data frame using the info in the features.txt file.

In the fifth part, su summarize our data using a pipeline instruction grouping our "data" dataframe by Subject and activity an summarizing each measurement by the mean function.

Finally, we write the summarize data using the write.table R function.


