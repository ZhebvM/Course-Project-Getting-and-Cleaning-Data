# Course-Project-Getting-and-Cleaning-Data
This repo contains the code for the coursera course project for Getting and Cleaning Data

In order to run the R script, please, follow the steps below:

1. Download the data from the url provided below

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Unzip the file and set the working directory in R to the respective folder using setwd()

3. The data consist of multiple files, which must be merged together for the analysis. These files are described in the file called README.txt 

4. It is also useful to read the features_info.txt file, which explains which features have been measured for each subject.

5. The file presented here shows how the data files can be merged together and prepared for analysis. In the final step it prepares a data set containing the mean value for each feature (averaging both the the mean and sd provided) for each subject for each activity. 

6. Please, note that as per the instructions of the assignment the code uses only the mean and standard deviation for each feature, however more measurements have been taken as shown in the features_info.txt file. 
