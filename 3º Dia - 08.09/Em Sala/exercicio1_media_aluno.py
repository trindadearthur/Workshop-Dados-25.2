print('Digite o nome e as nota do aluno saber a média dele:')
nome = (str(input('Digite o nome do aluno: ')))
nota1 = (float(input('Digite a primeira nota: ')))
nota2 = (float(input('Digite a segunda nota: ')))
nota3 = (float(input('Digite a terceira nota: ')))
media = (nota1 + nota2 + nota3) / 3
print('A média do aluno', nome, 'é:', media)

if media >= 7:
  print('O aluno foi aprovado por média!')
elif media >= 5:
  print('O aluno está em recuperação!')
else:
  print('O aluno foi reprovado!')