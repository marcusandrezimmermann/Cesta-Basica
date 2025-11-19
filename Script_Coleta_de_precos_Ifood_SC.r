###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "27/01/2024"

### 1 - Configurar Selenium no R.

###Para utilizar o pacote RSelenium que promove uma interação entre o R e o navegador devemos ter instalado alguns arquivos e declarar para o R onde eles estão.

### 1.1 - Download Selenium e Chromedriver

###- [Selenium Server Standalone Binary](http://selenium-release.storage.googleapis.com/index.html?path=4.0/)
###- [ChromeDriver](https://chromedriver.chromium.org/downloads) - conforme versões do navegador e sistema operacional.

### 1.2 - Declarar Selenium e Chromedriver

###Precisamos declarar para o R onde estão os arquivos que foram baixados para o funcionamento do pacote RSelenium que promoverá a interação entre o R e o browser. 

setwd("C:\\Users\\marcu\\Documents\\Tese\\Script") # Inserir caminho
system("java -jar selenium-server-standalone-4.0.0-alpha-1.jar", wait = FALSE) # Declara selenium
system("chromedriver.exe", wait = FALSE) # Declara chromedriver

### 2 - Site Ifood

###Utilizaremos o site da Ifood para mercados, pois abriga muitos estabelecimentos locais.
###Armazenar este link no objeto *site*.
###Será armazenado no objeto *link* as URL dos mercados dentro do Ifood que entregam no endereço escolhido.

site = "https://www.ifood.com.br/mercados"
link = c('https://www.ifood.com.br/delivery/florianopolis-sc/angeloni-supermercado---beira-mar-agronomica/ada74887-c4f9-47ee-9bb4-1f1bfc4226ee',
         'https://www.ifood.com.br/delivery/florianopolis-sc/armazem-mercado-express---lagoa-lagoa-da-conceicao/72618e36-b892-4b5b-a6cf-9dd5d0701405',
         'https://www.ifood.com.br/delivery/florianopolis-sc/armazem-mercado-express---trindade-trindade/c6ef5c2f-2f71-49bd-8dce-ba9674c3f815',
         'https://www.ifood.com.br/delivery/florianopolis-sc/atacadao-florianopolis-jk-estreito/1984f754-a682-41cf-9df7-a2ba5e3b8f14',
         'https://www.ifood.com.br/delivery/florianopolis-sc/atacadao-florianopolis-via-expressa-capoeiras/47ff549d-0f34-4707-a61e-2651c38228b5',
         'https://www.ifood.com.br/delivery/florianopolis-sc/big-by-carrefour---florianopolis-santa-monica/9d44e834-dd1b-4548-9174-e0a93f87b5f0',
         'https://www.ifood.com.br/delivery/florianopolis-sc/bistek-florianopolis-costeira-do-pirajubae/27fe0813-f94b-4e86-8fa9-28c7284173d6',
         'https://www.ifood.com.br/delivery/florianopolis-sc/carrefour-hiper---florianopolis-santa-monica/111ffd6a-e6fc-4c98-beb9-93f4729937c4',
         'https://www.ifood.com.br/delivery/sao-jose-sc/copal-supermercados-barreiros/d1fbc0b4-7cb9-4032-8df9-fe9c630b0173',
         'https://www.ifood.com.br/delivery/florianopolis-sc/direto-do-campo-tb-da-sc-401-saco-grande/1be58a79-dacb-407a-a1bd-b4d8f835ba6e',
         'https://www.ifood.com.br/delivery/florianopolis-sc/fort-atacadista---campeche-campeche/79b33ed1-c14a-4575-bdea-7c6f55a20a04',
         'https://www.ifood.com.br/delivery/sao-jose-sc/fort-atacadista---kobrasol-kobrasol/b39a2d28-a35d-411c-b1e4-7070429e8503',
         'https://www.ifood.com.br/delivery/sao-jose-sc/giassi---campinas-campinas/d46fe054-41ff-42c1-be00-881cbfaac3a0',
         'https://www.ifood.com.br/delivery/florianopolis-sc/hiper-select-express---corrego-grande-corrego-grande/8b2a85bf-4000-4be4-96c3-68da922e907b',
         'https://www.ifood.com.br/delivery/florianopolis-sc/hiperbom-express---centro-centro/5f6ca72e-d633-426c-94e0-77b0cb513a45',
         'https://www.ifood.com.br/delivery/florianopolis-sc/hippo-supermercados--centro-centro/10e32871-d4a1-4103-8309-9dfcfb0aad06',
         'https://www.ifood.com.br/delivery/florianopolis-sc/hippo-supermercados---coqueiros-coqueiros/39704e1c-665a-405e-aa1a-89483c732485',
         'https://www.ifood.com.br/delivery/florianopolis-sc/manhattan44-trindade/95d3738c-ee04-4c1d-9fe5-9957cbb8c341',
         'https://www.ifood.com.br/delivery/florianopolis-sc/mini-mercado-grasel-centro/1948bf77-92ca-43b8-ad02-0fdf333075e0',
         'https://www.ifood.com.br/delivery/florianopolis-sc/prado-supermercados---filial-7-balneario-estreito/4f6b0fcc-8b87-4fa1-a004-10ad01fb50f4',
         'https://www.ifood.com.br/delivery/sao-jose-sc/prado-supermercados---serraria-serraria/aaacf632-d0f9-4abb-808a-c4ebdfdf2c14',
         'https://www.ifood.com.br/delivery/florianopolis-sc/square-market-saco-grande/3be0f7df-64b7-4519-b26e-c5894a1d9ccb',
         'https://www.ifood.com.br/delivery/florianopolis-sc/supermercados-imperatriz-gourmet-centro/1365be2d-cb13-47c7-bfff-a9ab8842f973',
         'https://www.ifood.com.br/delivery/sao-jose-sc/supermercado-imperatriz-pres-kennedy-campinas/c5190db7-369d-42d9-b095-b45cc42d7b54',
         'https://www.ifood.com.br/delivery/florianopolis-sc/supermercados-magia-floripa-lagoa-da-conceicao/09537090-927d-494f-b0ef-7ce015eba443',
         'https://www.ifood.com.br/delivery/sao-jose-sc/weber-hortifruti-rocado/924e62d9-d183-4e97-898a-caaa36041825')

