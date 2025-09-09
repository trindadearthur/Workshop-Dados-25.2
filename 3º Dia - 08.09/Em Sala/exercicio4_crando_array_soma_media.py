import numpy as np

# criando o primeiro array
array1 = np.array([5, 10, 15, 20, 25])

# criando o segundo array
array2 = np.array([5, 10, 15, 20, 25])

# somando os dois array
soma = array1 + array2

# fazendo media dos dois array
media = np.mean([array1, array2])

# fazendo raiz quadrada da soma das variaveis
raiz = np.sqrt(soma)

# exibindo o resultado
print('Soma dos arrays', soma)
print('Média dos arrays', media)
print('Raiz quadrada da soma dos arrays', raiz)