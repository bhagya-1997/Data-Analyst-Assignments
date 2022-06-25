## Bhagyashree Deshpande ##
## Assignment ##

## 1.Try to write a code for printing sequence of numbers from 1 to 50 with the differences of 3, 5, 10

print (seq (1,50,3))
print (seq (1,50,5))
print (seq (1,50,10))


## 2. What are the different data objects in R? and write syntax and example for each and every object

## R consists of a number of data objects to perform various functions. There are 6 types of objects in R Programming. They include vector, list, matrix, array, factor, and data frame. Vectors are one of the basic R programming data objects.

## .	Vector
## Vector - c(elements)
vector = c(12,24,36,48,60,72,84,96,108,120)
vector

## .	List
## List - list(data)
list = list(1,2,3,4,5,6,7,8,9,10)
list

## .	Matrix
## M - matrix(data, nrow, ncol, byrow, dimnames)
matrix = matrix(c(9,18,27,10,20,30,11,22,33), 3, 3, byrow = TRUE)
matrix

## .	Array
## A - array(data, dim, dimnames)
array = array(vector, 10)
array

## .	Factor
## Factor - factor(data)
factor = factor(vector)
factor

## .	Data Frame
## Df - data.frame(Key = value, Key = value)
df = data.frame(vector, list)
df


## 3. Create Data frame with 3 columns and 5 rows and write a code to fetch and delete row and a column using index and add new column and row to the existed data frame

emp_id = c(1:6)
emp_name = c('Ross','Rachel','Monica','Chandler','Joey','Phoebe')
salary = c(623.3,515.2,611.0,729.0,843.25,923.68)
emp.data <- data.frame(emp_id, emp_name, salary)

emp.data = emp.data[-c(3)] #Delete Column
emp.data = emp.data[-c(3),] #Delete Row
emp.data

#Add New Row
DataFrame.col <- data.frame(emp_id, emp_name, salary)  
ep.data <- data.frame(7, "Gunther", 458.59)      
names(ep.data) <- c("emp_id", "emp_name", "salary")
new.data <- rbind(DataFrame.col, ep.data)  
new.data


#Add New Column
new.data['designation'] = c("Data Scientist", "Senior Manager", "HR", "Admin", "Sysmter Engineer", "Executive", "Data Analyst") 
new.data


## 4.Write nested if else statements to print whether the given number is negative, positive or Zero

num = -40
if (num > 0) {
  print('Positive')
} else if (num < 0) {
    print('Negative')
} else {
    print('Zero')
}


## 5.write a program to input any value and check whether it is character, numeric or special character

x = 'Hello'
if (is.character(x)) {
  print('Character')
} else if (is.numeric(x)){
  print('Numeric')
} else {
  print('Special')
}


## 6.write difference between break and next also write examples for both

## The next statement in R is useful when we need to skip the current iteration of a loop without eliminating it. Like with while and repeat loops, you can break the for loop completely by using a break statement.

## BREAK
x = 1:10 
for (val in x)
  {
  if (val == 5)
    {
    print (paste ("Coming out from for loop Where i = ", val))
    break
    }
  print (paste ("Values are: ", val))
}

## Next
y = 1:10
for (val in y)
  {
  if (val == 7)  
  {
    print (paste ("Skipping for loop Where i = ", val))
    next
  }
  print (paste ("Values are:  ", val))
}


## 7.write a program to print a given vector in reverse format  
## x= c(1,5.6,3,10,3.5,5)

x = c (1,5.6,3,10,3.5,5)
reverse = rev(x)
print (reverse)


## 8.write a program to get the mode value of the given vector ('a','b','c','t','a','c','r','a','c','t','z','r','v','t','u','e','t')

vector = c("a","b", "c","t","a", "c","r","a","c", "t","z","r","v","t","u","e","t")
my_mode = function(x) {                                                             # Create mode function 
  unique_x = unique(x)
  tabulate_x = tabulate(match(x, unique_x))
  unique_x[tabulate_x == max(tabulate_x)]
}
my_mode(vector)


## 9.Write a function to filter only data belongs to 'setosa' in species of Iris dataset.( using dplyr package)

iris = datasets::iris
library(dplyr)
filter(iris, Species=="virginica")


## 10.Create a new column for iris dataset with the name of Means_of_obs, which contains mean value of each row.( using dplyr package)

iris = datasets::iris
library(dplyr)
spc = iris['Species']
spc
iris = iris[-c(5)]
iris['Means_of_obs'] = apply(iris, 1, mean)
iris['Species'] = spc
iris


## 11.Filter data for the "versicolor" and get only 'sepel_length' and Sepel _width' columns.( using dplyr package)

iris = datasets::iris
library(dplyr)
data = filter(iris,Species=="versicolor")
data [c('Sepal.Length', 'Sepal.Width')]


## 12.create below plots for the mtcars also write your inferences for each and every plot (use ggplot package) Use Different ( Size , Colour )

library(readr)
mtcars <- read_csv("C:/Users/Admin/Downloads/mtcars.csv")
View(mtcars)

input = mtcars[,c('mpg','cyl')]
print(head(input))
v = mtcars$mpg
v
x = mtcars$wt
x

## Scatter plot
png(file = "scatterplot.png")
plot(x = x, y = v, xlab = "wt", ylab = "mpg", xlim = c(1, 3), ylim = c(0, 40), main = 'Scatterplot')
dev.off()

## Box Plot
png(file = "boxplot.png")
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders", ylab = "Miles Per Gallon", main = "Mileage Data")
dev.off()

## Histogram
png(file = "histogram.png")
hist(v, xlab = "mpg", col = "green", border = "black", xlim = c(0,40), ylim = c(0,40), main = 'Histogram of Mileage')
dev.off()

## Line Graph
png(file = "line_chart.jpg")
plot(v, type = "o", main = 'Line Chart')
dev.off()

## Bar Graph
png(file = "barchart.png")
barplot(v ,xlab="mpg", ylab="cyl", col="blue", border="red", main = 'Bar Chart of Mileage')
dev.off()