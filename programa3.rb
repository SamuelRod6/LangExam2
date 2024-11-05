
# Programa de la pregunta 2, expresiones aritméticas en notación prefija y postfija.

# FUNCIONES

# Definimos una función para evaluar expresiones en notación prefija.
def eval_prefix(expr)
  stack = []
  expr.split.reverse.each do |char|
    if char =~ /\d+/
      stack.push(char.to_i)
    else
      a = stack.pop
      b = stack.pop
      stack.push(a.send(char, b))
    end
  end
  stack.pop
end

# Definimos una función para evaluar expresiones en notación postfija.
def eval_postfix(expr)
  stack = []
  expr.split.each do |char|
    if char =~ /\d+/
      stack.push(char.to_i)
    else
      b = stack.pop
      a = stack.pop
      stack.push(a.send(char, b))
    end
  end
  stack.pop
end

# Definimos una función para convertir una expresión en notación prefija a infija.
def prefix_to_infix(expr)
  stack = []
  expr.split.reverse.each do |char|
    if char =~ /\d+/
      stack.push(char)
    else
      a = stack.pop
      b = stack.pop
      if char == '-' || char == '+'
        stack.push("(#{a} #{char} #{b})")
      else 
        stack.push("#{a} #{char} #{b}")
      end
    end
  end
  if stack.join.count('(') == stack.join.count(')') && stack.join[0] == '(' && stack.join[-1] == ')'
    stack.join[1..-2]
  else
    stack.pop
  end
end

# Definimos una función para convertir una expresión en notación postfija a infija.
def postfix_to_infix(expr)
  stack = []
  expr.split.each do |char|
    if char =~ /\d+/
      stack.push(char)
    else
      b = stack.pop
      a = stack.pop
      if char == '-' || char == '+'
        stack.push("(#{a} #{char} #{b})")
      else 
        stack.push("#{a} #{char} #{b}")
      end
    end
  end
  if stack.join.count('(') == stack.join.count(')') && stack.join[0] == '(' && stack.join[-1] == ')'
    stack.join[1..-2]
  else
    stack.pop
  end
end

# MAIN

# Implementamos un programa que permita evaluar y mostrar expresiones aritméticas en notación prefija y postfija.
def main
  while true
    print "Ingrese un comando: "
    input = gets.chomp
    action, order, expr = input.split(' ', 3)

    case action
    when 'HELP'
      puts "Formas de uso:"
      puts "EVAL <order> <expr> - Evaluar una expresión aritmética."
      puts "MOSTRAR <order> <expr> - Mostrar una expresión aritmética."
      puts "Donde <order> es PRE para prefija y POST para postfija."
      puts "Donde <expr> es la expresión aritmética. Ejemplo: - - + 3 1 2."
      puts "SALIR - Salir del programa."
    when 'EVAL'
      result = order == 'PRE' ? eval_prefix(expr) : eval_postfix(expr)
      puts result
    when 'MOSTRAR'
      result = order == 'PRE' ? prefix_to_infix(expr) : postfix_to_infix(expr)
      puts result
    when 'SALIR'
      break
    else
      puts "Comando incorrecto (escriba HELP para ver formas de uso)."
    end
  end
end

main

# PRUEBAS

# Usaremos mintest que es una biblioteca de pruebas en Ruby, para las pruebas unitarias.
# Descomentar el siguiente código para ejecutar las pruebas.

# require 'minitest/autorun'
# class AritExprTest < Minitest::Test
#   def test_eval_prefix
#     assert_equal 42, eval_prefix('+ * + 3 4 5 7')
#     assert_equal 3, eval_prefix('+ 1 2')
#     assert_equal 2, eval_prefix('- * 2 3 4')
#     assert_equal 5, eval_prefix('/ + 10 5 3')
#     assert_equal 21, eval_prefix('* + 1 2 + 3 4')
#     assert_equal 17, eval_prefix('+ / 10 2 * 3 4')
#   end
  
#   def test_eval_postfix
#     assert_equal 69, eval_postfix('8 3 - 8 4 4 + * +')
#     assert_equal 3, eval_postfix('1 2 +')
#     assert_equal 2, eval_postfix('2 3 * 4 -')
#     assert_equal 5, eval_postfix('10 5 + 3 /')
#     assert_equal 21, eval_postfix('1 2 + 3 4 + *')
#     assert_equal 17, eval_postfix('10 2 / 3 4 * +')
#   end
  
#   def test_prefix_to_infix
#     assert_equal '(3 + 4) * 5 + 7', prefix_to_infix('+ * + 3 4 5 7')
#     assert_equal '1 + 2', prefix_to_infix('+ 1 2')
#     assert_equal '2 * 3 - 4', prefix_to_infix('- * 2 3 4')
#     assert_equal '(10 + 5) / 3', prefix_to_infix('/ + 10 5 3')
#     assert_equal '(1 + 2) * (3 + 4)', prefix_to_infix('* + 1 2 + 3 4')
#     assert_equal '10 / 2 + 3 * 4', prefix_to_infix('+ / 10 2 * 3 4')
#   end
  
#   def test_postfix_to_infix
#     assert_equal '8 - 3 + 8 * (4 + 4)', postfix_to_infix('8 3 - 8 4 4 + * +')
#     assert_equal '1 + 2', postfix_to_infix('1 2 +')
#     assert_equal '2 * 3 - 4', postfix_to_infix('2 3 * 4 -')
#     assert_equal '(10 + 5) / 3', postfix_to_infix('10 5 + 3 /')
#     assert_equal '(1 + 2) * (3 + 4)', postfix_to_infix('1 2 + 3 4 + *')
#     assert_equal '10 / 2 + 3 * 4', postfix_to_infix('10 2 / 3 4 * +')
#   end
# end

