import pandas as pd

# criando um dataframe
data = {'Nome': ['João', 'Maria', 'Pedro', 'Ana', 'Lucas'],
        'Idade': [25, 30, 35, 20, 28],
        'Salário': [5000, 6000, 7000, 4000, 5500]}
df = pd.DataFrame(data)

# exibindo o dataframe
df = pd.DataFrame(data)


df['Cidade'] = ['São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Porto Alegre', 'Curitiba']
print("\n Com 'Cidade':\n", df.head())