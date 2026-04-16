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
dados <- read.csv2("C:/Users/laura/Downloads/SINASC_2015_csv/SINASC_2015.csv")


# verificar se a leitura foi feita corretamente e a estrutura dos dados# nomeie o banco de dados como
# dados_sinasc
dados_sinasc <- dados
dim(dados_sinasc)
str(dados_sinasc)


# Tarefa 2. Reduzir dados_sinasc apenas para as colunas que serão utilizadas, nomeando este novo banco
#de dados como dados_sinasc_1
# as colunas serão 1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61
dados_sinasc_1 <- dados_sinasc[, c(1,4,5,6,7,12,13,14,15,19,21,22,23,24,35,38,44,46,48,59,60,61)]


# Tarefa 3. Reduzir dados_sinasc_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois
# primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sinasc_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS# 50: MS,
# 51: MT, 52: GO, 53: DF
dados_sinasc_2 <- subset(dados_sinasc_1, substr(CODMUNRES, 1, 2) == "28")


# observar abaixo o número de nascimentos por UF de residência para certificar-se que seu banco de
# dados está correto
# 11: 27918 12: 16980 13: 80097 14: 11409 15: 143657 16: 15750 17: 25110
# 21: 117564 22: 49253 23: 132516 24: 49099 25: 59089 26: 145024 27: 52257 28: 34917
# 29: 206655
# 31: 268305 32: 56941 33: 236960 35: 634026
# 41: 160947 42: 97223 43: 148359
# 50: 44142 51: 56673 52: 100672 53: 46122


# Exportar o arquivo com o nome dados_sinasc_2.csv
write.csv(dados_sinasc_2, "dados_sinasc_2.csv", row.names = FALSE)


# Ao concluir a Tarefa 3 da Etapa 1 commite e envie para o repositório REMOTO o script e
# dados_sinasc_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua
# obtenção"


# Tarefa 4. Verificar em dados_sinasc_2 a frequência das categorias das seguintes variáveis: LOCNASC,
#ESTCIVMAE, GESTACAO, GRAVIDEZ, PARTO, SEXO, APGAR5, RACACOR, IDANOMAL, ESCMAE2010,
#RACACORMAE, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
table(dados_sinasc_2$ESTCIVMAE)
table(dados_sinasc_2$GESTACAO)
table(dados_sinasc_2$GRAVIDEZ)
table(dados_sinasc_2$PARTO)
table(dados_sinasc_2$SEXO)
table(dados_sinasc_2$APGAR5)
table(dados_sinasc_2$RACACOR)
table(dados_sinasc_2$IDANOMAL)
table(dados_sinasc_2$ESCMAE2010)
table(dados_sinasc_2$RACACORMAE)
table(dados_sinasc_2$TPAPRESENT)
table(dados_sinasc_2$PARIDADE)
table(dados_sinasc_2$KOTELCHUCK)


# Tarefa 5. Atribuir para cada variável de dados_sinasc_2 como sendo NA a categoria de "Não informado ou
# Ignorado", geralmente com código 9
# KOTELCHUCK = 9 significa "não informado" TPROBSON = 11 significa "não classificado por falta de
# informação“
# veja o dicionário do SINASC para identificar qual o código das categorias de cada variável
dados_sinasc_2$ESTCIVMAE[dados_sinasc_2$ESTCIVMAE == 9] <- NA
dados_sinasc_2$GESTACAO[dados_sinasc_2$GESTACAO == 9] <- NA
dados_sinasc_2$GRAVIDEZ[dados_sinasc_2$GRAVIDEZ == 9] <- NA
dados_sinasc_2$PARTO[dados_sinasc_2$PARTO == 9] <- NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 0] <- NA
# APGAR5 não está no dicionário
# RACACOR não está no dicionário
dados_sinasc_2$IDANOMAL[dados_sinasc_2$IDANOMAL == 9] <- NA
dados_sinasc_2$ESCMAE2010[dados_sinasc_2$ESCMAE2010 == 9] <- NA
# RACACORMAE não está no dicionário
dados_sinasc_2$TPAPRESENT[dados_sinasc_2$TPAPRESENT == 9] <- NA
dados_sinasc_2$TPROBSON[dados_sinasc_2$TPROBSON == 99] <- NA
dados_sinasc_2$KOTELCHUCK[dados_sinasc_2$KOTELCHUCK == 9] <- NA


