library(magrittr)
# install.packages("SOAR")
library(SOAR)
library(sjmisc)
library(stringr)

### Leitura de arquivos

setwd("C:\\Users\\marcu\\Documents\\Tese\\Script")

'C:\\Users\\marcu\\Documents\\Tese\\Script\\Bases Ifood\\RJ' -> diretorio

arquivos <- dir(diretorio, full.names = TRUE)

## Necessário rodar por partes, abaixo, pois vai dando erro nos FOR 

Base_RJ <- data.frame()

for(i_arq in 1:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ, res) -> Base_RJ
}

Base_RJ2 <- data.frame()

for(i_arq in 249:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ2, res) -> Base_RJ2
}

Base_RJ2 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ2

Base_RJ3 <- data.frame()

for(i_arq in 251:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ3, res) -> Base_RJ3
}

Base_RJ4 <- data.frame()

for(i_arq in 324:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ4, res) -> Base_RJ4
}

Base_RJ4 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ4


Base_RJ5 <- data.frame()

for(i_arq in 325:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ5, res) -> Base_RJ5
}

Base_RJ6 <- data.frame()

for(i_arq in 334:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ6, res) -> Base_RJ6
}

Base_RJ6 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ6

Base_RJ7 <- data.frame()

for(i_arq in 335:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ7, res) -> Base_RJ7
}

Base_RJ8 <- data.frame()

for(i_arq in 341:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ8, res) -> Base_RJ8
}

Base_RJ8 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ8

Base_RJ9 <- data.frame()

for(i_arq in 343:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ9, res) -> Base_RJ9
}

Base_RJ10 <- data.frame()

for(i_arq in 345:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ10, res) -> Base_RJ10
}

Base_RJ10 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ10


Base_RJ11 <- data.frame()

for(i_arq in 346:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ11, res) -> Base_RJ11
}

Base_RJ12 <- data.frame()

for(i_arq in 347:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ12, res) -> Base_RJ12
}

Base_RJ12 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ12

Base_RJ13 <- data.frame()

for(i_arq in 348:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ13, res) -> Base_RJ13
}

Base_RJ14 <- data.frame()

for(i_arq in 353:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ14, res) -> Base_RJ14
}

Base_RJ14 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ14

Base_RJ15 <- data.frame()

for(i_arq in 355:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ15, res) -> Base_RJ15
}

Base_RJ16 <- data.frame()

for(i_arq in 358:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ16, res) -> Base_RJ16
}

Base_RJ16 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ16

Base_RJ17 <- data.frame()

for(i_arq in 360:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ17, res) -> Base_RJ17
}

Base_RJ18 <- data.frame()

for(i_arq in 361:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ18, res) -> Base_RJ18
}

Base_RJ18 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ18

Base_RJ19 <- data.frame()

for(i_arq in 362:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ19, res) -> Base_RJ19
}

Base_RJ20 <- data.frame()

for(i_arq in 368:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ20, res) -> Base_RJ20
}

Base_RJ20 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ20

Base_RJ21 <- data.frame()

for(i_arq in 369:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ21, res) -> Base_RJ21
}

Base_RJ22 <- data.frame()

for(i_arq in 373:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ22, res) -> Base_RJ22
}

Base_RJ22 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ22

Base_RJ23 <- data.frame()

for(i_arq in 374:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ23, res) -> Base_RJ23
}

Base_RJ24 <- data.frame()

for(i_arq in 383:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ24, res) -> Base_RJ24
}

Base_RJ24 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ24

Base_RJ25 <- data.frame()

for(i_arq in 384:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ25, res) -> Base_RJ25
}

Base_RJ26 <- data.frame()

for(i_arq in 389:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ26, res) -> Base_RJ26
}

Base_RJ26 %>%
  dplyr::select(-produto_base) %>%
  dplyr::rename(produto_base = nome_produto,
                nome_produto = preco_produto,
                preco_produto = nome_estabelecimento, 
                nome_estabelecimento = localidade, 
                localidade = dia, dia = hora, hora = X) -> Base_RJ26

