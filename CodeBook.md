# CodeBook.md

## 1. Concatenation of Data Sets

The test and training data sets are simply concatenated together. The
dimensions and layout of the data in each data set allow for this.

## 2. Subsetting the Data

For this project we are only interested in the features related to measurements
of the mean and standard deviation. There is some room for interpretation here
pertaining to which features should be included or not. For our purposes, only
those features whose names end in "-mean()" or "-std()" were included.

The column numbers for the mean() and std() columns were extracted from the
command line using egrep as follows:

    $ egrep 'mean()|std()' features.txt | awk '{ print $1 }'

This could be done from within R as well.

The resulting column numbers were stored in the "feature" variable within the
code. Additional features can be added to the analysis by simply adding their
associated column numbers to the "features" variable.

Using the "features" variable, the data set was subsetted to include on the
data points of interest.

## 3. Labelling
Two columns were added to the "front" of the data set, one for the Subject code
and one for the Activity code. In both cases the respective files
(subject_*.txt, y_*.txt) were concatenated in the same manner as the actual
data sets, and then added to the data frame.  Activity codes were then replaced
with their descriptive names from the activity_labels.txt file.

Finally, the column headers were added using the labels in the features.txt file.

## Variable Names
* Subject - A numeric code corresponding to a participant in the study.
* Activity - One of: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LYING"
* Feature Variables - The remaining variable names are taken from the source data "features.txt" file.
