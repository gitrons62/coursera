setwd("~/R/coursera/getdata-006/project/tidyData") #### run time 6.3 minutes == 380 seconds
startTime=proc.time()
###section 1 combine files to make one == acc_gyro.txt ##############
 
activities      =read.table("UCI HAR Dataset/activity_labels.txt",row.names=1)
subject_test    =read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train   =read.table("UCI HAR Dataset/train/subject_train.txt")
y_test          =read.table("UCI HAR Dataset/test/y_test.txt")
y_train         =read.table("UCI HAR Dataset/train/y_train.txt")

         ##### make first 3 columns 
activities = tolower(unlist(activities))
first3 = data.frame(subject  = c(unlist(subject_test),unlist(subject_train)),
                    activity = c(activities[unlist(y_test)],activities[unlist(y_train)]),
                    type     = c(rep("test",2947), rep("train",7352)), stringsAsFactors=F)

###         ##### make column headings 

labels=c("subject","activity","type")
for(ii in 1:128) labels[ii+3] = paste("meas",ii,sep="")

          ##### make 2947 rows test + 7352 rows train = 10299 rows
          ##### 2 minutes read xx minutes write

files_test = c("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",
               "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

files_train = c("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",
               "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

bind_files = function(file1, file2){
               temp = rbind(read.table(file1), read.table(file2))
               temp = cbind(first3, temp)
               names(temp) = labels
               temp
             }

acc_gyro = bind_files(files_test[1], files_train[1])

for(jj in 2:9)acc_gyro = rbind(acc_gyro, bind_files(files_test[jj], files_train[jj]))

 write.table(acc_gyro,"acc_gyro.txt")

###section 2 combine files to make one == meanSD.txt ##############

features        = read.table("./UCI HAR Dataset/features.txt",row.names=1, as.is=TRUE)
X_test          = read.table("./UCI HAR Dataset/test/X_test.txt")
X_train         = read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_test)   = unlist(features)
names(X_train)  = unlist(features)
features_all    = cbind(first3[,1:2], rbind(X_test, X_train))

fnums=c(1:2,grep("mean",names(features_all)),grep("std",names(features_all)))
meanSD=features_all[,fnums]
avg=meanSD[1:180,];  avg[,2] = activities;   avg[,3:82]=0

for(num in 1:180)
  avg[num,3:81] = colMeans(meanSD[meanSD$subject == avg[num,1] & meanSD$activity == avg[num,2],3:81])

write.table(avg,"averages_meanSD.txt")

proc.time() - startTime
