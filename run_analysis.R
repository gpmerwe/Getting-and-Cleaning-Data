
# Importing Raw Data
setwd("C:/Coursera/3. Getting and Cleaing Data/UCI HAR Dataset")

######### Part 1 ###########
# Feature Data
Test_feature <- read.table("./test/X_test.txt")
Train_feature <- read.table("./train/X_train.txt")
Main_set <- rbind(Test_feature, Train_feature)

# Add column names
Feature_labels <- read.table("./features.txt")
Feature_labels <- Feature_labels[,2]

colnames(Main_set) <- Feature_labels

# Activity
Test_Act <- read.table("./test/y_test.txt")
Train_Act <- read.table("./train/y_train.txt")
Activity <- rbind(Test_Act, Train_Act)
names(Activity) <- paste("Activity")

# Subject IDs
Test_subjects <- read.table("./test/subject_test.txt")
Train_subjects <- read.table("./train/subject_train.txt")
Subjects <- rbind(Test_subjects, Train_subjects)
names(Subjects) <- paste("Person_ID")

# Add Activity and Subject ID to main set
Main_set <- cbind(Subjects, Activity, Main_set)

# Select only mean and stdev columns (also included Subject & Activity)
My_vars <- grep("mean|std", Feature_labels, value=TRUE)
My_vars2 <- c("Person_ID", "Activity", My_vars)

Main_set <- Main_set[,My_vars2]

# Lookup Activity field
Act_lookup <- read.table("./activity_labels.txt")
colnames(Act_lookup) <- c("Activity", "Activity_desc")
Main_set <- merge(Act_lookup, Main_set, by="Activity")

######### Part 2 ###########
# Each Activity Average
Act_avg <- aggregate(Main_set[,4:82], list(Main_set$Activity_desc), mean)
Act_avg$Group.1 <- as.character(Act_avg$Group.1)
# Each Subject Average
Subj_avg <- aggregate(Main_set[,4:82], list(Main_set$Person_ID), mean)
Subj_avg$Group.1 <- as.character(Subj_avg$Group.1)
# Subject by Activity Average
Main_set$SubAct <- paste(Main_set$Person_ID, Main_set$Activity_desc)
SubAct_avg <- aggregate(Main_set[,4:82], list(Main_set$SubAct), mean)
SubAct_avg$Group.1 <- as.character(SubAct_avg$Group.1)

Summary_table <- rbind(Act_avg, Subj_avg, SubAct_avg)
colnames(Summary_table)[1] <- "Summary Group"

Summary_table