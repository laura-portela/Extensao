# Script para leitura de bancos de dados diversos para geração de um data frame de uma única linha
# referente as informações do estado do aluno
# Ao receber este script esqueleto colocá-lo no repositório LOCAL Extensao, que deve ter sido clonado do
# GitHub
# Enviar o script esqueleto para o repositório REMOTO com o nome extensao-esqueleto.R
# Para realizar as tarefas da ETAPA 1, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir
# para ela
# Após os alunos concluírem a ETAPA 1 a professora orientará fazer o merge into main e depois abrir outro
# branch. Aguarde...
#####################################
#### ETAPA 1: BANCO DE DADOS DO SINASC
#####################################
# A ALTERAÇÃO DO SCRIPT ESQUELETO - ETAPA 1 - DEVERÁ SER FEITA DENTRO DA BRANCH SINASC
# Tarefa 1. Leitura do banco de dados do SINASC 2015 com 3017668 linhas e 61 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados# nomeie o banco de dados como
# dados_sinasc
# Tarefa 2. Reduzir dados_sinasc apenas para as colunas que serão utilizadas, nomeando este novo banco
de dados como dados_sinasc_1
# as colunas serão 1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61

# Tarefa 3. Reduzir dados_sinasc_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois
# primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sinasc_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS# 50: MS,
# 51: MT, 52: GO, 53: DF
# observar abaixo o número de nascimentos por UF de residência para certificar-se que seu banco de
# dados está correto
# 11: 27918 12: 16980 13: 80097 14: 11409 15: 143657 16: 15750 17: 25110
# 21: 117564 22: 49253 23: 132516 24: 49099 25: 59089 26: 145024 27: 52257 28: 34917
# 29: 206655
# 31: 268305 32: 56941 33: 236960 35: 634026
# 41: 160947 42: 97223 43: 148359
# 50: 44142 51: 56673 52: 100672 53: 46122

# Exportar o arquivo com o nome dados_sinasc_2.csv
# Ao concluir a Tarefa 3 da Etapa 1 commite e envie para o repositório REMOTO o script e
# dados_sinasc_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua
# obtenção"

# Tarefa 4. Verificar em dados_sinasc_2 a frequência das categorias das seguintes variáveis: LOCNASC,
ESTCIVMAE, GESTACAO, GRAVIDEZ, PARTO,# SEXO, APGAR5, RACACOR, IDANOMAL, ESCMAE2010,
RACACORMAE, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
# Tarefa 5. Atribuir para cada variável de dados_sinasc_2 como sendo NA a categoria de "Não informado ou
# Ignorado", geralmente com código 9
# KOTELCHUCK = 9 significa "não informado" TPROBSON = 11 significa "não classificado por falta de
# informação“
# veja o dicionário do SINASC para identificar qual o código das categorias de cada variável
# Tarefa 6. Atribuir legendas para as categorias das variáveis investigadas na etapa 4.
# Exemplo: dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5),
# labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",
# "Mais que adequado")
# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula.
# Exemplo para SEXO: Feminino e Masculino# 2. Nesta Tarefa 6 não crie novas variáveis no banco de
# dados
# Tarefa 7. Categorizar as variáveis IDADEMAE, PESO e APGAR5# nova variável: dados_sinasc_2$F_PESO
# com PESO: < 2500: Baixo peso, >=2500 e < 4000: Peso normal, >= 4000: Macrossomia
# nova variável dados_sinasc_2$F_IDADE com IDADEMAE: <15, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44,
45-49, 50+
  # nova variável dados_sinasc_2$F_APGAR5 com APGAR5: < 7: Baixo, >= 7: Normal
  # Atenção para casos de NA em IDADEMAE, PESO e APGAR5
  # Ao categorizar as variáveis, garantir que sejam transformadas em tipo fator
  
  # Tarefa 8. Agregar ao banco de dados_sinasc_2 as informações PESO_P10 e PESO_P90 a partir de
  # Tabela_PIG_Brasil.csv
  # a Tabela PIG informa P10 e P90 dos pesos, de acordo com a idade gestacional# criar nova variável
  # referente ao peso, de acordo com a idade gestacional, conforme indicado abaixo# nova variável apenas
  # para casos de GRAVIDEZ única: dados_sinasc_2$F_PIG: PIG: PESO < PESO_P10, AIG: PESO_P10 <= PESO
  # <= PESO_P90, GIG: PESO > PESO_P90
  # Atenção para casos de NA em SEMAGESTAC, PESO ou SEXO. Lembre-se também que em dados_sinasc_2
  # SEXO está como fator com as categorias Feminino e Masculino.
  # criar nova variável referente ao deslocamento materno para realizar o parto, chamado de peregrinação#
  # nova variável: dados_sinasc_2$PERIG: Não: CODMUNNASC igual a CODMUNRES, Sim: CODMUNNASC
  # diferente de CODMUNRES
  # Tarefa 9. Obter as frequências das categorias das variáveis e medidas descritivas de variáveis e salvar os
  # resultados em novas variáveis.
  # Exemplo: freq_SEXO = table(dados_sinasc_2$SEXO) media_peso = mean(dados_sinasc_2$PESO)
  # Medidas descritivas a serem calculadas para variáveis QUANTITATIVAS: P25, P50, P75, média e desvio-
  # padrão. Atenção: usar na.rm = TRUE, quando necessário.
  # Tarefa 10. Criar as colunas do novo banco de dados (de nome SINASC_UF.csv Exemplo: SINASC_RJ.csv)
  # com base nas análises prévias, devendo as variáveis estar na ordem indicada abaixo
  # ATENÇÃO aos nomes das variáveis e ordem das colunas (serão 79 colunas, a ser informada pela
  # professora)
  # Tarefa 11: Exporte o banco de dados com o nome SINASC_UF.csv# Ao terminar a ETAPA 1 commite e
  # envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 1"