Base_RJ27 <- data.frame()

for(i_arq in 390:length(arquivos)) {
  res <- read.csv2(arquivos[i_arq])
  rbind(Base_RJ27, res) -> Base_RJ27
}

rm(res)

# Juntando todas as bases

rbind(Base_RJ, Base_RJ2) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ3) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ4) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ5) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ6) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ7) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ8) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ9) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ10) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ11) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ12) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ13) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ14) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ15) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ16) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ17) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ18) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ19) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ20) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ21) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ22) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ23) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ24) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ25) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ26) -> Base_total_RJ
rbind(Base_total_RJ, Base_RJ27) -> Base_total_RJ

# Ajustando a base sem dados relevantes

Base_total_RJ %>%
  dplyr::filter(!(hora == "")) -> Base_total_RJ_ajust

# Ajustando os dias do ano para um único padrão: DD/MM/AAAA

unique(Base_total_RJ_ajust$dia) -> f

t <- c("27/02/2023",
       "28/02/2023",
       "01/03/2023",
       "02/03/2023",
       "03/03/2023",
       "04/03/2023",
       "05/03/2023",
       "06/03/2023",
       "07/03/2023",
       "08/03/2023",
       "09/03/2023",
       "10/03/2023",
       "11/03/2023",
       "12/03/2023",
       "13/03/2023",
       "14/03/2023",
       "15/03/2023",
       "16/03/2023",
       "17/03/2023",
       "18/03/2023",
       "19/03/2023",
       "20/03/2023",
       "21/03/2023",
       "22/03/2023",
       "23/03/2023",
       "24/03/2023",
       "25/03/2023",
       "26/03/2023",
       "27/03/2023",
       "28/03/2023",
       "29/03/2023",
       "30/03/2023",
       "31/03/2023",
       "01/04/2023",
       "02/04/2023",
       "03/04/2023",
       "04/04/2023",
       "05/04/2023",
       "06/04/2023",
       "07/04/2023",
       "08/04/2023",
       "09/04/2023",
       "10/04/2023",
       "11/04/2023",
       "12/04/2023",
       "13/04/2023",
       "14/04/2023",
       "15/04/2023",
       "16/04/2023",
       "17/04/2023",
       "18/04/2023",
       "19/04/2023",
       "20/04/2023",
       "21/04/2023",
       "22/04/2023",
       "23/04/2023",
       "24/04/2023",
       "25/04/2023",
       "26/04/2023",
       "27/04/2023",
       "28/04/2023",
       "29/04/2023",
       "30/04/2023",
       "01/05/2023",
       "02/05/2023",
       "03/05/2023",
       "04/05/2023",
       "05/05/2023",
       "06/05/2023",
       "07/05/2023",
       "08/05/2023",
       "09/05/2023",
       "10/05/2023",
       "11/05/2023",
       "12/05/2023",
       "13/05/2023",
       "14/05/2023",
       "15/05/2023",
       "16/05/2023",
       "17/05/2023",
       "18/05/2023",
       "19/05/2023",
       "20/05/2023",
       "21/05/2023",
       "22/05/2023",
       "23/05/2023",
       "24/05/2023",
       "25/05/2023",
       "26/05/2023",
       "27/05/2023",
       "28/05/2023",
       "29/05/2023",
       "30/05/2023",
       "31/05/2023",
       "01/06/2023",
       "02/06/2023",
       "03/06/2023",
       "04/06/2023",
       "05/06/2023",
       "06/06/2023",
       "07/06/2023",
       "08/06/2023",
       "09/06/2023",
       "10/06/2023",
       "11/06/2023",
       "12/06/2023",
       "13/06/2023",
       "14/06/2023",
       "15/06/2023",
       "16/06/2023",
       "17/06/2023",
       "18/06/2023",
       "19/06/2023",
       "20/06/2023",
       "21/06/2023",
       "22/06/2023",
       "23/06/2023",
       "24/06/2023",
       "25/06/2023",
       "26/06/2023",
       "27/06/2023",
       "28/06/2023",
       "29/06/2023",
       "30/06/2023",
       "01/07/2023",
       "02/07/2023",
       "03/07/2023",
       "04/07/2023",
       "05/07/2023",
       "06/07/2023",
       "07/07/2023",
       "08/07/2023",
       "09/07/2023",
       "10/07/2023",
       "11/07/2023",
       "12/07/2023",
       "13/07/2023",
       "14/07/2023",
       "15/07/2023",
       "16/07/2023",
       "17/07/2023",
       "18/07/2023",
       "19/07/2023",
       "20/07/2023",
       "21/07/2023",
       "22/07/2023",
       "23/07/2023",
       "24/07/2023",
       "25/07/2023",
       "26/07/2023",
       "27/07/2023",
       "28/07/2023",
       "29/07/2023",
       "30/07/2023",
       "31/07/2023",
       "01/08/2023",
       "02/08/2023",
       "03/08/2023",
       "04/08/2023",
       "05/08/2023",
       "06/08/2023",
       "07/08/2023",
       "08/08/2023",
       "09/08/2023",
       "10/08/2023",
       "11/08/2023",
       "12/08/2023",
       "13/08/2023",
       "14/08/2023",
       "15/08/2023",
       "16/08/2023",
       "17/08/2023",
       "18/08/2023",
       "19/08/2023",
       "20/08/2023",
       "21/08/2023",
       "22/08/2023",
       "23/08/2023",
       "24/08/2023",
       "25/08/2023",
       "26/08/2023",
       "27/08/2023",
       "28/08/2023",
       "29/08/2023",
       "30/08/2023",
       "31/08/2023",
       "01/09/2023",
       "02/09/2023",
       "03/09/2023",
       "04/09/2023",
       "05/09/2023",
       "06/09/2023",
       "07/09/2023",
       "08/09/2023",
       "09/09/2023",
       "10/09/2023",
       "11/09/2023",
       "12/09/2023",
       "13/09/2023",
       "14/09/2023",
       "15/09/2023",
       "16/09/2023",
       "17/09/2023",
       "18/09/2023",
       "19/09/2023",
       "20/09/2023",
       "21/09/2023",
       "22/09/2023",
       "23/09/2023",
       "24/09/2023",
       "25/09/2023",
       "26/09/2023",
       "27/09/2023",
       "28/09/2023",
       "29/09/2023",
       "30/09/2023",
       "01/10/2023",
       "02/10/2023",
       "03/10/2023",
       "04/10/2023",
       "05/10/2023",
       "06/10/2023",
       "07/10/2023",
       "08/10/2023",
       "09/10/2023",
       "10/10/2023",
       "11/10/2023",
       "12/10/2023",
       "13/10/2023",
       "14/10/2023",
       "15/10/2023",
       "16/10/2023",
       "17/10/2023",
       "18/10/2023",
       "19/10/2023",
       "20/10/2023",
       "21/10/2023",
       "22/10/2023",
       "23/10/2023",
       "24/10/2023",
       "25/10/2023",
       "26/10/2023",
       "27/10/2023",
       "28/10/2023",
       "29/10/2023",
       "30/10/2023",
       "31/10/2023",
       "01/11/2023",
       "02/11/2023",
       "03/11/2023",
       "04/11/2023",
       "05/11/2023",
       "06/11/2023",
       "07/11/2023",
       "08/11/2023",
       "09/11/2023",
       "10/11/2023",
       "11/11/2023",
       "12/11/2023",
       "13/11/2023",
       "14/11/2023",
       "15/11/2023",
       "16/11/2023",
       "17/11/2023",
       "18/11/2023",
       "19/11/2023",
       "20/11/2023",
       "21/11/2023",
       "29/11/2023",
       "30/11/2023",
       "01/12/2023",
       "02/12/2023",
       "03/12/2023",
       "04/12/2023",
       "05/12/2023",
       "06/12/2023",
       "07/12/2023",
       "08/12/2023",
       "09/12/2023",
       "10/12/2023",
       "11/12/2023",
       "12/12/2023",
       "13/12/2023",
       "14/12/2023",
       "15/12/2023",
       "16/12/2023",
       "17/12/2023",
       "18/12/2023",
       "19/12/2023",
       "20/12/2023",
       "21/12/2023",
       "22/12/2023",
       "23/12/2023",
       "24/12/2023",
       "25/12/2023",
       "26/12/2023",
       "27/12/2023",
       "28/12/2023",
       "29/12/2023",
       "30/12/2023",
       "31/12/2023",
       "01/01/2024",
       "02/01/2024",
       "03/01/2024",
       "04/01/2024",
       "05/01/2024",
       "06/01/2024",
       "07/01/2024",
       "08/01/2024",
       "09/01/2024",
       "10/01/2024",
       "11/01/2024",
       "12/01/2024",
       "13/01/2024",
       "14/01/2024",
       "15/01/2024",
       "16/01/2024",
       "17/01/2024",
       "18/01/2024",
       "19/01/2024",
       "20/01/2024",
       "21/01/2024",
       "22/01/2024",
       "23/01/2024",
       "24/01/2024",
       "25/01/2024",
       "26/01/2024",
       "27/01/2024",
       "28/01/2024",
       "29/01/2024",
       "30/01/2024",
       "31/01/2024",
       "01/02/2024",
       "02/02/2024",
       "03/02/2024",
       "04/02/2024",
       "05/02/2024",
       "06/02/2024",
       "07/02/2024",
       "08/02/2024",
       "09/02/2024",
       "10/02/2024",
       "11/02/2024",
       "12/02/2024",
       "13/02/2024",
       "14/02/2024",
       "15/02/2024",
       "16/02/2024",
       "17/02/2024",
       "18/02/2024",
       "19/02/2024",
       "20/02/2024",
       "21/02/2024",
       "22/02/2024",
       "23/02/2024",
       "24/02/2024",
       "25/02/2024",
       "26/02/2024",
       "27/02/2024",
       "28/02/2024",
       "29/02/2024",
       "01/03/2024",
       "02/03/2024",
       "03/03/2024",
       "04/03/2024",
       "05/03/2024",
       "06/03/2024",
       "07/03/2024",
       "08/03/2024",
       "09/03/2024",
       "10/03/2024",
       "11/03/2024",
       "12/03/2024",
       "13/03/2024",
       "14/03/2024",
       "15/03/2024",
       "16/03/2024",
       "17/03/2024",
       "18/03/2024",
       "19/03/2024",
       "20/03/2024",
       "21/03/2024",
       "22/03/2024",
       "23/03/2024",
       "24/03/2024",
       "25/03/2024",
       "26/03/2024",
       "27/03/2024",
       "28/03/2024",
       "29/03/2024",
       "30/03/2024",
       "31/03/2024")

