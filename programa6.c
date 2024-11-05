// Programa de la pregunta 5 (Reto poliglota)

#include <stdio.h>
#include <math.h>

// FUNCIONES
// Función para calcular el coeficiente binomial
int comb(int n, int k)
{
    if (k == 0 || k == n)
    {
        return 1;
    }
    if (k > n)
    {
        return 0;
    }
    int res = 1;
    for (int i = 1; i <= k; ++i)
    {
        res *= (n - i + 1);
        res /= i;
    }
    return res;
}

// Función de Narayana
double narayana(int n, int k)
{
    if (k == 0 || k > n)
    {
        return 0;
    }
    return (1.0 / n) * comb(n, k) * comb(n, k - 1);
}

// Función tribonacci con recursión de cola
int trib_tail(int n, int a, int b, int c)
{
    if (n == 0)
    {
        return a;
    }
    else if (n == 1)
    {
        return b;
    }
    else if (n == 2)
    {
        return c;
    }
    else
    {
        return trib_tail(n - 1, b, c, a + b + c);
    }
}

int trib(int n)
{
    return trib_tail(n, 0, 1, 2);
}

// Función maldad
int maldad(int n)
{
    return trib((int)floor(log2(narayana(n, (int)floor(log2(n))))) + 1);
}

// MAIN
int main()
{
    printf("%d\n", maldad(50));
    return 0;
}
