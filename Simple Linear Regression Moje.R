# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Simple Linear Regression to the Training set

#tworzymy regresje liniowa
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#tak mozemy sprawdzic wyniki obliczen modelu
summary(regressor)

# Predicting the Test set results

#przewidujemy y na podstawie x ze zbioru test
y_pred = predict(regressor, newdata = test_set)

#tak spr jak wygloda y_pred
y_pred

# Visualising the Training set results
# install.packages('ggplot2')
library(ggplot2)

#tworzymy wykres dla training, czerwone punkty to prawdziwe dane, niebieskie punkty(sa w lini) to przewidzinae przez model
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training)') +
  xlab('Years of Experience') +
  ylab('Salary')
 
#tworzymy wykres dla test, czerwone punkty to prawdziwe dane, niebieskie punkty(sa w lini) to przewidzinae przez model
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test)') +
  xlab('Years of Experience') +
  ylab('Salary')





