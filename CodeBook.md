
# Code book for "Getting and Cleaning Data"

## Data Source
Data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data is comprised of movement data from the accelerometers of the Samsung Galaxy S smartphone.
A description of the experiment can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Main Data sets
From the data source, you will find data sets that can be placed in four categories:
+ Feature Data, processed data that includes mean, standard deviation, min, max etc of the observations
+ ID Data, data that can be added to the Feature data to identify observations
+ Lookup Data, simple lookup tables
+ Raw Data, the raw signal data from the device which was used to create the Feature data.

All except the Lookup data, is split between Train(70%) and Test(30%).
For the purpose of this exercise, the Raw Data was not used and the Train and Test sets were combined to form a main data set.

## Processing the data - Part 1
The first step of the program, is to import the Feature data and combine these for the Main set.
Labels were then added to the Main set.

To add the Activity and Subjects ID's to the Main set, the data sets were imported for the Train and Test sets.
Then appended (in the same order as with the Feature data) separetely to create sets "Activity" and "Subjects".
Both these data sets were then combined with the Main set, the Main set at that point thus included all the Feature data, labled and identified.

As required, "grep" was used to identify the variables from Main set that were either the mean of an observation or the standrard deviation.
After identifying these variables, the program filters for them including "Activity" and "Person_ID" (the subject ID).
A lookup is then used to describe each activity with the added variable "Activity_desc".

## Processing the data - Part 2
Part 2 of the exercise required a summary for the average of variables by Activity and by Subject.
This was performed in three simple steps:
- Calculate average by Activity
- Calculate average by Subject
- Calculate average by Activity & Subject

Each step resultated in a data set that had the groups as rows and the average of each variable as columns.
The three resulting data sets were the appended to create one summary table that included all averages by Activity, Subject and Activity by Subject.
 