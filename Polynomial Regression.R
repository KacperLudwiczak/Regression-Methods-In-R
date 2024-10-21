# Polynomial Regression

# Importing the dataset
dataset = read.csv('C:/Users/Kacper/Desktop/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 6 - Polynomial Regression/R/Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

summary(lin_reg)


# Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

summary(poly_reg)

library(ggplot2)

# Visualising the Linear Regression results
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue')
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')
  
# Visualising the Polynomial Regression results  
  ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary),
               colour = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
              colour = 'blue') +
    ggtitle('Truth or Bluff (Polynomial Regression)') +
    xlab('Level') +
    ylab('Salary')

# Predicting a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))
y_pred 

# Predicting a new result with Polynomial Regression  
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))
y_pred 
