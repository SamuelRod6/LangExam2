# Programa de la pregunta 5

"""
No me dio tiempo de implementar y ver como podía hacer para que el código pudiera compilarse/interpretarse  
en otros lenguajes :(, pero logré que la función maldad funcionara en el tiempo requerido cosa que no pude hacer
en la primera tarea y corre por lo menos en Python :).
"""

from math import floor, log2, comb

# FUNCIONES
def narayana(n, k):
    if k == 0 or k > n:
        return 0
    return (1 / n) * comb(n, k) * comb(n, k - 1)

def trib(n):
    def trib_tail(n, a, b, c):
        if n == 0:
            return a
        elif n == 1:
            return b
        elif n == 2:
            return c
        else:
            return trib_tail(n - 1, b, c, a + b + c)
    return trib_tail(n, 0, 1, 2)
    
def maldad(n):
    return trib(floor(log2(narayana(n, floor(log2(n))))) + 1)

#PRUEBA
print(maldad(50))