import numpy as np
import random
import tqdm
import math
import matplotlib.pyplot as plt
from typing import Tuple


def numeros_enteros(max_entero: int = 1000) -> Tuple[int, int]:
  ''' Genera dos números enteros positivos aleatorios '''
  lista_numeros = range(1, max_entero+1)
  a = random.choice(lista_numeros)
  b = random.choice(lista_numeros)
  return a, b


def son_coprimos(a: int, b: int) -> bool:
  ''' Verifica si dos números, a y b, son coprimos '''
  mcd = math.gcd(a, b)
  return mcd == 1


def estima_probabilidad(max_entero: int = 1000, num_iteraciones: int = 10000) -> float:
  ''' estima la probabilidad de que dos números sean coprimos '''
  exitos = 0
  for _ in range(num_iteraciones):
    a, b = numeros_enteros(max_entero=max_entero)
    if son_coprimos(a=a, b=b):
      exitos += 1
  return exitos / num_iteraciones


iteraciones = range(1, 10000)
probabilidades = [estima_probabilidad(num_iteraciones=i) for i in tqdm.tqdm(iteraciones)]

plt.plot(iteraciones, probabilidades)
plt.axhline(y=6/np.pi**2, color='r', linestyle='-')
