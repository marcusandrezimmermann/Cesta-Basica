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
###Será armazenado no objeto *link* as URL dos mercados dentro do Ifood que entrega no endereço escolhido.

site = "https://www.ifood.com.br/mercados"
link = c('https://www.ifood.com.br/delivery/porto-alegre-rs/asun-supermercados---republica-cidade-baixa/e7cf4483-838a-4c20-8e5a-c04897e62378',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/asun-supermercados---santana-santana/a93fcd93-6ab5-485a-93db-368a75c50b95',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/atacadao-porto-alegre-humaita-humaita/a0a793ce-4b5c-43cf-a399-3af204074b86',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/big-by-carrefour-porto-alegre-partenon/d7a5534c-8274-421a-912f-5beb01b8fbe1',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/bistek---poa-astir-bela-vista/ece0c803-b8a8-4f6d-bb66-28c58b054b31',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/bistek-porto-alegre-vila-ipiranga/eec4c380-cab8-40e7-a2f5-d6e351ccb890',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/carrefour-hiper---cristal-cristal/bdc20aae-29c7-4e9b-8c24-255bbac3298f',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/carrefour-hiper---passo-dareia-passo-dareia/5ead54be-707e-4bca-8aff-931b685bd142',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/carrefour-hiper---porto-alegre-partenon/51b9e02a-74a8-4afc-8450-8094ae3318fa',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/center-shop---voluntarios-centro/287250c8-fc1d-46e8-a6a1-3c1002f01624',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/gecepel-independencia-independencia/7e1ab06c-d608-45f0-82ea-a2d8fce9efbc',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/leve-mais-atacados---maias-rubem-berta/2a80ff05-97e1-4854-a3b2-dc168d469f23',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/mercado-bampi-chacara-das-pedras/c0a3c85b-24d0-4c70-9689-b126a45dc3ee',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/mercado-brasco-moinhos-de-vento/4fef2d4c-83d7-485c-9a10-2ea99515a743',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/mercado-brasco---viva-open-mall-boa-vista/cebb7fd1-03de-40ed-8baf-beb750728b3c',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/mercado-do-bia-cristal/9ad5aaf5-4dfc-4140-9676-340be3faa6c2',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/nacional-cidade-baixa-cidade-baixa/5ab02d87-1675-4fe8-890e-e2a1a6093092',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/nacional-menino-deus-menino-deus/03cd3eae-331a-437d-8a17-fbb74d602657',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/rissul-express-floresta-floresta/a64f18d4-364c-4a08-a26e-6fd7722d3417',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/rissul-express-sao-geraldo-sao-geraldo/f5028fcc-9b73-40aa-8da8-7fee3d15bf9a',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/super-beck---protasio-morro-santana/b14daa68-f870-4fec-8b0f-2f5802d6f793',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/super-bem---porto-alegre-vila-sao-jose/089e951b-1718-4376-a007-8fea493dced0',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/super-lilo-cavalhada/9cce8255-18eb-47e7-b370-bc688ea87f4e',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/super-zefa-sarandi/d12a0ab7-05e8-4df1-8d16-f0dec9a9b5f3',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermago-cristo-redentor-passo-dareia/0ac5f595-dac5-4298-be34-9f9154f4ec80',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermago-passo-dareia-passo-dareia/2a0ba044-c381-4316-899b-f1fd3957da96',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermercado-dalmmer---petropolis-petropolis/a5e9cfb9-2339-426c-a0bd-11c1ec9afcb7',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermercado-draghetti---vl-sao-jose-vila-sao-jose/4472fa0e-5302-49c9-84a9-9382192cbc9c',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermercado-fabonato---cascata-cascata/73c48dca-1cef-456c-9938-0de93ed3b990',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermercado-gauchao---vicente-da-fontoura-santana/f903c1f8-d6bc-4c67-a78d-c65d1e4a6c70',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermercado-gringo---humaita-humaita/fd57b47f-e08d-43da-b024-3f1951a88fec',
         'https://www.ifood.com.br/delivery/porto-alegre-rs/supermercado-princesa-cristal/19fb820b-d29e-46d1-9b23-e8ab2fad1d88',
         'https://www.ifood.com.br/delivery/canoas-rs/todo-dia-canoas-rio-branco/26e3daaa-6684-43d9-9f4f-20408226f3b4')

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
lista_enderecos = ('Avenida Julio de Castilhos, 596, Centro, Porto Alegre - RS, Brasil')

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

Sys.sleep(5) # Aguarda 4 segundos para carregamento
  
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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_RS",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela