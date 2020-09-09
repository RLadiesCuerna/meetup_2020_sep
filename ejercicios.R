###############################################################
# RLadies Cuernavaca
# 10 de Septiembre de 2020
# "Tour para principiantes por RStudio"
# Marisol Navarro Miranda
###############################################################
# Texto sin acentos
###############################################################
# El codigo y todos los materiales estan disponibles en GitHub:
# https://github.com/RLadiesCuerna/presentaciones_meetups

# Tambien se puede descargar mediante la siguiente linea:

#install.packages("usethis")
usethis::use_course('RLadiesCuerna/meetup_2020_sep')
###############################################################
# R y RStudio
###############################################################
# a) Proyecto de R
# b) Script de R
# c) Limpiar espacio de trabajo
# d) Ventanas y ocultar
# e) Shortcuts (Ctr+l,Alt+Shift+k,Alt+-,Command+enter)
# f) Help > Cheatsheets > RStudio IDE 
###############################################################
# Espacio de trabajo.

getwd() # imprime el directorio de trabajo
ls() # imprime una lista de los objetos del espacio de trabajo
help() # buscar ayuda sobre alguna funcion, argumento, etc.

# Windows usa rutas:
# (a)"c:\mydocuments\myfile.txt"
# Que no son bien interpretadas por R. Recomendacion:
# (b) c:\\my documents\\myfile.txt
# (c) c:/mydocuments/myfile.txt
setwd("c:/docs/mydir") # establece el directorio de trabajo

# Linux y mac:
setwd("/usr/sol/mydir") # establece el directorio de trabajo

history() # ultimas 25 lineas
history(max.show=Inf) # todos los comandos
savehistory(file="myfile") # default ".Rhistory"
loadhistory(file="myfile") # default ".Rhistory"
save.image() # guardar el espacio de trabajo

q() # salir de R
###############################################################
# Introduccion a R - Variables
###############################################################
# Variables - Ejercicio 1
###############################################################
# Algunos calculos basicos
# Suma: +
10+5
# Resta: -
10-5
# Multiplicacion: *
10*5
# Division: /
10/5
# Exponente: ^
10^5
# Modulo: %%
10%%3
###############################################################
# Variables - Ejercicio 2
###############################################################
# Asignacion de variables: permite almacenar valores u objetos
# para despues acceder a ellos mas facilmente.

mi_var <- 23
mi_var

ahorros_q1 <- 2200
ahorros_q1
ahorros_q2 <- 800
ahorros_q2

# Operaciones con variables
ahorros_sep <- ahorros_q1 + ahorros_q2
ahorros_sep

# Ambas variables son numericas. ¿Que pasa cuando una no lo es?
ahorros_q1 <- "ninguno"
ahorros_sep <- ahorros_q1 + ahorros_q2
######################## Presentacion #########################
# Tipos de datos en R
# Decimales como 4.5: numeric.
# Naturales como 4: integer. Integers tambien son numeric.
# Booleanos como TRUE o FALSE: logical.
# Texto (string/cadenas): character.
# << R es sensible a mayusculas y minusculas! >>
###############################################################
# Variables - Ejercicio 3
###############################################################
# ¿Como saber que tipo de dato es?

my_numeric <- 23
my_character <- "sol"
my_logical <- TRUE

class(my_numeric)
class(my_character)
class(my_logical)
###############################################################
# Introduccion a R - Vectores
###############################################################
# Vectores - Ejercicio 1
###############################################################
# Vector. Los vectores son arreglos de una dimension que pueden
# almacenar datos de tipo numeric, character y logical. En R,
# puedes crear un vector con la funcion c().

numeric_vector <- c(1, 2, 3)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)
###############################################################
# Vectores - Ejercicio 2
###############################################################
# Queremos comparar nuestro desempenio en dos tipos de juegos
# de cartas durante una semana completa.
# >> Conquian <<
# Se juega con una sola baraja española. Es ideal para jugar
# entre tres personas. Se reparten 8 cartas a cada quien y
# cada jugador debe intentar formar tercias (=#) o corridas.
# Gana quien logre tener abajo nueve o más cartas conformadas.
# >> Poker <<
# En este juego cada carta tiene un valor específico. Al iniciar
# cada ronda se reparten las cartas y el azar determina quién tiene
# la mejor combinación.

# Funcion para generar numeros aleatorios
sample(-20:40, 5, replace=F)

# Definimos los vectores
cartas_conquian <- c()
cartas_poker < c()

# Nombramos los elementos de un vector con la funcion names()
names(cartas_conquian) <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")
names(cartas_poker) <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")

cartas_conquian
cartas_poker

# Otra forma
dias_semana <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")
names(cartas_conquian) <- dias_semana
names(cartas_poker) <- dias_semana
###############################################################
# Vectores - Ejercicio 3
###############################################################
# Algunas preguntas que responder:

# 1) ¿Cuales son las ganancias/perdidas en ambos juegos por dia?

total_dias <- cartas_conquian + cartas_poker
total_dias

# 2) ¿Cuales son las ganancias/perdidas totales por semana en
# cada juego?

total_conquian <- sum(cartas_conquian)
total_conquian

total_poker <- sum(cartas_poker)
total_poker

# 3) ¿Al final de la semana hemos tenido ganancias/perdidas
# jugando cartas?

total_juegos <- total_conquian + total_poker
total_juegos
###############################################################
# Vectores - Ejercicio 4
###############################################################
# Para tomar una seccion de un vector, se utilizan los corchetes
# []. R comienza en 1 a diferencia de otros lenguajes de
# programacion que comienzan en 0.

conquian_lunes <- cartas_conquian[1]
conquian_lunes

conquian_lunvie <- cartas_conquian[c(1, 5)]
conquian_lunvie

conquian_lunamie1 <- cartas_conquian[c(1,2,3)]
conquian_lunamie1

conquian_lunamie2 <- cartas_conquian[1:3]
conquian_lunamie2

conquian_lunamie3 <- cartas_conquian[c("Lunes","Martes","Miércoles")]
conquian_lunamie3
######################## Presentacion #########################
# Comparaciones entre vectores.
# < menor que
# > mayor que
# <= menor o igual que
# >= mayor o igual que
# == igual que
# != diferente de
###############################################################
# Vectores - Ejercicio 5
###############################################################
# Dos ultimas preguntas:
# 4) ¿Que dias tuvimos ganancias en conquian?

seleccion_conquian <- cartas_conquian > 0
seleccion_conquian

# 3) ¿Cuanto ganamos en esos dias?
# Seleccionar los elementos que tienen valor TRUE unicamente.

dias_ganancias <- cartas_conquian[seleccion_conquian]
dias_ganancias
###############################################################
# Introduccion a R - Matrices
###############################################################
# Matrices - Ejercicio 1
###############################################################
# En R una matriz es un arreglo de elementos del mismo tipo
# de datos (numeric, character y logical) arreglado en dos
# dimensiones, es decir, en una cierta cantidad de filas (rows)
# y columnas (columns). Se pueden construir matrices con la
# funcion matrix().
######################## Presentacion #########################
# Ej. matrix(1:9, byrow = TRUE, nrow = 3)
# (1) El primer argumento es la coleccion de elementos que
# R pondra en las filas y columnas de la matriz.
# (2) El argumento byrow indica que la matriz se llenara por
# filas. Si se quiere llenar por columnas => byrow = FALSE.
# (3) El tercer argumento nrow indica que la matriz tendrá
# tres filas.

matriz1 <- matrix(1:9, byrow = TRUE, nrow=3)
matriz1

