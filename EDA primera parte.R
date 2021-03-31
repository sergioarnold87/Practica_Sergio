library(tidyverse)
# An??lisis exploratorio de datos
# * Modelar
# * Representaci??n gr??fica
# * Transformar datos

# * ??Qu?? tipo de variaciones sufren las variables?
# * ??Qu?? tipo de covariaci??n sufren las variables?

# * variable: cantidad, factor o propiedad medible
# * valor: estado de una variable al ser medida
# * observaci??n: conjunto de medidas tomadas en condiciones similares
#                data point, conjunto de valores tomados para cada variable
# * datos tabulares: conjunto de valores, asociado a cada variable y observaci??n
#                si los datos est??n limpios, cada valor tiene su propia celda
#                cada variable tiene su columna, y cada observaci??n su fila


#### VARIACI??N
## Variables categ??ricas: factor o vector de caracteres

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut))

diamonds %>%
  count(cut)  

## VARIABLE CONT??NUA: CONJUNTO INFINITO DE VALORES ORDENADOS (N??MEROS, FECHAS)
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

diamonds %>%
  count(cut_width(carat, 0.5))

ggplot(diamonds, mapping = aes(x = "kilates0, y = carat")) +
  geom_boxplot()

diamonds %>%
  ggplot()+
  geom_boxplot(mapping = aes(x = cut, y = carat, color = cut))

diamonds_filter <- diamonds %>%
  filter(carat<3)

ggplot(data = diamonds_filter) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.01)

ggplot(data = diamonds_filter,
       mapping = aes(x = carat, color = cut))+
  geom_freqpoly(binwidth = 0.01)


# * Cuales son los valores m??s comunes? Por qu???
# * Cuales son los valores m??s raros? Por qu??? Cumple con lo que esper??bamos?
# * Vemos alg??n patr??n caracter??stico o inusual? Podemos explicarlos?

# * Qu?? determina que los elementos de un cluster sean similares entre si?
# * Qu?? determina que clusters separados sean diferentes entre si?
# * Describir y explicar cada uno de los clusters.
# * Por qu?? alguna observaci??n puede ser clasificada en el cluster err??neo...

view(faithful)
?faithful

 
ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.2)

# OUTLIERS

ggplot(diamonds) +
  geom_histogram( mapping = aes(x=y), binwidth = 0.5) + 
coord_cartesian(ylim = c(0,100))  

diamonds %>%
  ggplot(mapping=aes(x = price)) +
  geom_histogram(binwidth = 100)

diamonds %>%
  filter(price > 18000) %>%
  ggplot(mapping = aes(x=y))+
  geom_histogram()

unusual_diamonds <- diamonds %>%
  filter(y<2 | y>30) %>%
  select(price, z,y,z) %>%
  arrange(y)
view(unusual_diamonds)

# ELIMINAR TODA LA FILA DE VAOLORES ATIPICOS
good_diamonds <- diamonds %>%
  filter(between(y, 2.5, 29.5))

# REEMPLAZAR VALORES ATIPICOS CON NAs
good_diamonds <- diamonds %>%
  mutate(y = ifelse(y<2  | y>30, NA, y))
?ifelse

ggplot(data = good_diamonds,
       mapping = aes(x = x, y = y))+
  geom_point(na.rm = T )

nycflights13::flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min/60
  ) %>%
  ggplot(mapping = aes(sched_dep_time)) + 
  geom_freqpoly(mapping = aes(color = cancelled), binwidth = 1/4)

#EJERCICIO 1 
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.5) +
  coord_cartesian(ylim = c(0,100))

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0,100))

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = z), binwidth = 0.5) +
  coord_cartesian(ylim = c(0,100))

#EJERCICIO 2
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 10) + 
  coord_cartesian(xlim = c(1400,1600))

#EJERCICIO 3
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.01)+
  coord_cartesian(xlim = c(0.95,1.05))

diamonds %>%
  filter(between(carat, 0.95, 1.05)) %>%
  count(cut_width(carat, 0.01))

#EJERCICIO 4
na_diamonds <- good_diamonds %>%
  mutate(cut2 = ifelse(cut == "fair", NA, cut))
  
  ggplot(na_diamonds)+
    geom_histogram(mapping = aes(x = y), binwidth = 1)

  ###COVARIACION
  
