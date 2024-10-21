# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)

#dzielimy dane losowo, numer moze byc dowolny
set.seed(123)

#dzielimy kolumne Purchase na train i test, train ma 80% danych
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
split #sprawdzam czy jest dobrze

#dane train, TRUE bo to je chcemy w 80%
training_set = subset(dataset, split == TRUE)
#dane test, FALSE bo to je chcemy w 20%, czyli reszta
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# tworzymy ta samom skale za pomoca Standaryzacji, aby jedna kolumna nie zdominowala drugiej

# Standaryzujemy tylko kolumne Age i Salary, dla train i test
# training_set[, 2:3] = scale(training_set[, 2:3] )
# test_set[, 2:3]  = scale(test_set[, 2:3] )
