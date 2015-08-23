README

This script consolidates and summarizes data from a UCI human activity recognition experiment.

The data is from a UCI experiment where 30 volunteers wore a Samsung Galaxy S II smartphone on their waist while performing 6 activities:
Walking, Walking Upstairs, Walking Downstairs, Sitting, and Laying.
The measurements were collected from the embedded accelerometer and gyroscope in the smartphone.

See full details of the experiment at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


1.

Download the data here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


2.

Unzip the files and move all raw data into your working directory.


3.

Run the R script "run_analysis.R", which will print the summary output.


The output contains 180 rows (30 volunteers x 6 activities), and 563 columns (561 features of averaged time and frequency domain variables, a subject variable from 1-30, and an activity variable). 
 
