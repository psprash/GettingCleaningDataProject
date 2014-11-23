run_analysis <- function() {
        ## Read the train data
        message("Reading train files")
        xtrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
        ytrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
        subtrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

        ## Read the test
        message("Reading test files")
        xtest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
        ytest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
        subtest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

        message("Merging x train and test data")
        x_trte <- rbind(xtrain, xtest)

        ## Read features and activity lables file
        message("Reading features.txt and activity_labels.txt")
        features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
        activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
        
        ## Appriately name data set names and assign them to x train-test data
        colnames(x_trte) <- make.names(features$V2)

        ## Retaining only mean and standard deviation DATA 
        x_trte_d <- x_trte[, grep("mean|std", features$V2)]

        ## Merging subject train and test data 
        sub_trte <- rbind(subtrain, subtest)

        ## Renaming clolname for subject train test
        colnames(sub_trte) <- "subject"
        
        message("Merging x train-test with subject train-test")
        x_trte_ds <- cbind(x_trte_d, sub_trte)

        ## Merging y train and test
        y_trte <- rbind(ytrain, ytest)
        

        ## Assigning Activity labels  to y train and test
        message("Assigning Activity Lables")
        y_trte$V1 = activity_labels[y_trte$V1,2]

        ## Renaming clolname for subject train test
        colnames(y_trte) <- "activity"        
        
        ## Merging x train-test-subject with y train-test
        x_trte_dsa <- cbind(x_trte_ds, y_trte)

        ## Aggregating meean of cols for each subject (col 80) and activity (col 81) combination
        message("Aggegrating data (mean) by each subject, activity")
        agg <- aggregate(x_trte_dsa[, 1:79], by = list(x_trte_dsa[,80], x_trte_dsa[,81]), FUN = mean)

        ## Write File
        message("Writing to file tidydatafile.txt in repository")
        write.table(agg, file="./tidydatafile.txt", row.name=FALSE)
}