## REGRESION LINEAL SIMPLE
# Importar el dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

# Dividir los datos en conjunto de entrenamiento y conjunto de test
# install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

# Escalado de valores
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

regressor = lm(formula = Salary ~ YearsExperience, 
              data = training_set)
summary(regressor)
 ## PREDECIR RESULTADOS CON EL CONJUNTO DE TEST

y_pred = predict(regressor, newdata = testing_set)

## VICUALIZACION DE LOS RESULTADOS EN EL CONJUNTO DE ENTRENAMIENTO

library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
                 colour = "red")+
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo Vs Año de Experiencja (Conjunto de Entrenamiento)") +
  xlab("Años de Experiencia") +
  ylab("Sueldo (en $)")

## VICUALIZACION DE LOS RESULTADOS EN EL CONJUNTO DE testing 

library(ggplot2)
ggplot()+
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red")+
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo Vs Año de Experiencja (Conjunto de testing)") +
  xlab("Años de Experiencia") +
  ylab("Sueldo (en $)")

  
  
               
