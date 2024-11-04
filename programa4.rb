# Programa de la pregunta 4

# VARIABLES
# Generamos los valores de alpha y beta, de la manera especificada.
X = 0
Y = 2
Z = 2

alpha = ((X + Y) % 5) + 3
beta = ((Y + Z) % 5) + 3

# FUNCIONES
# Definimos una función para calcular f(n) de manera recursiva.
def f_recursive(n, alpha, beta)
  if n < alpha * beta
    n
  else
    sum = 0
    (1..alpha).each do |i|
      sum += f_recursive(n - beta * i, alpha, beta)
    end
    sum
  end
end

# Definimos una función para calcular f(n) de manera recursiva de cola.
def f_tail_recursive(n, alpha, beta, acc = 0, i = 0)
  if n < alpha * beta
    n + acc
  else
    i =+ 1
    f_tail_recursive(n - beta * i, alpha, beta, acc + f_tail_recursive(n - beta * i, alpha, beta), i)
  end
end

# Definimos una función para calcular f(n) de manera iterativa.
def f_iterative(n, alpha, beta)
  if n < alpha * beta
    n
  end

  # Creamos un arreglo de tamaño n + 1, inicializado en 0.
  results = Array.new(n + 1, 0)

  # Esta parte correspone a la primera parte de la funcion para n < alpha * beta. Llenamos el arreglo con los valores de 0 a alpha * beta,
  # en su orden correspondiente.
  (0...alpha * beta).each do |i|
    results[i] = i
  end

  # Esta parte corresponde a la segunda parte de la función para n >= alpha * beta. Corresponde en agregar al acumulado los valores del arreglo
  # que caen en el rango de alpha * beta a n. Y aguardar el resultado en el arreglo. Después de esto, el resultado de f(n) se encuentra en
  # results[n].
  (alpha * beta..n).each do |i|
    sum = 0
    (1..alpha).each do |j|
      sum += results[i - beta * j]
    end
    results[i] = sum
  end
  results[n]
end

# PRUEBAS
# Para comparar los tiempos de ejecución de las tres funciones, utilizaremos la libreria Benchmark de Ruby.
require 'benchmark'

puts "Prueba 1 con n = 50"
n1 = 50
Benchmark.bm do |x|
  x.report("Recursiva:") { f_recursive(n1, alpha, beta) }
  x.report("Recursiva de cola:") { f_tail_recursive(n1, alpha, beta) }
  x.report("Iterativa:") { f_iterative(n1, alpha, beta) }
end

puts "\nPrueba 2 con n = 100"
n2 = 100
Benchmark.bm do |x|
  x.report("Recursiva:") { f_recursive(n2, alpha, beta) }
  x.report("Recursiva de cola:") { f_tail_recursive(n2, alpha, beta) }
  x.report("Iterativa:") { f_iterative(n2, alpha, beta) }
end

puts "\nPrueba 3 con n = 200"
n3 = 200
Benchmark.bm do |x|
  x.report("Recursiva:") { f_recursive(n3, alpha, beta) }
  x.report("Recursiva de cola:") { f_tail_recursive(n3, alpha, beta) }
  x.report("Iterativa:") { f_iterative(n3, alpha, beta) }
end