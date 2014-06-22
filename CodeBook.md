# CodeBook.md

a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

Activities are labelled with single digits mapping to the following activities:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

There are two sets of data, both constructed in like fashion:

One X_* file that contains the actual data, each row corresponding to an
activity as identified by the row's corresponding row from the y_* file. E.g.,
the first row of X_train.txt is 561 measurements of standing activity.

The file subject_*, like y_*, is a single column identifying, for each row in
the X_* file, the test subject associated with those measurements.