### 2.1 - Instalando e carregando pacotes a serem usados

###Instalar pacotes que serão utilizados na extração, limpeza e organização dos dados.

#install.packages('RSelenium')
#install.packages('tidyverse')
#install.packages('lubridate')
#install.packages('DT')

###Carregar pacotes que serão utilizados na extração, limpeza e organização dos dados.

library(RSelenium)
library(tidyverse)
library(lubridate)
library(DT)

### 2.2 - Criando vetor com o nome dos produtos a serem pesquisados e outro para o endereço

lista_produtos = c('Arroz tipo 1', 'Feijão preto', 'Farinha de trigo', 'Batata kg', 'Tomate kg', 'Pão francês', 'Café', 'Banana kg', 'Açúcar refinado', 'Óleo de soja', 'Manteiga','Coxão mole', 'Coxão duro', 'Patinho', 'Leite integral 1L')
lista_enderecos = ('Av. Mauro Ramos, 1624 - Centro, Florianópolis - SC, Brasil')

### 2.3 - Buscando preços na internet e capturando os mesmos 

dframe_total = data.frame() #definindo o data frame geral

### Abrindo navegador

remDr <- remoteDriver(remoteServerAddr = "localhost", 
                      browserName = "chrome") # Inicia o driver
remDr$open() # Abre navegador/browser
remDr$maxWindowSize() # Maximiza a janela do navegador
remDr$navigate(site) # Navega pelo link
Sys.sleep(2) # Aguarda 2 segundos para carregamento

### Ajustando endereço de entrega

endereco <- remDr$findElement(using = 'css', 
                                 value = ".address-search-input__button") # Seleciona pesquisa de endereco
endereco$clickElement() # Clica no campo de pesquisa de endereço
Sys.sleep(3) # Aguarda 3 segundos para carregamento
busca_endereco <- remDr$findElement(using='xpath', value='/html/body/div[5]/div/div/div/div/div/div[2]/div/div[1]/div[2]/input') # Procura campo de input de endereco
busca_endereco$clickElement() # Clica no campo de input de endereço
busca_endereco$sendKeysToElement(list(lista_enderecos)) # Escreve o endereço no campo adequado
Sys.sleep(4) # Aguarda 4 segundos para carregamento

seleciona_endereco <- remDr$findElement(using='xpath', value="/html/body/div[5]/div/div/div/div/div/div[2]/div/div[1]/div[3]/ul/li[1]/div/button") # Procura endereco no resultado da busca
seleciona_endereco$clickElement() # Clica no endereço adequado
Sys.sleep(2) # Aguarda 2 segundos para carregamento

confirma_localizacao <- remDr$findElement(using='xpath', value="/html/body/div[5]/div/div/div/div/div/div[3]/div[2]/button") # Procura botão para confirmação
confirma_localizacao$clickElement() # Clica no botão para confirmação
Sys.sleep(2) # Aguarda 2 segundos para carregamento

salva_endereco <- remDr$findElement(using='xpath', value="/html/body/div[5]/div/div/div/div/div/div[3]/div[1]/div[2]/form/div[4]/button/span") # Procura botão para salvamento
salva_endereco$clickElement() # Clica no botão para salvamento
Sys.sleep(4) # Aguarda 4 segundo para carregamento

### Entrando em cada mercado

for(h in 1:length(link)){  #criando um looping para processar todos os produtos

remDr$navigate(link[h]) # Navega pelo link

Sys.sleep(5) # Aguarda 5 segundos para carregamento
  
for(j in 1:length(lista_produtos)){  #criando um looping para processar todos os produtos
produto = lista_produtos[j]

### Preenchendo campo de pesquisa com um alimento

campo_pesquisa <- remDr$findElement(using = 'css', 
                                 value = ".market-catalog-search__input-container-left") # Procura campo de pesquisa de produtos
campo_pesquisa$clickElement() # Clica no campo de pesquisa
campo_de_pesquisa <- remDr$findElement(using = 'css', 
                                 value = ".market-catalog-search__input") # Procura campo de pesquisa de produtos
campo_de_pesquisa$clickElement() # Clica no campo de pesquisa
campo_de_pesquisa$sendKeysToElement(list(produto, key = "enter")) # Escreve o produto e aperta enter para pesquisar 
Sys.sleep(5) # Aguarda 5 segundos para carregamento

### Coletando dados do mercado

nome_item <- remDr$findElements(using = 'css', 
                                     value = ".product-card__description") # Procura elemento com nome do produto
  nome_produto = lapply(nome_item, function(x){x$getElementText()}) %>%  
      unlist
  nome_produto
  
# Preço do produto
  preco_produto = remDr$findElements(using = 'css', 
                                    value = ".product-card__price") # Procura elemento com preço do produto
    preco_produto = lapply(preco_produto, function(x){x$getElementText()}) %>%
    unlist %>% # Extrai texto dos elementos encontrados
    str_remove_all("R\\$ ") %>% # Retirar "R$ "
    str_remove_all("\\.") # Retirar "."
    preco_produto2 = str_split_fixed(preco_produto,"\\\n", Inf)
    
# Nome do estabelecimento
  nome_do_estabelecimento = remDr$findElements(using = 'css', 
                                    value = ".market-header__title") # Procura elemento com nome do estabelecimento
  nome_estabelecimento = lapply(nome_do_estabelecimento, function(x){x$getElementText()}) %>%
    unlist # Extrai texto dos elementos encontrados
    nome_estabelecimento
  
  if (!is.null(nome_produto)){
  dframe = data.frame() #define o data frame do produto [i]
  for(i in 1:length(nome_produto)){
    dframe = rbind(dframe, 
                   data.frame("produto_base" = produto,
                              "nome_produto" = nome_produto[i],
                              "preco_produto" = preco_produto2[i], 
                              "nome_estabelecimento" = nome_estabelecimento,
                              "localidade" = lista_enderecos,
                              "dia" = today(), 
                              "hora" = format(now(), "%H:%M:%S")))
  }
dframe_total <- bind_rows(dframe_total, dframe) #União de bases com os mesmos campos
}
Sys.sleep(3) # Aguarda 3 segundos para carregamento

### Limpeza

campo_de_pesquisa$clearElement() # Limpa campo de pesquisa
}
}
remDr$close() # Fecha browser

### 2.4 - Exportando a base de dados para um csv 

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_SC",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela