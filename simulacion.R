library(FRACTION)


numeros_enteros <- function(max_entero = 1000){
  # Generamos una lista de posibles numeros enteros
  posibles_numeros <- sample(1:max_entero)

  # Extraemos aleatoriamente 2 elementos de esta lista
  a <- sample(posibles_numeros, 1, replace = TRUE)
  b <- sample(posibles_numeros, 1, replace = TRUE)
  return(list(a = a, b = b))
}


son_coprimos <- function(a, b){
  maximo_comun_divisor <- gcd(a, b)
  return(maximo_comun_divisor == 1)
}


estima_probabilidad <- function(max_entero = 1000, num_iteraciones = 1000){
  exito <- 0
  for(iter in seq(num_iteraciones)){
    numeros <- numeros_enteros(max_entero = max_entero)
    a <- numeros$a
    b <- numeros$b
    if(son_coprimos(a = a, b = b)){
      exito <- exito + 1
    }
  }
  return(exito / num_iteraciones)
}


iteraciones <- 1:1000
probabilidades <- c()

for(num_iter in iteraciones){
  prob <- estima_probabilidad(num_iteraciones = num_iter)
  probabilidades <- c(probabilidades, prob)
}


plot(probabilidades, type = 'l')
abline(h = 6/pi^2, col = 'red')
