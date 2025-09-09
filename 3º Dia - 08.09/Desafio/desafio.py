import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# 1: Numpy - Criando os dados
dias = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo']
temperatura = np.random.randint(20, 36, size=7)

print('Segue os dados dos dias e temperatura')
print('Dias: ', dias)
print('Temperatura: ', temperatura)

# 2. Pandas - Calcular a média das temperaturas dos dias e estruturar
    # Criar o dataframe
df = pd.DataFrame({
    'Dia': dias,
    'Temperatura': temperatura
})

media_temperatura = df['Temperatura'].mean()

print("\n Tabela de Dados")
print(df)
print("f\nA média da temperatura da semana foi: {media_temperatura: .2f} °C")


# 3. Matplotlib - Criando o gráfico
plt.title('Temperatura Durante a Semana')

plt.xlabel('Dias da Semana')
plt.ylabel('Temperatura (°C)')

plt.plot['Dia'], df['Temperatura'], marker='o'

plt.grid(True)

plt.show()