matriz2 <- matrix(1:9, byrow = FALSE, nrow=3)
matriz2
###############################################################
# Matrices - Ejercicio 2
###############################################################
# Queremos analizar las ganancias (en millones) de las películas
# de Harry Potter. Los datos los podemos obtener del sig. link:
# https://www.the-numbers.com/movies/franchises

piedra_filosofal <- c(317.871, 972.283)
camara_secreta <- c(262.233, 878.746)
prisionero_azkaban <- c(249.757, 793.624)
caliz_fuego <- c(290.201, 896.681)
orden_fenix <- c(292, 942.641)
principe_mestizo <- c(302, 937.764)
reliquias_muerte1 <- c(296, 959.963)
reliquias_muerte2 <- c(381,1340.955)

# Construir la matriz

peliculas <- c(piedra_filosofal, camara_secreta, prisionero_azkaban, caliz_fuego, orden_fenix, principe_mestizo, reliquias_muerte1, reliquias_muerte2)
peliculas
harry_potter <- matrix(peliculas, nrow = 8, byrow = TRUE)
harry_potter

# Conocer las dimensiones de la matriz
dim(harry_potter)
###############################################################
# Matrices - Ejercicio 3
###############################################################
# Agragar nombres a las filas y columnas.

# row.names(my_matrix) <- row_names_vector
# colnames(my_matrix) <- col_names_vector

region <- c("taquilla_UK", "taquilla_NUK")
titulos <- (c("La piedra filosofal", "La cámara secreta", "El prisionero de Azkaban", "El cáliz de fuego", "La orden del fénix", "El príncipe mestizo", "Reliquias de la muerte - P1", "Reliquias de la muerte - P2"))

colnames(harry_potter) <- region
row.names(harry_potter) <- titulos

harry_potter
###############################################################
# Matrices - Ejercicio 4
###############################################################
# Queremos saber cuales fueron las ganancias mundiales por
# pelicula.
# Suma de filas en una matriz. Usando la funcion rowSums().
# rowSums(my_matrix). Tambien existe colSums().

taquilla_mundial <- rowSums(harry_potter)
taquilla_mundial

# Queremos agregar el dato anterior a la matriz existente.
# Se pueden agregar mas columnas a la matriz con la funcion
# cbind(), que une vectores o matrices.
# matrix <- cbind(matrix1, matrix2, vector1 ...)

harry_potter_ext <- cbind(harry_potter, taquilla_mundial)
harry_potter_ext
###############################################################
# Matrices - Ejercicio 5
###############################################################
# Pero... hay mas peliculas del mundo de HR por J.K Rowling.
# Se pueden agregar mas filas a la matriz con la funcion
# rbind(), que une vectores o matrices.

animales_fantasticos <- c(234, 813.474)
crimenes_grindelwald <- c(159.555, 652.220)

harry_potter2 <- c(animales_fantasticos, crimenes_grindelwald)
harry_potter2 <- matrix(harry_potter2, nrow = 2, byrow = TRUE)

harry_potter_comp <- rbind(harry_potter, harry_potter2)
harry_potter_comp

# Agregar peliculas nuevas

nuevas_pelis <- c("Animales fantasticos", "Crimenes de Grindelwald")
nuevas_pelis

titulos
titulos <- append(titulos,nuevas_pelis)

row.names(harry_potter_comp) <- titulos
harry_potter_comp

# Finalmente, calculemos el total de las ganancias del mundo de
# HP hasta el momento.

ganancias_harry_potter <- colSums(harry_potter_comp)
ganancias_harry_potter
######################## Presentacion #########################
# Seleccion de elementos en una matriz.
# Se hace uso de corchetes [] para seleccionar uno o muchos
# elementos de la matriz. Las matrices son de dos dimensiones,
# por los tanto se debe de usar una coma para separar las filas
# de las columnas.
# Ejemplo1: my_matrix[1,2]
# Ejemplo2: my_matrix[1:3,2:4]
# Ejemplo3: my_matrix[,1]
# Ejemplo4: my_matrix[1,]
###############################################################
# Matrices - Ejercicio 6
###############################################################
# Seleccionar unicamente las ganancias en UK.