Base_total_RJ_ajust$dia <- plyr::mapvalues(Base_total_RJ_ajust$dia,
                                          from = f,
                                          to = t)

# Incluindo campo mês

Base_total_RJ_ajust %>%
  dplyr::mutate(
    mes = paste0(
      substr(dia, start = nchar(dia)-3, stop = nchar(dia)),
    substr(dia, start = nchar(dia)-6, stop = nchar(dia)-5))
  ) -> Base_total_RJ_ajust

# Armazenando a base

SOAR::Store(Base_total_RJ_ajust, lib = R_Tese)

# Quantidade de supermercados por mês

Base_total_RJ_ajust %>%
  dplyr::select(nome_estabelecimento, mes) %>%
  unique() %>%
  dplyr::mutate(Qtde = 1) %>%
  dplyr::group_by(mes) %>%
  dplyr::summarise(Qtde = sum(Qtde)) -> supermercados

# Tempo

Base_total_RJ_ajust %>%
  dplyr::select(mes, dia, hora) %>%
  unique() %>%
  dplyr::mutate(diaHora = as.POSIXct(strptime(hora, "%H:%M:%S"))) %>%
  dplyr::group_by(mes, dia) %>%
  dplyr::summarise(tempo = max(diaHora) - min(diaHora)) %>%
  dplyr::ungroup() %>%
  dplyr::group_by(mes) %>%
  dplyr::summarise(tempo = mean(tempo)) -> tempo

# Lendo padrão que deve ser limpo

Eliminar <- openxlsx::read.xlsx('C:/Users/marcu/Documents/Tese/Script/Eliminar.xlsx')

# Dividindo a base em duas...

Base_total_RJ_ajust %>%
  dplyr::filter(mes %in% c("202302", "202303", "202304", "202305", "202306", "202307", "202308")) -> Base_total_RJ_ajust1
                           
Base_total_RJ_ajust %>%
  dplyr::filter(mes %in% c("202309", "202310", "202311", "202312", "202401", "202402", 
                           "202403")) -> Base_total_RJ_ajust2

# Limpando a base

array = array(unlist(Eliminar))
Base_total_RJ_ajust1$teste <- apply(sapply(array , grepl, Base_total_RJ_ajust1$nome_produto), 1, any)
Base_total_RJ_ajust2$teste <- apply(sapply(array , grepl, Base_total_RJ_ajust2$nome_produto), 1, any)

# Armazenando a base

rbind(Base_total_RJ_ajust1, Base_total_RJ_ajust2) -> Base_total_RJ_ajust
SOAR::Store(Base_total_RJ_ajust, lib = R_Tese)

# Trabalhando...

Base_total_RJ_ajust$preco_produto <- as.numeric(Base_total_RJ_ajust$preco_produto)