# Categoria vs Continua
  
  ggplot(data = diamonds, mapping = aes(x = price)) +
    geom_freqpoly(mapping = aes(color = cut), binwidth = 50)
  
  ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut))  

  ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
    geom_freqpoly(mapping = aes(color = cut), binwidth = 100)

  ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
    geom_boxplot()

  ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
    geom_boxplot()

  ggplot(data = mpg) +
    geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median),
                               y = hwy))

  ggplot(data = mpg) +
    geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median),
                               y = hwy)) +
    coord_flip()

  # CATEGORIA vs CATEGORIA
  ggplot(data = diamonds) +
           geom_count(mapping = aes(x = cut, y = color))

  diamonds %>%
    count(color, cut) %>%
    ggplot(mapping = aes(x = cut, y = color)) +
    geom_tile(mapping = aes(fill = n))

  #d3heatmap
  #heatmaply
  
  # Contínua vs Contínua
  ggplot(data = diamonds) +
    geom_point(mapping = aes(x = carat, y = price),
               alpha = 0.01)
  
  library(hexbin)
  ggplot(data = diamonds) +
    geom_bin2d(mapping = aes(x = carat, y = price))
  
  ggplot(data = diamonds) +
    geom_hex(mapping = aes(x = carat, y = price))
  
  diamonds %>%
    filter(carat < 3) %>%
    ggplot(mapping = aes(x = carat, y = price)) +
    geom_boxplot(mapping = aes(group = cut_number(carat, 10)))

  faithful %>%
    filter(eruptions > 3) %>%
    ggplot(aes(eruptions)) +
    geom_freqpoly(binwidth = 0.2)

  diamonds %>%   
    count(cut, clarity) %>%
    ggplot(aes(clarity, cut, fill = n)) +
    geom_tile()

  # Relaciones y los patrones
  # * ¿Coincidencias?
  # * ¿Relaciones que implica el patrón?
  # * ¿Fuerza de la relación?
  # * ¿Otras variables afectadas?
  # * ¿Subgrupos?
  
  ggplot( data = faithful) +
    geom_point(mapping = aes(x = eruptions, y = waiting))

  library(modelr)  
  mod <- lm(log(price) ~log (carat), data = diamonds)
  mod
  
  diamonds_pred <- diamonds %>%
    add_residuals(mod) %>%
    mutate(res = exp(resid))

  view(diamonds_pred)
  
  ggplot(data = diamonds_pred) +
    geom_point(mapping = aes(x = carat, y = resid))

  ggplot(data = diamonds_pred) +
    geom_boxplot(mapping = aes(x = cut,  y = resid ))

    #EJERCICIO 1
  nycflights13::flights %>%
    mutate(
      cancelled = is.na(dep_time),
      sched_hour = sched_dep_time %/% 100,
      sched_min = sched_dep_time %% 100,
      sched_dep_time = sched_hour + sched_min/60
    ) %>%
ggplot(mapping = aes(sched_dep_time)) +
    geom_freqpoly(mapping = aes(y =  ..density.., color = cancelled), bindwith = 1/4)

    #EJERCICIO 3
  install.packages("ggstance")
  library(ggstance)  
  
  ggplot(data = mpg, mapping = aes(x = hwy,
                                   y = reorder(class, hwy, FUN = median),
                                   fill = factor(class)
  )  
  ) +
    geom_boxplot()
  
  install.packages("lvplot")
  library(lvplot)  

  ggplot(data = diamonds,
         mapping = aes(x = cut, y = price)  
  ) + geom_lv()  

  ggplot(data = diamonds,
         mapping = aes(x = cut, y = price)) +
    geom_violin()

  ggplot(diamonds) +
    geom_histogram(mapping = aes(x = price), binwidth = 100)+
    facet_wrap(~cut, nrow = 3)
  
  ggplot(diamonds) +
    geom_freqpoly(mapping = aes(x = price, color = cut), binwidth = 100)

  #EJERCICIO 6
  install.packages("ggbeeswarm")
  library(ggbeeswarm)  

  ggplot(diamonds, aes(cut, price)) +
    geom_quasirandom()

  #EJERCICIO 7
diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = cut, y = color)) +
  geom_tile(mapping = aes(fill = log(n)))

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = log(n)))

#EJERCICIO 8
  nycflights13::flights %>%
    count(month, dest) %>%
    ggplot(mapping = aes(x = dest, y = month)) +
    geom_tile(mapping = aes(fill = n))

#EJERCICIO 9
ggplot(diamonds, aes(price, colour = cut_width(carat, 1.0))) +
  geom_freqpoly()

ggplot(diamonds, aes(price, colour = cut_number(carat, 5))) +
  geom_freqpoly()

ggplot(diamonds, aes(carat, colour = cut_width(price, 5000))) +
  geom_freqpoly()

#EJERCICIO 10
diamonds %>%
  filter(between(x,2,20)) %>%
  filter(between(y,2,20)) %>%
  filter(between(z,2,20)) %>%
  ggplot(aes(price, x*y*z)) +
  geom_bin2d()

#EJERCICIO 11
diamonds %>%
  ggplot(aes(price,colour = cut)) +
  geom_freqpoly() +
  facet_wrap(~cut_number(carat, 5), nrow = 2)

diamonds %>%
  ggplot(aes(price)) +
  geom_freqpoly() +
  facet_wrap(cut~cut_number(carat,5))

#EJERCICIO 12
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = x, y = y)) +
  coord_cartesian(xlim = c(4,12), ylim = c(4,12))

