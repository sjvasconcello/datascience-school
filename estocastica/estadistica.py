import random
import math


def media(x):
    return sum(x) / len(x)

def varianza(X):
    mu = media(X)
    
    acumulador = 0
    for x in X:
        acumulador += (x-mu)**2
        
    return acumulador / len(X)

def desviacion_estandar(X):
    return math.sqrt(varianza(X))