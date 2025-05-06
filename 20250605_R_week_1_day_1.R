## OBDS R Course - Day 1
## 20250506



## Introduction to R

getwd() # To see file path

123 + 4
6 * 9

help(sd)

# To type "<-", keyboard shortcut "option" + "-".
# "cntrl" + "shift" + "c" to convert a series of lines to # or to start a line
# with #.

x <- 100
print(x)
x

letters
letters[14]
letters[14:16]
letters[c(1, 5, 21)]

letters[14] <- "..."
letters == "..."



## Exercise - Vectors

# Assign the values 1 to 200 to a vector named a.
a <- 1:200
a

# Multiply each element of the vector by 123 and assign the result to a new.
# object named b
b <- a * 123
b

# Print the value of the 44th element of the vector b.
b[44]

# Extract the first fieen elements of b and assign them to a new vector named 
# b_sub.
b_sub <- b[1:15]
b_sub

# Append the numbers 24108 and 24231 to the object b_sub.
b_sub <- c(b_sub, 24108, 24231)
# Can also do b_sub <- c(24108, 24231, b_sub) to add at beginning.
b_sub

# Assign the values 'actb', 100, 3.4 to a vector named m.
m <- c('actb', 100, 3.4)
m

# Print the second element of m. Is it what you would expect? Why?
m[2]
# Has changed to a string since different value types given in vector.

# Multiply the second element of m by 4. What happens? Why?
m[2] * 4
# Operator won't work since no longer numeric

# Make a vector c that contains four named character scalars.
c <- c(season = "spring", weather = "sunny", flower = "rose", animal = "fox")
c

# Display the names of the elements in c.
names(c)
# Or attributes(c)



## Introduction to R Continued

mat <- matrix(data = 1:200, nrow = 10, ncol = 20, byrow = FALSE)
mat


## Exercise - Matrices and Arrays

# Assign a matrix that contains the integers 1 to 9 in three rows and three 
# columns (filled by column) to an object named m1.
m1 <- matrix(data = 1:9, nrow = 3, byrow = FALSE)
m1

# Extract the number 8 using indexing by row and column.
m1[2,3]

# Assign a matrix that contains the integers 1 to 12 in three rows and four 
# columns (filled by row) to an object named m2.
m2 <- matrix(data = 1:12, nrow = 3, byrow = TRUE)
m2

# Add column and row names to the matrix m2 (you choose the names).
# colnames(m2) <- c("one", "two", "three", "four"), can write out fully.
colnames(m2) <- paste0("columns_", 1:ncol(m2))
rownames(m2) <- paste0("row_", 1:nrow(m2))
m2

# Assign an array that contains the integers 1 to 24 along dimensions of
# lengths 4, 2 and 3 to an object named a.
# 4 rows, 2 columns, 3 layers.
a <- array(data = 1:24, dim = c(4, 2, 3))
a

# Extract the number 15 using indexing by the three dimensions.
a[3,2,2]

# Extract the matrix in the last dimension of the array and assign to a new 
# object named last_matrix.
# last_matrix <- a[,,3], other short hand option to write (leave blank to 
# include all).
last_matrix <- a[1:4, 1:2, 3]
last_matrix

# Assign a list of five items of different data types to a list named l.
l <- list("character", 4.75, 7L, TRUE, 1 +4i)
l

# Extract the elements at position 3 and 5 of l as a single new list.
new_list <- l[c(3,5)]
new_list

# Repeating last two tasks with nested list.
l2 <- list("character", 4.75, c(7L, 14L), TRUE, c(1 +4i, 2+4i))
# More readable example, spreading over multiple lines:
# l2 <- list(
#   "character",
#   4.75,
#   c(7L, 14L), 
#   TRUE, 
#   c(1 +4i, 2+4i)
# )
# (Don't need \ before line break to continue code on next line.)
l2
l2[[3]]
l2[[3]][[2]]

# new_list_2 <- l[c(3[2], 5)]
# new_list_2 <- l[c([[3]][[2]], [[5]][[2]])]
# new_list_2



## Exercise - Data Frames

# Assign data from the file coding_gene_region.bed to an object named gene_data.
gene_data <- read.delim("/project/shared/r/1_r_data_science/1-base/coding_gene_region.bed", 
                        header = FALSE)
head(gene_data)

# Display the dimensions of the data frame and the type of data in each column.
dim(gene_data)
str(gene_data) 
View(gene_data)

# Set column names to: chr, start, end, name, score, and strand.
colnames(gene_data) <- c("chr", "start", "end", "name", "score", "strand")

# Prove that you have (re)named the columns.
colnames(gene_data)
head(gene_data)

# Display the value at row 30, column 3.
gene_data[30,3]

# Assign the column named start to a new object named start_position.
start_position <- gene_data$chr
head(start_position)

# Calculate the length of each gene and assign that value to a new column named 
# length.
gene_data$length <- gene_data$end - gene_data$start

# Prove that you have added the new column.
head(gene_data)

# Assign rows where the gene length is between 100kb and 200kb to a new object 
# named filtered_gene_data.
filtered_gene_data <- subset(gene_data, length > 100000 & length < 200000)
head(filtered_gene_data)
dim(filtered_gene_data)

# Export filtered_gene_data to a file named filtered_gene_regions.tsv, using 
# tabulation as a field delimiter. Include column names but not row names.
write.table(gene_data, file = "filtered_gene_regions.tsv", quote = FALSE, sep = "\t", row.names = FALSE)

read.delim("filtered_gene_regions.tsv")
help(write.table)
# Can hold command and click on file name to open.