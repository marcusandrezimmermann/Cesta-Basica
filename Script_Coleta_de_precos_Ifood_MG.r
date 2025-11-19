###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "25/03/2024"

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
link = c('https://www.ifood.com.br/delivery/belo-horizonte-mg/abc-varejo-horto-belo-horizonte--loja-68-horto/ce8f4ab0-4ca8-41d4-bb76-dcf4dc300c92',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/apoio-mineiro---horto-horto/5035a330-b690-4e47-a608-556aa0c055b0',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/apoio-mineiro---sao-francisco-nova-cachoeirinha/4b934616-5d83-4b9b-a3bf-289c65f0c6c7',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/araujo-mercado-lourdes---31-lourdes/3f489417-7bbe-46e0-8aee-6cbe2fc4a57f',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/assai---belvedere-santa-lucia/40d57b21-8f42-492a-8e5a-da6c2fff5b1d',
         'https://www.ifood.com.br/delivery/contagem-mg/atacadao---contagem-shopping-cidade-industrial/4c9bd77b-7236-455a-943c-269f9df7d07c',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/atacadao-pampulha-itapoa/505ff1df-86dc-49b7-a959-055ac5958d52',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/bem-hortifruti-prado-prado/d3620062-2360-4fd5-86ea-3dad9928eefd',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/bem-viver-supermercado-e-padaria-jardim-america/3611ddca-2e00-4076-b3ba-bdff4f5fc942',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/big-by-carrefour---america-santa-efigenia/31b4144c-5160-42fa-8cc1-9ab6f87f7dee',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/big-by-carrefour---pampulha-engenho-nogueira/32fed41b-4825-44ab-8746-4ca5e40d04e2',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/carrefour-hiper---bh-america-santa-efigenia/a88b27ca-5569-4869-bc42-796a0e7f5d99',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/decisao-atacarejo---pedro-ii-bonfim/d969adc5-d262-4ad2-8433-05a7981f22f8',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/del-rey---super-varejista-dom-bosco/06ff8ad0-0709-41ef-8071-99f303cdcb32',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/del-rey---super-varejista-cachoeirinha/6d7c6389-7575-471c-ab36-d16f42a0d8bd',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/dia-supermercado---afonso-pena-boa-viagem/250c32bc-58c6-4b7f-800c-9452082f0bfe',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/dia-supermercado---joao-arantes-cidade-nova/6372c954-d0a7-412d-bdad-87230fa7d3be',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/dia-supermercado---rua-da-bahia-ii-centro/975b7961-c4c6-4c9c-8653-afcd71daac05',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/dia-supermercado---santo-agostinho-santo-agostinho/cbfcc810-193b-488a-9802-9c474a7e9e88',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/express-by-daki--prado-prado/f77dfa75-de69-4438-854c-aeac6f440b44',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/express-by-daki--savassi-savassi/a2b620fa-9898-4dcf-b279-953eaadcadb2',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/global-hortifruti-centro/7cf7ea24-675a-415e-9aee-7ea625f6440f',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/hortisul---gutierrez-gutierrez/4593c40c-b69b-4398-8db1-278fd3bfe714',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/hortisul-cruzeiro-anchieta/2eb2f625-11af-4dd5-af13-e5f2636065a3',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/la-no-mercado---centro-centro/7d9a4228-853c-4b4b-8b8c-f40fdfe0720f',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/loja-das-frutas-centro/2874ecc9-779c-45cd-9440-5f078e69aab5',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/meu-prata-supermercado---boa-vista-boa-vista/2cf9e73f-fbb7-4898-ba19-4b3e2dc9b58b',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/santa-tereza-super-varejista-santa-teresa/c500592c-ef26-444c-9cb2-bcfdcbec90e6',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/slap-mercado-dos-doces-e-mercearia-centro/2e86feae-4eac-46bd-97ec-1f88bf6b01fb',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/super-varejao-da-fartura-padre-eustaquio/e3887f87-fd45-4483-9c4f-551feadd763b',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/super-vivo----super-varejista-cachoeirinha/2ff8aba9-fd77-443a-867f-63aecff27d53',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-baratao---super-varejista-goiania/91c0be96-d0fe-4c33-8a37-d21ed7474e57',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-bonissima-lourdes/f473ff19-7cd8-4538-8338-a175ba39811d',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-canada-santa-maria/851be49f-678c-44ab-8a9a-a4a2d854da26',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-moreirao-nova-vista-nova-vista/ec24894a-fd89-4182-8fe3-66ab25446e4b',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-super-maximus-jardim-sao-jose/ab1d3529-cb18-4b0d-86a8-83ff40fd4e28',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-supermais-colegio-batista/4cb7f085-9d34-42f9-8f28-88c52a37d33f',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercados-suprilar-frei-eustaquio/2d75d8f4-0f26-4448-8d51-9fd551a05078',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supermercado-vitoria---super-varejista-horto-florestal/fada7eff-9d1a-45c8-8641-4067c7e8daab',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supernosso---hot-point-cidade-nova-cidade-nova/47b8fc18-6e01-4433-9180-8ea99148182b',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supernosso---santa-tereza-santa-tereza/23c14d2b-8984-423b-9abd-0c1949b94d0d',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supernosso-funcionarios-funcionarios/34d09350-0411-42a6-911c-22e5a9659197',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supernosso-momento---lourdes-lourdes/a6d45fed-66f6-43a7-b56c-488cff9e2f55',
         'https://www.ifood.com.br/delivery/belo-horizonte-mg/supernosso-momento-centro-lourdes/cd79a10a-2de8-4732-a422-19e4bc9d1643')

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

lista_produtos = c('Arroz tipo 1', 'Feijão carioca', 'Farinha de trigo', 'Batata kg', 'Tomate kg', 'Pão francês', 'Café', 'Banana kg', 'Açúcar refinado', 'Óleo de soja', 'Manteiga','Coxão mole', 'Coxão duro', 'Patinho', 'Leite integral 1L')
lista_enderecos = ('Rua Tamoios, 200, Centro, Belo Horizonte - MG, Brasil')

### 2.3 - Buscando preços na internet e capturando os mesmos 

dframe_total = data.frame() #definindo o data frame geral

### Abrindo navegador

remDr <- remoteDriver(remoteServerAddr = "localhost", 
                      browserName = "chrome") # Inicia o driver
remDr$open() # Abre navegador/browser
remDr$maxWindowSize() # Maximiza a janela do navegador
remDr$navigate(site) # Navega pelo link
Sys.sleep(4) # Aguarda 4 segundos para carregamento

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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_MG",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela