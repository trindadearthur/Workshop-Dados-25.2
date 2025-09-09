import pandas as pd

def analisar_churn(caminho_arquivo: str) -> dict | None:
    """
    Analisa os dados de churn de clientes a partir de um arquivo CSV.

    Esta função lê um arquivo CSV, calcula o número total de clientes,
    o número de clientes que cancelaram e permaneceram, e a taxa de churn
    percentual.

    Args:
        caminho_arquivo (str): O caminho para o arquivo CSV contendo os dados.

    Returns:
        dict: Um dicionário com os resultados da análise ('total_clientes',
              'clientes_churn', 'clientes_permaneceram', 'taxa_churn_percentual').
        None: Retorna None se o arquivo não for encontrado ou se a coluna
              'Churn' estiver ausente.
    """
    try:
        # Tenta ler o arquivo CSV para um DataFrame do pandas
        df = pd.read_csv(caminho_arquivo)
    except FileNotFoundError:
        # Captura o erro se o arquivo não existir e informa o usuário
        print(f"Erro: O arquivo '{caminho_arquivo}' não foi encontrado.")
        return None

    # Verifica se a coluna 'Churn' existe no DataFrame
    if 'Churn' not in df.columns:
        print("Erro: A coluna 'Churn' é necessária para a análise, mas não foi encontrada no arquivo.")
        return None

    # --- Início dos Cálculos ---

    # 1. Calcula o número total de clientes (total de linhas no DataFrame)
    total_clientes = len(df)

    # Evita divisão por zero se o arquivo estiver vazio
    if total_clientes == 0:
        print("Aviso: O arquivo de dados está vazio. Não é possível calcular a taxa de churn.")
        # Retorna valores zerados
        return {
            'total_clientes': 0,
            'clientes_churn': 0,
            'clientes_permaneceram': 0,
            'taxa_churn_percentual': 0.0
        }

    # 2. Calcula o número de clientes que cancelaram ('Churn' == 'Yes')
    clientes_churn = df['Churn'].value_counts().get('Yes', 0)

    # 3. Calcula o número de clientes que permaneceram ('Churn' == 'No')
    clientes_permaneceram = df['Churn'].value_counts().get('No', 0)
    
    # 4. Calcula a taxa de churn em porcentagem
    taxa_churn_percentual = (clientes_churn / total_clientes) * 100

    # --- Fim dos Cálculos ---

    # Monta o dicionário de resultados
    resultados = {
        'total_clientes': int(total_clientes),
        'clientes_churn': int(clientes_churn),
        'clientes_permaneceram': int(clientes_permaneceram),
        'taxa_churn_percentual': taxa_churn_percentual
    }

    return resultados

# --- Exemplo de Uso da Função ---

if __name__ == "__main__":
    # Define o nome do arquivo a ser analisado
    # Para testar, crie um arquivo 'churn_data.csv' ou altere este nome.
    arquivo_csv = 'churn_data.csv'

    # Chama a função principal para realizar a análise
    dados_churn = analisar_churn(arquivo_csv)

    # Verifica se a função retornou um dicionário válido antes de imprimir
    if dados_churn is not None:
        print("\n--- Análise da Taxa de Churn de Clientes ---")
        print(f"Total de Clientes Analisados: {dados_churn['total_clientes']}")
        print(f"Clientes que Cancelaram (Churn): {dados_churn['clientes_churn']}")
        print(f"Clientes que Permaneceram: {dados_churn['clientes_permaneceram']}")
        print("---------------------------------------------")
        # Formata a taxa de churn para exibir com duas casas decimais
        print(f"Taxa de Churn: {dados_churn['taxa_churn_percentual']:.2f}%")
        print("---------------------------------------------")