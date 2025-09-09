print('Digite um número para saber sua tabuada até o número 10')
numero = (int(input('Digite um número: ')))
for i in range(1, 11):
  print(numero, 'x', i, '=', numero * i)