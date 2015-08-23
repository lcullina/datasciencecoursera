run_analysis <- function(){

        
        #Read test data
        subject_test <- read.table("subject_test.txt")
        x_test <- read.table("X_test.txt")
        y_test <- read.table("y_test.txt")
        
        #Read training data
        subject_train <- read.table("subject_train.txt")
        x_train <- read.table("X_train.txt")
        y_train <- read.table("y_train.txt")
        
        #Read additional data
        activity_labels <- read.table("activity_labels.txt")
        features <- read.table("features.txt")
        
        #Rename activity columns
        colnames(y_train)[1] <- "activity"
        colnames(y_test)[1] <- "activity"
        activity_names <- c("Walking", "Walking Upstairs", "walking Downstairs", "Sitting", "Standing", "Laying")
        y_train$activity <- activity_names[y_train$activity]
        y_test$activity <- activity_names[y_test$activity]
        
        #Rename subject columns
        colnames(subject_test)[1] <- "subject"
        colnames(subject_train)[1] <- "subject"
        
        test_data <- x_test
        train_data <- x_train
        
        
        #Add subject and activity columns to training and test data
        test_data$subject <- subject_test$subject
        test_data$activity <- y_test$activity
        train_data$subject <- subject_train$subject
        train_data$activity <- y_train$activity
        

        
        all_data <- rbind(test_data, train_data)
        
        colnames(all_data) <- features[,2]
        colnames(all_data)[562] <- "subject"
        colnames(all_data)[563] <- "activity"
        
        toMatch <- c("mean", "std", "subject", "activity")
        valid_column_names <- make.names(names = colnames(all_data), unique = TRUE, allow_ = TRUE)
        colnames(all_data) <- valid_column_names
        all_data2 <- select(all_data, grep(paste(toMatch, collapse = "|"),colnames(all_data), ignore.case = TRUE))
        
        by_subject_and_activity <- group_by(all_data2, subject, activity)
        data_summary <- summarise_each(by_subject_and_activity, funs(mean))
        print(data_summary)
        
        
        }