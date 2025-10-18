# Projeto Python-SQL para Análise e Exploração de Dados de Vendas

## Descrição do Projeto

Este projeto tem como objetivo realizar a análise exploratória e tratamento inicial dos dados de vendas de uma empresa fictícia. Utilizando Python para pré-processamento dos dados e SQL Server para armazenamento e consultas, o projeto fornece insights importantes sobre o desempenho dos produtos e categorias ao longo do tempo.

## Funcionalidades Principais

### 1. Tratamento Inicial dos Dados

* **Importação dos Dados:** Leitura do arquivo CSV utilizando Pandas.
* **Tratamento de Valores Ausentes:** Substituição de valores não disponíveis (`'Not Available'`, `'unknown'`) por valores nulos (`NaN`).
* **Padronização dos Nomes das Colunas:** Renomeação das colunas para letras minúsculas e substituição de espaços por underline.

### 2. Derivação de Novas Colunas

* **Cálculo do Desconto:** Criação da coluna `discount`, que calcula o valor do desconto aplicado.
* **Preço de Venda:** Criação da coluna `sale_price`, resultado da subtração do desconto do preço listado.
* **Lucro:** Criação da coluna `profit`, que calcula o lucro subtraindo o preço de custo do preço de venda.

### 3. Conversão e Organização dos Dados

* **Tipos de Dados:** Conversão da coluna `order_date` de texto para formato datetime.
* **Redução de Colunas:** Remoção de colunas não necessárias para a análise (`cost_price`, `list_price`, `discount_percent`).

### 4. Integração com SQL Server

* **Criação da Estrutura do Banco de Dados:** Definição das tabelas no SQL Server com tipos de dados apropriados.
* **Exportação de Dados:** Uso do SQLAlchemy para inserir dados do DataFrame do Pandas na tabela SQL Server.

### 5. Análise Exploratória com SQL

O projeto contempla consultas analíticas no SQL Server para identificar:

* Os **top 10 produtos que geraram mais receita**.
* Os **top 5 produtos mais vendidos por região**.
* Uma **comparação mês a mês das vendas entre os anos 2022 e 2023**.
* O mês com as **maiores vendas por categoria**.
* A **subcategoria com maior crescimento em vendas** de 2022 para 2023, considerando a variação percentual.

## Tecnologias Utilizadas

* **Python:** Pandas, SQLAlchemy
* **SQL Server:** Criação de tabelas, consultas analíticas complexas

## Benefícios

Este projeto permite uma visualização clara e detalhada sobre o desempenho das vendas da empresa, facilitando a tomada de decisões estratégicas baseadas em dados concretos.
