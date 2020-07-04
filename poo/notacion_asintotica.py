# ley de la suma
def f(n):
    for i in range(n):
        print(i)

    for i in range(n):
        print(i)

# O(n) + O(n) = O(n+n) = O(2n) = O(n)
# ley de la suma II

def f(n):
    for i in range(n):
        print(i)

    for i in range(n*n):
        print(i)
# O(n) + O(n*n) = O(n+n^2) = O(n^2) 

# ley de la multiplicacion

def f(n):
    for i in range(n):
         for j in range(n):
             print(i, j)
# O(n) * O(n) = O(n * n) = O(n^2)

# Recursividad multiple
def fibonacci(n):
    if n == 0or n ==1:
        return1

    return fibonacci(n -1) + fibonacci(n -2)
# O(2**n)        