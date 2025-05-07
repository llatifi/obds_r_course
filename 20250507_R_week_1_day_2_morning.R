## OBDS R Course - Day 2
## 20250507
## Luka's birthday :)



## Work Space Management 
# In Posit, to reopen quicker (avoid having things to restore), good practice
# to use broom to clean environment, close projects, etc.

# Save/read RDS provides much more control. Although, you need to rename
# object when opening again.

# If you have tabular data, table or matrix, can save with write.table
# so that information can be used with other programs (Python, linux, etc.).

# Can do file management within R; don't need to go to linux.
# When creating directory (dir.create("new_directory")), will make in working
# directory. Can put full file path to create elsewhere.



## Exercise - Work Space Management

# Open a new R script and write code to create three new objects (any type, 
# any name, any value).
numbers <- c(18, 20250507)
event <- "Luka's Birthday!"
season <- "Spring"

# Save your R script.


# Save all objects in your work space to an .RData file.
save.image(file = "example_workspace.RData")
load("example_workspace.RData")  # In new script to test

# Write one object in your work space to a file using saveRDS().
saveRDS(object = event, file = "example_event.rds")
event_restored <- readRDS(file = "example_event.rds")  # In new script to test

# Remove one object from your workspace.
rm(season)

# Prove that the object was removed.
# No longer in environment window.
ls()

# Remove all objects from your workspace.
rm(list = ls())

# Display your working directory.
getwd()

# Create a new directory and set the working directory in that new directory.
dir.create("example_new_directory")
setwd("/project/hert7274/OBDS_R_week_1/base_r_1/example_new_directory/")
getwd()

# Restore objects saved in the .RData file to your workspace.
# load("example_workspace.RData") # Did not work (although it did earlier); 
# need to add full file path.
load("/project/hert7274/OBDS_R_week_1/base_r_1/example_workspace.RData")

# Restore the object saved in the RDS file to your workspace under a different 
# name.
new_event_restored <- readRDS(file = 
  "/project/hert7274/OBDS_R_week_1/base_r_1/example_event.rds")
# R does not like line breaks within file path, but can do before a portion 
# of the command.
# Can use ../ instead as well.


## R Markdown
# Open R Markdown file, leave setup chunk in case useful later, remove the rest.
# Green c button or command + option + i to open code (can be different languages).


## Exercise - Descriptive Statistics

# Use readRDS() to load the file my_day2matrix.rds and assign the object to the 
# name m.
m <- readRDS(file = 
  "/project/hert7274/SHARED/r/1_r_data_science/2-base/my_day2matrix.rds")

head(m)
dim(m)

# Compute the sum of values in each row and add those values as a new column in 
# the matrix.
rowSums(m)
m <- cbind(m, rowSums(m))
# Note: Could also name new column.
# m2 <- cbind(m1, row_sum = rowSums(m1))

head(m)
m

# Run the command data("ToothGrowth") to load the builtin data set ToothGrowth.
data("ToothGrowth")

head(ToothGrowth)

# Open the help page for the ToothGrowth data set, to learn more about it.
?ToothGrowth

# What is the class of the ToothGrowth object?
class(ToothGrowth)
str(ToothGrowth)

# What type of data is stored in each column of the ToothGrowth data set?
str(ToothGrowth)

# What is the mean tooth length across all observations in the data set?
colMeans(ToothGrowth[c("len")])
# <https://www.geeksforgeeks.org/how-to-use-colmeans-function-in-r/>
# colMeans(ToothGrowth$len)
# $ didn't work in this context for some reason.

View(ToothGrowth)

# What is maximum value of tooth length?
max(ToothGrowth[c("len")])
# Or
max(ToothGrowth$len)

# What is minimum value of tooth length?
min(ToothGrowth[c("len")])
# Or
min(ToothGrowth$len)

# Can you use the functions rowSums() and colSums() on the ToothGrowth object?
rowSums(ToothGrowth)
colSums(ToothGrowth)
# No, you cannot because these functions only work with numeric values and 
# some of the values in the supp column are factors. This is why it was 
# necessary to indicate with indexing above which columns the function should
# analyse.