Repository for cousera course getdata-006
author: ron shillinglaw
purpose: programming assignment to combine raw data files to make a tidy data set
data source: downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
             This is part of: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

description: This is for "Human Activity Recognition Using Smartphones Dataset". Thirty subjects
             Smartphone accelerometer and gyroscopic readings were recorded while they were doing 6 different
             activities:  walking, walking upstairs, walking downstairs, sitting, standing, lying. This
             data was kept virgin in the "UCI HAR Dataset" folder. These are 26 data files and 2
             description files. These files were combined into 2 files per the assignment.
             
recipe:      Subject, activity, and type were combined and inserted into the first three columns of acc_gyro.txt.
             Type is "test" or "train" depending on the data source with the test rows first. A more
             descriptive column heading was inserted into the acc_gyro.txt file. The 128 measurements
             columns are labeled meas1, meas2, ... , meas128.
             All combinations of subject and activity were inserted into the first two columns of the
             averages_meanSD.txt file. Then subject and activity was used to subset and average the
             remaining 79 columns on each variable.

             
             file:                   column:          source files:
             =====                   =======          ============
             averages_meanSD.txt     subject          subject_test.txt, subject_train.txt
                                     activity         activity_labels.txt, y_test.txt, y_train.txt
                                     79 variables     features.txt, X_test, X_train
                                     
             acc_gyro.txt            subject          subject_test.txt, subject_train.txt
                                     activity         activity_labels.txt, y_test.txt, y_train.txt
                                     type             test or train depending on file
                                     meas1..128       Inertial Signals/*.*  , 9 files test + 9 files train
                            
included files:

readme.md             -this file
run_analysis.R        -R file to make acc_gyro.txt & meanSD.txt
meanSD.txt            -  means and SD

uploaded/other:

acc_gyro.txt          -combined accelerometer and gyro data uploaded to getdata-006
UCI HAR Dataset/      - 28 raw source files, too large to include, see data source


code book:   Below is a list of each column/variable and description:

             column:        description:
             ======         ===========
             subject        integer- 1..30 identifies subject number
             activity       chr-     walking, walking upstairs, walking downstairs, sitting, standing, lying
             type           chr-     test, train
             meas1..128     double-  max: 5.746062         min:  -5.97433
             79 variables   double-  max: 0.9404773        min:  -0.9932358