Base_total_RJ_ajust %>%
  dplyr::mutate(preco = ifelse(grepl("900ml", nome_produto), preco_produto/9*10,
                               ifelse(grepl("900 ml", nome_produto), preco_produto/9*10,
                                      ifelse(grepl("2 kg", nome_produto), preco_produto/2,
                                             ifelse(grepl("2kg", nome_produto), preco_produto/2,
                                                    ifelse(grepl("5kg", nome_produto), preco_produto/5,
                                                           ifelse(grepl("5 kg", nome_produto), preco_produto/5,
                                                                  ifelse(grepl("7kg", nome_produto), preco_produto/7,
                                                                         ifelse(grepl("7 kg", nome_produto), preco_produto/7,
                                                                                ifelse(grepl("500g", nome_produto), preco_produto*2,
                                                                                       ifelse(grepl("500 g", nome_produto), preco_produto*2,
                                                                                              ifelse(grepl(" 50g", nome_produto), preco_produto*20,
                                                                                                     ifelse(grepl(" 50 g", nome_produto), preco_produto*20,
                                                                                                            ifelse(grepl("250 g", nome_produto), preco_produto*4,
                                                                                                                   ifelse(grepl("250g", nome_produto), preco_produto*4,
                                                                                                                          ifelse(grepl("200 g", nome_produto), preco_produto*5,
                                                                                                                                 ifelse(grepl("200g", nome_produto), preco_produto*5,
                                                                                                                                        ifelse(grepl("750 g", nome_produto), preco_produto/3*4,
                                                                                                                                               ifelse(grepl("750g", nome_produto), preco_produto/3*4,
                                                                                                                                                      ifelse(grepl("600 g", nome_produto), preco_produto/3*5,
                                                                                                                                                             ifelse(grepl("600g", nome_produto), preco_produto/3*5,
                                                                                                                                                                    ifelse(grepl("400 g", nome_produto), preco_produto/2*5,
                                                                                                                                                                           ifelse(grepl("400g", nome_produto), preco_produto/2*5,
                                                                                                                                                                                  ifelse(grepl("450 g", nome_produto), preco_produto/45*100,
                                                                                                                                                                                         ifelse(grepl("450g", nome_produto), preco_produto/45*100,
                                                                                                                                                                                                ifelse(grepl("800 g", nome_produto), preco_produto/4*5,
                                                                                                                                                                                                       ifelse(grepl("800g", nome_produto), preco_produto/4*5,
                                                                                                                                                                                                              ifelse(grepl("600 Gramas", nome_produto), preco_produto/3*5,
                                                                                                                                                                                                                     ifelse(grepl("100 g", nome_produto), preco_produto*10,
                                                                                                                                                                                                                            ifelse(grepl("100g", nome_produto), preco_produto*10,
                                                                                                                                                                                                                                   ifelse(grepl("300 g", nome_produto), preco_produto/3*10,
                                                                                                                                                                                                                                          ifelse(grepl("300g", nome_produto), preco_produto/3*10,
                                                                                                                                                                                                                                                 ifelse(grepl("30 g", nome_produto), preco_produto/3*100,
                                                                                                                                                                                                                                                        ifelse(grepl("30g", nome_produto), preco_produto/3*100,
                                                                                                                                                                                                                                                               ifelse(grepl("150 g", nome_produto), preco_produto/3*20,
                                                                                                                                                                                                                                                                      ifelse(grepl("150g", nome_produto), preco_produto/3*20,
                                                                                                                                                                                                                                                                             ifelse(grepl("380g", nome_produto), preco_produto/38*100,
                                                                                                                                                                                                                                                                                    ifelse(grepl("62g", nome_produto), preco_produto/62*1000, preco_produto)
                                                                                                                                                                                                                                                                             ))))))))))))))))))))))))))))))))))))) %>%
  dplyr::mutate(preco_duzia = ifelse(grepl("Prata", nome_produto), preco*1.2,
                                     ifelse(grepl("Nanica", nome_produto), preco*1.8,
                                            ifelse(grepl("Caturra", nome_produto), preco*1.8,
                                                   ifelse(grepl("agua", nome_produto), preco*1.8,
                                                          ifelse(grepl("água", nome_produto), preco*1.8, 0)))))) %>%
  dplyr::mutate(preco_cesta = ifelse(produto_base == "Óleo de soja", preco*0.75,
                                     ifelse(produto_base == "Manteiga", preco*0.75,
                                            ifelse(produto_base == 'Açúcar refinado', preco*3,
                                                   ifelse(produto_base == 'Leite integral 1L', preco*7.5,
                                                          ifelse(produto_base == 'Feijão preto', preco*4.5,
                                                                 ifelse(produto_base == 'Arroz tipo 1', preco*3,
                                                                        ifelse(produto_base == 'Farinha de trigo', preco*1.5,
                                                                               ifelse(produto_base == 'Tomate kg', preco*9,
                                                                                      ifelse(produto_base == 'Café', preco*0.6,
                                                                                             ifelse(produto_base == 'Banana kg', preco_duzia*7.5, preco*6))))))))))) -> Base_RJ_reg

# Armazenando a base

SOAR::Store(Base_RJ_reg, lib = R_Tese)

# Recuperando a base

SOAR::Attach(lib = R_Tese)
SOAR::Objects(lib = R_Tese)

# Base do DIEESE e junção com a base criada

Base_DIEESE_final$mes <- as.character(Base_DIEESE_final$mes)

Base_RJ_reg$mes <- as.character(Base_RJ_reg$mes)

Base_RJ_reg %>%
  dplyr::filter(teste == 'FALSE',
                produto_base != 'Feijão carioca',
                mes != '202303',
                mes != '202302',
                !(is.na(preco_cesta)),
                preco_cesta != 0) -> Base_RJ_reg

Base_RJ_reg$produto_base <- plyr::mapvalues(Base_RJ_reg$produto_base,
                                            from = c("Coxão mole", "Coxão duro", "Patinho", "Feijão carioca", "Feijão preto", "Farinha de trigo", "Farinha de mandioca", "Arroz tipo 1", "Banana kg", "Açúcar refinado", "Batata Kg", "Batata kg", "Leite integral 1L", "Óleo de soja", "Pão francês", "Tomate kg", "Tomate Kg"),
                                            to = c("Carne", "Carne", "Carne", "Feijão", "Feijão", "Farinha", "Farinha", "Arroz", "Banana", "Açúcar", "Batata", "Batata", "Leite", "Óleo", "Pão", "Tomate", "Tomate"))


DIEESE %>%
  dplyr::filter(UF == 'RJ') %>%
  dplyr::select(-UF) %>%
  as.data.frame() -> DIEESE_RJ

DIEESE_RJ %>%
  dplyr::filter(produto_base == 'Total') %>%
  dplyr::select(-produto_base) -> DIEESE_RJ_total

Base_RJ_reg %>%
  dplyr::left_join(DIEESE_RJ, by = c('produto_base', 'mes')) -> Cesta_BasicaIfood_RJ

cv<-function(x){coef<-sd(x)/mean(x)*100 
return(coef)}

Cesta_BasicaIfood_RJ %>%
  dplyr::mutate(teste2 = ifelse(preco_cesta >= preco_oficial*0.5 & preco_cesta <= preco_oficial*1.5, 'FALSE', 'TRUE')) %>%
  dplyr::group_by(produto_base) %>%
  dplyr::mutate(mediana = median(preco_cesta)) %>%
  dplyr::ungroup() %>%
  dplyr::filter(teste2 == 'FALSE') %>%
  dplyr::group_by(produto_base, mediana) %>%
  dplyr::summarise(minimo = min(preco_cesta),
                   maximo = max(preco_cesta)) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(minimo = minimo/mediana,
                maximo = maximo/mediana) -> teste

# Cesta_BasicaIfood_RJ %>%
#   dplyr::group_by(produto_base) %>%
#   dplyr::mutate(teste2 = ifelse(produto_base == 'Carne' & preco_cesta >= median(preco_cesta)*1.2 & preco_cesta <= median(preco_cesta)*3, 'FALSE', 
#                                 ifelse(produto_base == 'Banana' & preco_cesta >= median(preco_cesta)*2 & preco_cesta <= median(preco_cesta)*6.7, 'FALSE',
#                                        ifelse(produto_base == 'Batata' & preco_cesta >= median(preco_cesta)*1.3 & preco_cesta <= median(preco_cesta)*5.3, 'FALSE',
#                                               ifelse(produto_base == 'Tomate' & preco_cesta >= median(preco_cesta)*2 & preco_cesta <= median(preco_cesta)*10, 'FALSE',
#                                                      ifelse(produto_base == 'Pão' & preco_cesta >= median(preco_cesta)*1.9 & preco_cesta <= median(preco_cesta)*13, 'FALSE',
#                                                             ifelse(produto_base %in% c('Açúcar', 'Arroz', 'Feijão', 'Farinha', 'Café', 'Óleo', 'Manteiga', 'Leite') & preco_cesta >= median(preco_cesta)*0.5 & preco_cesta <= median(preco_cesta)*3, 'FALSE', 'TRUE'))))))) %>%
#   dplyr::ungroup() %>%
#   dplyr::filter(teste2 == 'FALSE') %>%
#   dplyr::group_by(produto_base, mes) %>%
#   dplyr::summarise(preco_calculado = mean(preco_cesta),
#                    variancia = var(preco_cesta),
#                    desvio_padrao = sd(preco_cesta),
#                    coef_var = cv(preco_cesta)) %>%
#   dplyr::ungroup() %>%
#   dplyr::group_by(mes) %>%
#   dplyr::summarise(preco_calculado = sum(preco_calculado),
#                    variancia = sum(variancia, na.rm = TRUE)) %>%
#   dplyr::ungroup() %>%
#   dplyr::mutate(desvio_padrao = sqrt(variancia)) %>%
#   dplyr::mutate(coef_var = desvio_padrao/preco_calculado,
#                 lim_inf = preco_calculado - 1.5*desvio_padrao,
#                 lim_sup = preco_calculado + 1.5*desvio_padrao) %>%
#   dplyr::left_join(DIEESE_RJ_total, by = 'mes') %>%
#   dplyr::mutate(diferenca = (preco_calculado - preco_oficial)/preco_oficial) -> Cesta_Final_RJ

Cesta_BasicaIfood_RJ %>%
  dplyr::group_by(produto_base) %>%
  dplyr::mutate(teste2 = ifelse(produto_base == 'Carne' & preco_cesta >= median(preco_cesta)*1.2 & preco_cesta <= median(preco_cesta)*3, 'FALSE', 
                                ifelse(produto_base == 'Banana' & preco_cesta >= median(preco_cesta)*2 & preco_cesta <= median(preco_cesta)*6.7, 'FALSE',
                                       ifelse(produto_base == 'Batata' & preco_cesta >= median(preco_cesta)*1.3 & preco_cesta <= median(preco_cesta)*5.3, 'FALSE',
                                              ifelse(produto_base == 'Tomate' & preco_cesta >= median(preco_cesta)*2 & preco_cesta <= median(preco_cesta)*10, 'FALSE',
                                                     ifelse(produto_base == 'Pão' & preco_cesta >= median(preco_cesta)*1.9 & preco_cesta <= median(preco_cesta)*13, 'FALSE',
                                                            ifelse(produto_base %in% c('Açúcar', 'Arroz', 'Feijão', 'Farinha', 'Café', 'Óleo', 'Manteiga', 'Leite') & preco_cesta >= median(preco_cesta)*0.5 & preco_cesta <= median(preco_cesta)*3, 'FALSE', 'TRUE'))))))) %>%
  dplyr::ungroup() %>%
  dplyr::filter(teste2 == 'FALSE') %>%
  dplyr::mutate(n = 1) %>%
  dplyr::group_by(produto_base, mes) %>%
  dplyr::summarise(preco_calculado = mean(preco_cesta),
                   variancia = var(preco_cesta),
                   n = sum(n)) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(var2 = variancia / n) %>%
  dplyr::group_by(mes) %>%
  dplyr::summarise(preco_calculado = sum(preco_calculado),
                   variancia = sum(var2, na.rm = TRUE)) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(desvio_padrao = sqrt(variancia)) %>%
  dplyr::mutate(coef_var = desvio_padrao/preco_calculado) %>%
  dplyr::mutate(z = qnorm(p = 0.99)) %>%
  dplyr::mutate(intervalo = z * desvio_padrao) %>%
  dplyr::left_join(DIEESE_RJ_total, by = 'mes') %>%
  dplyr::mutate(diferenca = (preco_calculado - preco_oficial)/preco_oficial,
                lim_inf = preco_calculado - intervalo,
                lim_sup = preco_calculado + intervalo) %>%
  dplyr:: select(mes, preco_calculado, variancia, desvio_padrao, coef_var,
                 lim_inf, lim_sup, preco_oficial, diferenca)-> Cesta_Final_RJ

openxlsx::write.xlsx(Cesta_Final_RJ, file='Cesta_BasicaIfood_RJ.xlsx')

# tmp %>%
#   dplyr::filter(mes == '202401') %>%
#   dplyr::select(produto_base) %>%
#   unique()