harry_potter_comp
ganancias_uk <- harry_potter_comp[1:10,1]
ganancias_uk

# Promedio de ganancias UK
mean(ganancias_uk)
###############################################################
# Matrices - Ejercicio 7
###############################################################
# Tambien podemos hacer operaciones entre matrices.
#  = +, -, /, *, etc.
# Si cada boleto, costo 5 dolares, podemos averiguar cuantas
# millones de personas asistieron a ver las peliculas.

harry_potter_comp
espectadores <- harry_potter_comp/5
espectadores

espectadores_uk <- espectadores[1:10,1]
mean(espectadores_uk)
###############################################################
# Introduccion a R - Factores
###############################################################
# Factores - Ejercicio 1
######################## Presentacion #########################
# El termino factor se refiere a un tipo de dato estadistico
# usado para almacenar variables categoricas. Es importante
# ya que los modelos estadisticos de R necesitan conocer estas
# diferencias.
# Para crear factores en R, se utiliza la funcion factor(),

# Definimos una variable categorica nominal de 5 elementos.
celula <- c("Eucarionte", "Procarionte", "Procarionte", "Eucarionte", "Procarionte")
f_celula <- factor(celula)
f_celula

# Definimos una variable categorica ordinal de 5 elementos.

temperatura <- c("Alta", "Baja", "Alta","Baja", "Media")
f_temperatura <- factor(temperatura, order = TRUE, levels = c("Baja", "Media", "Alta"))
f_temperatura
###############################################################
# Factores - Ejercicio 2
###############################################################
# Imaginemos que tenemos los siguientes datos de un fragmento de
# una secuencia genetica. Pero para que sea mas informativa,
# necesitas saber a que base nitrogenada pertenece.
# Para cambiar los nombres a los factores, se utiliza la Funcion
# function levels(). levels(factor_vector) <- c("name1", ...).

fragmento <- c("A","T","C","G","G","C","A","T","A","C","G","A","T","C","C")
fragmento
f_fragmento <- factor(fragmento)
f_fragmento

# Revisar cuantos niveles tiene el factor y en que orden
levels(f_fragmento)

# Definir un vector con los nombres completos de las bases nitrogenadas,
# en el orden en el que aparecen anteriormente.

levels(f_fragmento) <- c("Adenina","Citosina", "Guanina", "Timina")
f_fragmento
###############################################################
# Factores - Ejercicio 3
###############################################################
# La funcion summary() da un breve resumen del contenido de una
# variable ya sea vector o factor. Veamos las diferencias.

summary(fragmento)

summary(f_fragmento)
###############################################################
# Factores - Ejercicio 4
###############################################################
# ¿Que pasa cuando intentamos realizar comparaciones entre los
# elementos de un factor?

adenina <- f_fragmento[1]
citosina <- f_fragmento[2]

adenina > citosina
###############################################################
# Factores - Ejercicio 5
###############################################################
# Ahora trabajaremos con una variable categorica ordinal.
# Para definir este tipo de variables, se definen de la siguiente
# manera:
# factor(vector, ordered = TRUE, levels = c("lev1", ...))
# Deseamos evaluar la velocidad de 5 personas.

velocidad <- c("media", "lenta", "lenta", "media", "rapida")
f_velocidad <- factor(velocidad, ordered = TRUE, levels = c("lenta", "media", "rapida"))
f_velocidad

summary(f_velocidad)

persona1 <- f_velocidad[2]
persona1

persona5 <- f_velocidad[5]
persona5

