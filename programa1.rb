# Programa 1 de la pregunta 1

# FUNCIONES

# Definimos primero la funcion f(n) que nos dice como calcular el siguiente número
def f(n)
  if n.even?
    n / 2
  else
    3 * n + 1
  end
end

# Ahora definimos la funcion count(n) que nos dice cuantas aplicaciones de f(n) se necesitan para llegar a 1
def count(n)
  dist = 0
  while n != 1
    n = f(n)
    dist += 1
  end
  dist
end

# PRUEBAS

puts count(42)
puts count(5)
puts count(1)
puts count(128)