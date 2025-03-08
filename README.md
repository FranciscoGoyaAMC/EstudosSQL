# Desafio de Banco de Dados 📊

Este repositório contém a implementação do desafio final da cadeira de **Fundamentos de Bancos de Dados** do **curso de Análise e Desenvolvimento de Sistemas da UNISINOS**. O objetivo foi criar um banco de dados completo e funcional, desde a modelagem conceitual até a implementação prática no SQL.

## 🔍 Descrição do Desafio
O desafio consistiu em:
- Criar um **Diagrama Entidade-Relacionamento (DER)** com as cardinalidades corretas.
- Construir a **modelagem lógica** baseada no modelo conceitual.
- Aplicar **normalização** para garantir a integridade dos dados.
- Desenvolver o **script SQL** para a criação das tabelas e inserção de dados.
- Escrever consultas em **Álgebra Relacional** para extrair informações do banco de dados.
- Implementar o banco de dados no **Oracle SQL Live** e realizar testes práticos.

## 🏗 Estrutura do Banco de Dados
O banco de dados foi projetado para armazenar informações sobre **artigos acadêmicos**, suas publicações, áreas de estudo e palavras-chave associadas.

### 📂 Estrutura das Tabelas:
1. **Publicacao**: Armazena as publicações científicas onde os artigos foram publicados.
2. **Area**: Representa as áreas do conhecimento às quais os artigos pertencem.
3. **Artigos**: Contém os artigos científicos, seu título, ano de publicação e informações associadas.
4. **PalavraChave**: Guarda palavras-chave relacionadas aos artigos.
5. **Possui**: Tabela de relacionamento entre **Artigos** e **Publicação** (chave composta).
6. **ArtigosPC**: Tabela de relacionamento entre **Artigos** e **Palavras-chave** (chave composta).

## 💾 Como Executar
Para rodar o projeto em um banco de dados SQL, siga os passos:

1. Clone este repositório:
   ```bash
   git clone https://github.com/FranciscoGoyaAMC/EstudosSQL.git
   cd EstudosSQL
   ```
2. Utilize um banco de dados compatível, como **Oracle SQL Live**, **MySQL** ou **PostgreSQL**.
3. Execute o script SQL para criar as tabelas:
   ```sql
   -- Execute o código presente no arquivo script.sql
   ```
4. Insira os dados utilizando os comandos `INSERT INTO` fornecidos.
5. Teste as consultas de **Álgebra Relacional** para validar os dados inseridos.

## 📌 Consultas em Álgebra Relacional
Algumas das consultas desenvolvidas incluem:
- Listar todas as palavras-chave associadas a artigos na área de *Data Science*:
  ```sql
  π DescricaoPC ((σ DescricaoA = 'DataScience'(Area ⨝ Artigo)) ⨝ ArtigoPC ⨝ PalavraChave)
  ```
- Obter todos os artigos com o mesmo número de páginas que o artigo de ID 1:
  ```sql
  π ArtigoID,TituloA(σ NumeroDePaginas = 10(Artigo))
  ```
- Encontrar artigos que **não possuem palavras-chave associadas**:
  ```sql
  (Artigo - (π ArtigoID(ArtigoPC) ⨝ Artigo))
  ```

## 🚀 Aprendizados e Experiência
Este desafio foi uma excelente oportunidade para consolidar os conhecimentos em:
✅ Modelagem de bancos de dados (**DER e Modelo Relacional**)
✅ Normalização e integridade referencial
✅ Escrita de **consultas SQL e Álgebra Relacional**
✅ Implementação e testes no **Oracle SQL Live**

📩 Caso tenha sugestões ou queira trocar ideias, fique à vontade para entrar em contato!