persona1 > persona5
###############################################################
# Introduccion a R - Data frames
###############################################################
# Data frames - Ejercicio 1
###############################################################
# Un data frame, puede contener elementos con diferentes tipos
# de datos (numeric, character, logical). En un data frame las
# variables se arreglan en las columnas y las observaciones en
# las filas.
######################## Presentacion #########################
# Utilizar los conjuntos de datos pre cargados en R.
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
# >> Iris <<
# medidas en centimetros de las variables longitud y ancho del
# sepalo y largo y ancho del petalo, respectivamente, para 50
# flores de cada una de las 3 especies de iris. Las especies son
# Iris setosa, versicolor y virginica.
# The data was collected by Anderson, Edgar (1935). The irises
# of the Gaspe Peninsula, Bulletin of the American Iris Society,
# 59, 2–5.
###############################################################
# Imprime iris para ver que pasa.
iris

# Utiliza las funciones head() y tail()
head(iris)
tail(iris)

# Utiliza la funcion de estructura str(). En un data frame,
# esta funcion da la infomacion de (1) total number of
# observations (2) total number of variables, (3) full list of
# the variables names, (4) data type of each variable,
# (5) first observations.

str(iris)
###############################################################
# Data frames - Ejercicio 2
###############################################################
# Creando un Data frame del Sistema Solar con datos de Wiki :)
# (1) Nombre del planeta
# (2) Tipo de planeta: Terrestre o Gigante gaseoso
# (3) Diametro: relativo al diametro de la Tierra
# (4) Rotacion a través del Sol: relativo al de la Tierra
# (5) Anillos: TRUE/FALSE

# Crear vectores

nombre <- c("Mercurio", "Venus", "Tierra", "Marte", "Jupiter", "Saturno", "Urano", "Neptuno")
tipo <- c("Terrestre", "Terrestre", "Terrestre", "Terrestre", "Gigante gaseoso", "Gigante gaseoso", "Gigante gaseoso", "Gigante gaseoso")
diametro <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotacion <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
anillos <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Crear Data frame con la funcion data.frame()

planetas_df <- data.frame(nombre, tipo, diametro, rotacion, anillos)
planetas_df

str(planetas_df)
###############################################################
# Data frames - Ejercicio 3
###############################################################
# También podemos seleccionar secciones del Data frame usando
# corchetes [].
# Imprime el diametro de Mercurio (fila 1, columna 3)

planetas_df
planetas_df[1,3]

# Imprime todos los datos de Marte (cuarta fila)
planetas_df[4,]

# Otra forma de hacer secciones con el nombre de las variables.
# Selecciona los primeros tres elementos de la columna "tipo"

planetas_df[1:3,2]

planetas_df[1:3,"tipo"]

# Formas de seleccionar diametros de planetas.

planetas_df[,3]
planetas_df[,"diametro"]
planetas_df$diametro
###############################################################
# Data frames - Ejercicio 4
###############################################################
# ¿Recuerdas cuales son los planetas que tienen anillos?
# Selecciona la variable anillos en un vector.

anillos <- planetas_df$anillos
anillos

# Aja... pero ¿cuáles son exactamente? y ¿que otra info hay de
# ellos?

planetas_df[anillos, c("nombre","tipo","diametro","rotacion","anillos")]

# Formas de negar anillos

planetas_df[!anillos, c("nombre","tipo","diametro","rotacion","anillos")]
planetas_df[anillos == FALSE, c("nombre","tipo","diametro","rotacion","anillos")]

# Esto tambien se puede hacer de otra manera con la funcion subset()

subset(planetas_df, subset = anillos)
###############################################################
# Data frames - Ejercicio 5
###############################################################
# Operaciones con Data frames.
# Queremos hacer una seccion de todos los planetas con un
# diametro < 1

subset(planetas_df, subset = diametro < 1)

# Ordenar con la funcion order()

a <- c(100, 10, 1000)
order(a)

# Pero tambien se puede usar el output de order(a) para
# reordenar la variable a.

a[order(a)]

# Finalmente queremos reordenar del data frame de tal manera que
# comience con el planeta mas pequenio y termine con el mas
# grande (diametro)