# Tarefa 6. Atribuir legendas para as categorias das variáveis investigadas na etapa 4.
# Exemplo: dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5),
# labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",
# "Mais que adequado")
# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula.
# Exemplo para SEXO: Feminino e Masculino# 2. Nesta Tarefa 6 não crie novas variáveis no banco de
# dados
dados_sinasc_2$ESTCIVMAE <- factor(dados_sinasc_2$ESTCIVMAE,
                                   levels = c(1,2,3,4,5),
                                   labels = c("Solteira","Casada","Viúva","Separada judicialmente/divorciada","União estável"))

dados_sinasc_2$GESTACAO <- factor(dados_sinasc_2$GESTACAO,
                                  levels = c(1,2,3,4,5,6),
                                  labels = c("Menos de 22 semanas","22 a 27 semanas","28 a 31 semanas",
                                             "32 a 36 semanas","37 a 41 semanas","42 semanas e mais"))

dados_sinasc_2$GRAVIDEZ <- factor(dados_sinasc_2$GRAVIDEZ,
                                  levels = c(1,2,3),
                                  labels = c("Única","Dupla","Tripla ou mais"))

dados_sinasc_2$PARTO <- factor(dados_sinasc_2$PARTO,
                               levels = c(1,2),
                               labels = c("Vaginal","Cesário"))

dados_sinasc_2$SEXO <- factor(dados_sinasc_2$SEXO,
                              levels = c(1,2),
                              labels = c("Masculino","Feminino"))

# APGAR5 (va numérica)

dados_sinasc_2$RACACOR <- factor(dados_sinasc_2$RACACOR,
                                 levels = c(1,2,3,4,5),
                                 labels = c("Branca","Preta","Amarela","Parda","Indígena"))

dados_sinasc_2$IDANOMAL <- factor(dados_sinasc_2$IDANOMAL,
                                  levels = c(1,2),
                                  labels = c("Sim","Não"))

dados_sinasc_2$ESCMAE2010 <- factor(dados_sinasc_2$ESCMAE2010,
                                    levels = c(0,1,2,3,4,5),
                                    labels = c("Sem escolaridade","Fundamental I (1ª a 4ª série)","Fundamental II (5ª a 8ª série)",
                                               "Médio (antigo 2º Grau)","Superior incompleto","Superior completo"))

dados_sinasc_2$RACACORMAE <- factor(dados_sinasc_2$RACACORMAE,
                                    levels = c(1,2,3,4,5),
                                    labels = c("Branca","Preta","Amarela","Parda","Indígena"))

dados_sinasc_2$TPAPRESENT <- factor(dados_sinasc_2$TPAPRESENT,
                                    levels = c(1,2,3),
                                    labels = c("Cefálico","Pélvica ou podálica","Transversa"))

dados_sinasc_2$PARIDADE <- factor(dados_sinasc_2$PARIDADE,
                                  levels = c(0,1),
                                  labels = c("Nulípara","Multípara"))

dados_sinasc_2$KOTELCHUCK <- factor(dados_sinasc_2$KOTELCHUCK,
                                    levels = c(1,2,3,4,5),
                                    labels = c("Não realizou pré-natal","Inadequado","Intermediário",
                                               "Adequado","Mais que adequado"))


# Tarefa 7. Categorizar as variáveis IDADEMAE, PESO e APGAR5# nova variável: dados_sinasc_2$F_PESO
# com PESO: < 2500: Baixo peso, >=2500 e < 4000: Peso normal, >= 4000: Macrossomia
# nova variável dados_sinasc_2$F_IDADE com IDADEMAE: <15, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44,
# 45-49, 50+
# nova variável dados_sinasc_2$F_APGAR5 com APGAR5: < 7: Baixo, >= 7: Normal
# Atenção para casos de NA em IDADEMAE, PESO e APGAR5
# Ao categorizar as variáveis, garantir que sejam transformadas em tipo fator
dados_sinasc_2$F_PESO <- cut(dados_sinasc_2$PESO,
                             breaks = c(-Inf, 2500, 4000, Inf),
                             labels = c("Baixo peso", "Peso normal", "Macrossomia"),
                             right = FALSE)
dados_sinasc_2$F_PESO <- factor(dados_sinasc_2$F_PESO)

dados_sinasc_2$F_IDADE <- cut(dados_sinasc_2$IDADEMAE,
                              breaks = c(-Inf, 15, 20, 25, 30, 35, 40, 45, 50, Inf),
                              labels = c("<15", "15-19", "20-24", "25-29", "30-34",
                                         "35-39", "40-44", "45-49", "50+"),
                              right = FALSE)
dados_sinasc_2$F_IDADE <- factor(dados_sinasc_2$F_IDADE)

dados_sinasc_2$F_APGAR5 <- ifelse(dados_sinasc_2$APGAR5 < 7, "Baixo", "Normal")
dados_sinasc_2$F_APGAR5 <- factor(dados_sinasc_2$F_APGAR5)


