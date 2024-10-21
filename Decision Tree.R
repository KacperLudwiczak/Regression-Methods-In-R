# Decision Tree Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting Decision Tree Regression to the dataset
install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

#Ten kod używa funkcji rpart w programie R do budowy modelu drzewa regresji, który przewiduje wartości wynagrodzenia (Salary) na podstawie innych zmiennych w zbiorze danych.
#Argument "formula" określa wzór modelu, który w tym przypadku jest "Salary ~ .", co oznacza, że wynagrodzenie jest zmienną zależną, a wszystkie inne zmienne w zbiorze danych są zmiennymi niezależnymi.
#Argument "data" określa zbiór danych, na którym budowany jest model.
#Argument "control" określa różne parametry kontrolne dla funkcji rpart, takie jak minimalna liczba obserwacji wymagana do podziału węzła w drzewie. W tym przypadku parametr "minsplit" jest ustawiony na 1, co oznacza, że każdy węzeł w drzewie będzie dzielony, chyba że zawiera tylko 1 obserwację.
#Ogólnie rzecz biorąc, ten kod używa algorytmu drzewa decyzyjnego do budowy modelu regresji, który przewiduje wartości wynagrodzenia na podstawie innych zmiennych w zbiorze danych.


# Predicting a new result with Decision Tree Regression
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

# Visualising the Decision Tree Regression results (higher resolution)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')

# Plotting the tree
plot(regressor)
text(regressor)