posiciones <- order(planetas_df$diametro)
posiciones

# Utilizar posiciones para reordenar planetas_df
planetas_df[posiciones,]
###############################################################
# Introduccion a R - Listas
###############################################################
# Listas - Ejercicio 1
###############################################################
# Una lista permite almacenar una variedad de objetos de manera
# ordenada. Pueden ser matrices, vectores, data frames e incluso
# otras listas.
# Para crear una lista se utiliza la funcion list().
# my_list <- list(comp1, comp2 ...)

# Crear una lista

mi_vector <- 1:10
mi_matriz <- matrix(1:9, ncol = 3)
df_iris <- iris[1:10,]

mi_lista <- list(mi_vector, mi_matriz, df_iris)

# Nombramos los elementos de la lista

mi_lista <- list(vec = mi_vector, mat = mi_matriz, iris = df_iris)

# Otra forma
mi_lista <- list(mi_vector, mi_matriz, df_iris)
names(mi_lista) <- c("vec", "mat", "iris")
mi_lista
###############################################################
# Listas - Ejercicio 2
###############################################################
# Hacer una lista de mis peliculas favoritas
# Definir vectores

pel <- "El Resplandor"
act <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson")

# Construir resenias

puntaje <- c(4.5, 4.0, 5.0)
fuente <- c("IMDb1", "IMDb2", "IMDb3")
comentarios <- c("La mejor pelicula de terror que he visto", "Una brillante pelicula de Stanley Kubrick", "Una pieza maestra de terror psicologico")

res <- data.frame(puntaje, fuente, comentarios)
res

lista_resplandor <- list(pelicula = pel, actores = act, resenias = res)
lista_resplandor
###############################################################
# Listas - Ejercicio 3
###############################################################
# Para seleccionar los elementos de una lista, tambien se
# utilizan dobles corchetes [[]].

lista_resplandor[[1]]

# Queremos acceder a la seccion de resenias

lista_resplandor[["resenias"]]
lista_resplandor$resenias

# Queremos saber si el primer actor en la lista es Jack Nicholson.
lista_resplandor[[2]][1]

# Queremos saber quienes fueron los actores de la pelicula

lista_resplandor[[2]]
lista_resplandor[["actores"]]
lista_resplandor$actores
######################## Presentacion #########################
# Vectores (arreglos de una dimension): pueden tener valores
# numeric, character o logical. Todos los elementos en una
# lista tienen el mismo tipo de dato.

# Matrices (arreglos de dos dimensiones): pueden tener valores
# numeric, character o logical. Todos los elementos en una
# matriz tienen el mismo tipo de dato.

# Data frames (objetos de dos dimensiones): pueden tener valores
# numeric, character o logical. Dentro de la columna, todos
# los elementos tienen el mismo tipo de dato. Entre las
# columnas pueden tener distintos tipos de datos.

# Listas (objetos de una y dos dimensiones): pueden tener valores
# numeric, character o logical. Pueden tener distintos tipos de
# objetos y arreglos.
###############################################################
# Mi primer grafico
###############################################################
iris
str(iris)
plot(iris)

plot(iris$Sepal.Width, iris$Sepal.Length)

hist(iris$Sepal.Width, main="Histograma ancho de sépalo"
     , xlab="Ancho de sépalo"
     , ylab="Frecuencia"
     , col = c("mediumorchid","mediumorchid1",
               "mediumorchid2","mediumorchid3",
               "mediumorchid4"))
# Exportar grafico
###############################################################
# ¿Preguntas?
###############################################################
#install.packages("cowsay")

library(cowsay)

say("¿Preguntas?")

sort(names(animals))

say("¿Preguntas?", "stretchycat")

# Mas info sobre cowsay
# https://cran.r-project.org/web/packages/cowsay/vignettes/cowsay_tutorial.html

# Otros paquetes: https://rstudio.com/products/rpackages/
