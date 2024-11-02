# Programa 2 de la pregunta 1

# Definimos el método merge_sort que implementa el algoritmo de merge sort.
# Este algoritmo es recursivo y divide el array en mitades hasta que cada subarray tiene un solo elemento.
# Para lo cual, tenemos por defecto el caso base que es cuando el array tiene un solo elemento.
# Sino se divide el array en dos subarrays y se llama recursivamente al método merge_sort.
# Luego, combina los subarrays ordenados usando el método merge.
def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  merge(left, right)
end

# Definimos el método merge que combina dos arrays ordenados en uno solo.
# Este método utiliza dos punteros (i y j) para recorrer los arrays left y right, respectivamente.
# Compara los elementos de ambos arrays y añade el menor al array resultante.
# Continúa hasta que todos los elementos de ambos arrays han sido procesados.
def merge(left, right)
  result = []
  i = 0
  j = 0

  while i < left.length && j < right.length
    if left[i] <= right[j]
      result << left[i]
      i += 1
    else
      result << right[j]
      j += 1
    end
  end

  # Añade los elementos restantes de left y right al array resultante.
  result + left[i..-1] + right[j..-1]
end

# Ejemplo de uso
array = [128, 30, 52, 5, 9, 96, 17]
puts merge_sort(array).inspect # Imprime [5, 9, 17, 30, 52, 96, 128]
