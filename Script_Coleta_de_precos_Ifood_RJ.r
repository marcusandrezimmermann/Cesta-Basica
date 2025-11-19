###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "07/03/2024"

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
link = c('https://www.ifood.com.br/delivery/rio-de-janeiro-rj/a-merce-maracana/476b8f05-b2e6-4881-bd64-cc1853a121b3',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/abronhense-rio-comprido/1a896ac7-3172-4096-8009-c6812c40e75d',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/atacadao---benfica-benfica/ae657ba3-8b2d-4db3-934a-b0401c9adf96',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/barateiro---largo-do-machado-catete/bd39bfec-54b3-408c-88cb-df0ba54e5b3a',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/barateiro---sao-cristovao-s-cristovao/9517173a-9b41-4bbd-8fc0-dc707c7984fa',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/casas-pedro-buenos-aires-centro/f0ff242a-2830-4dd2-88fc-4a61e66d6759',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/express-by-spid--centro-centro/cd59bbd4-5493-41ff-9e69-785edd0a7737',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/extra---bairro-de-fatima-fatima/8b01af02-b54f-4f2f-8a1f-8b45e7fe1b75',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/extra-fresh---rio-comprido-rio-comprido/32322d41-dd04-4046-b820-7f3963c806d0',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/grand-marche-meier-meier/3974df82-0459-496f-9f5b-66a13020fb42',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/hortifruti---flamengo-flamengo/14d7b3a8-ceb1-4351-9d82-60621e5aec3f',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/hortifruti---laranjeiras-laranjeiras/f7c7533e-16e2-43a9-882b-9a40904db6a6',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/hortifruti-leve---laranjeiras-laranjeiras/f276c265-89db-4faa-ab3e-d3bd009a3350',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/hortifruti-varejao-gonzalez-vila-isabel/f820a901-9750-4eee-b6b8-4b057dc5f5de',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/mercado-flamar-flamengo/8bc10ed9-b355-40c6-a38a-c565553c8faa',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/mercado-imperial-cosme-velho/9a0d1e85-2472-443f-b1c8-b81d99be678f',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/minimercado-primus-tijuca/8c5a1560-45dd-4ac7-a967-72a9502cd8d5',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/multimarket-senador-pompeu-centro/f1f41dc5-5274-4fe8-9356-148c00e4ed3f',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/padaria-24h-laranjeiras/773426cb-cc31-43ad-9af0-f146ebf2b027',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/pao-de-acucar---dr-sattamini-tijuca/cfabf893-e950-4b95-89f0-4421e59e6f61',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/pao-de-acucar---viveiros-de-castro-copacabana/b76a48ed-b0ad-4005-b174-26efc704afd0',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/pao-de-acucar---voluntarios-da-patria-botafogo/82f1af56-ddfc-425e-815f-37b87b92c4aa',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/pao-de-acucar-fresh---leme-copacabana/ec055701-976f-44fb-92c5-e2a9d1f5c988',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/prezunic---botafogo-botafogo/fb9b2d1f-0960-4d59-b9be-88a065c10f49',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/prezunic---laranjeiras-laranjeiras/b4372313-3d1b-4a52-b32e-8b323ee85eb4',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/primers-mercado-copacabana-copacabana/ce5f48cd-84bd-4dbb-8138-2236e1d8e76c',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/princesa-supermercados---catete-catete/a260129d-fbd0-482d-b938-3ccd33b6e26e',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/princesa-supermercados---laranjeiras-laranjeiras/07e0c49c-b532-4608-8e6b-96086e411102',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/rede-economia---gomes-freire-centro/6963f164-538a-4342-9fd3-786bda6b9d8f',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/rede-economia---sao-clemente-botafogo/9338f5a9-976a-48c4-a2b7-46f5de9a23a0',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/spid---botafogo-botafogo/e1e5a80e-5f18-413f-a727-01dafa044f01',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/spid---gloria-gloria/ead1e462-5f61-4cb8-a7eb-975f0ccbdc00',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/spid---farme-de-amoedo-ipanema/6207fe47-a04b-4b80-9dca-e44f3083766a',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/spid---sete-de-setembro-centro/88faf780-5897-494e-8b0a-d9644fb81161',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/super-prix---estacio-estacio/c0c06788-80d0-43dc-b7cd-b81775aefe52',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/super-prix---ipanema-ipanema/3907a7c5-6256-4f37-b76d-9fed9dd628e8',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/super-prix---maracana-maracana/c802c262-bb6b-446f-aed3-9d3db9eee2f9',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/supermarket-alvorada---copacabana-copacabana/8d0123e7-4013-4e95-9274-1a53b80c18da',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/supermarket-alvorada---maracana-sao-francisco-xavier/a8cc785d-04da-460e-9dac-716229a5edfe',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/supermarket-barra-oeste--fatima-bairro-de-fatima/9fb95261-25d4-4862-b152-39dec2f94438',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/supermarket-gmap---santo-cristo-santo-cristo/07bf6811-669c-4998-8d61-bf08887ecd79',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/supermarket-ramigos---benfica-benfica/deaa29d8-b64e-406b-a316-98cf6a449237',
         'https://www.ifood.com.br/delivery/rio-de-janeiro-rj/supermarket-torre----tijuca-maracana/aba5c8cc-1b82-4f80-8bc5-ef079a22fd0b')

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
lista_enderecos = ('Rua André Cavalcanti, 106, Centro, Rio de Janeiro - RJ, Brasil')

### 2.3 - Buscando preços na internet e capturando os mesmos 

dframe_total = data.frame() #definindo o data frame geral

### Abrindo navegador

remDr <- remoteDriver(remoteServerAddr = "localhost", 
                      browserName = "chrome") # Inicia o driver
remDr$open() # Abre navegador/browser
remDr$maxWindowSize() # Maximiza a janela do navegador
remDr$navigate(site) # Navega pelo link
Sys.sleep(3) # Aguarda 3 segundos para carregamento

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
Sys.sleep(4) # Aguarda 4 segundos para carregamento

### Entrando em cada mercado

for(h in 1:length(link)){  #criando um looping para processar todos os produtos

remDr$navigate(link[h]) # Navega pelo link

Sys.sleep(4) # Aguarda 4 segundos para carregamento
  
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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_RJ",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela