import random
import collections

PALOS = ["Espada","Corazon", "Rombo","Trebol"]
VALORES = ["As","2","3","4","5","6","7","8","9","10","J","Q","K"]

def crear_baraja():
    barajas = []
    for palo in PALOS:
        for valor in VALORES:
            barajas.append((palo,valor))
    return barajas


def obtener_mano(barajas, tamano_mano):
    mano = random.sample(barajas, tamano_mano)
    return mano

def main(tamano_mano, intentos):
    barajas = crear_baraja()
    
    manos = []
    for _ in range(intentos):
        mano  = obtener_mano(barajas, tamano_mano)
        manos.append(mano)
        
    pares = 0 
    for mano in manos:
        valores = []
        for cartas in mano:
            valores.append(cartas[1])
        counter = dict(collections.Counter(valores))
        
        for val in counter.values():
            if val == 2:
                pares += 1
                break
            
    probabilidad_par = pares / intentos
    print(f"La probabiliad de obtener un par en una mano de {tamano_mano } es {probabilidad_par}")
    
    

if __name__ == "__main__":
    tamano_mano = int(input("De cuantas barajas sera la mano: "))
    intentos = int(input("Cuantos intentos intentaremos: "))
    main(tamano_mano,intentos)