# Random Forest Regression

# Importar el dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]

library(randomForest)
set.seed(1234)
regression = randomForest(x = dataset[1],
                          y = dataset$Salary,
                          ntree = 500)

# Predicción de nuevos resultados con Regresión 
y_pred = predict(regression, newdata = data.frame(Level = 6.5))

# Visualización del modelo de Random Forest
# install.packages("ggplot2")

library(ggplot2)
x_grid <- seq