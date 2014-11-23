The CodeBook includes the following informatio:
=========================================

Variables Definition and Transformation Information:
- xtrain, xtest, ytrain, ytest, subtrain and subtest are the variables into which the 'train' and 'test' files are read
- x_trte is the merged data frame of the x 'train and 'test' created using rbind
- features variable contains the data from 'features.txt'. The colname is assigned 'subject'. The colValues are transformed using 'make.names' function.
- activity_labels contains the data from 'activity_labels.txt'. The activity codes are replaced by the activity_labels. The colname is assigned 'activity'
- x_trte_d is the subset data, only containing the mean and standard deviation columns. 'grep' is used to filter the columns
- sub_trte is the merged data frame of the subject 'train and 'test' created using rbind
- x_trte_ds is the column merged data frame of x_trte_d and sub_trte using cbind. 
- y_trte is the merged data frame of the y 'train and 'test' created using rbind
- x_trte_dsa is the column merged data frame of x_trte_ds and y_trte using cbind. 
- agg is the tidy data set with the average of each variable for each activity and each subject

the 'agg' data frame is written into the file 'tidydatafile.txt' using 'write.table'

In the data file created:
The column 'Group.1' denotes 'subject'.
The column 'Group.2' denotes 'activity'.