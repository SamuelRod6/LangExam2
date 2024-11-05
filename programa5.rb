# Programa de la pregunta 3.c

# FUNCIONES
# Creamos una clase que usa un iterador para ordenar una lista
class SortIterator
  def initialize(list)
    @list = list.dup
    @sorted_list = []
    sort_list
  end

  # Ordenamos la lista con el algoritmo de selección. Se busca el mínimo elemento
  # de la lista y se añade a la lista ordenada y se elimina de la lista original.
  def sort_list
    until @list.empty?
      min_index = @list.each_index.min_by { |i| @list[i] }
      @sorted_list << @list.delete_at(min_index)
    end
  end

  # Método para devolver el siguiente elemento de la lista ordenada
  def next
    if @sorted_list.empty?
      nil
    end 
    @sorted_list.shift
  end

  # Método para saber si hay más elementos en la lista ordenada
  def has_next?
    !@sorted_list.empty?
  end
end

# PRUEBA
list = [1, 3, 3, 2, 1]
iterator = SortIterator.new(list)

while iterator.has_next?
  puts iterator.next
end

