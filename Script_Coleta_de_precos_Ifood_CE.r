###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "21/03/2024"

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
link = c('https://www.ifood.com.br/delivery/fortaleza-ce/atacadao---fortaleza-papicu-papicu/549787dd-57ab-4d03-bf36-2da14532e81b',
         'https://www.ifood.com.br/delivery/fortaleza-ce/atacadao-fortaleza-br116-dias-macedo/34f6b00f-3f0f-4916-97cd-a5cfef815a16',
         'https://www.ifood.com.br/delivery/fortaleza-ce/atacadao-fortaleza-vila-peri-vila-peri/d2078cfb-f349-4030-9cff-5566aaa3be64',
         'https://www.ifood.com.br/delivery/fortaleza-ce/barateiro---aguanambi-fatima/9f5d4c71-e0c3-4662-aa10-547e5627aa3e',
         'https://www.ifood.com.br/delivery/fortaleza-ce/barateiro-fortaleza-fatima/86ce79b9-0b0f-409e-ba51-704aef94f90f',
         'https://www.ifood.com.br/delivery/fortaleza-ce/casa-do-chocolate---centro-centro/e102d311-7310-47fb-8299-744da10130be',
         'https://www.ifood.com.br/delivery/fortaleza-ce/casa-do-chocolate---montese-montese/81657267-bdc3-4f91-95c4-c80f6eabb852',
         'https://www.ifood.com.br/delivery/fortaleza-ce/centerbox-jose-bastos---express-benfica/f97e40aa-879f-42aa-b507-74a286a8506a',
         'https://www.ifood.com.br/delivery/fortaleza-ce/centerbox-santos-dumont-papicu/d3619074-ca46-40da-a2b3-c994d7dac7aa',
         'https://www.ifood.com.br/delivery/fortaleza-ce/do-povo-mini-market---meireles-meireles/58e9076a-f231-461e-b2f8-6dddeefbba06',
         'https://www.ifood.com.br/delivery/fortaleza-ce/extra---fatima-fatima/9adbc89d-8879-48ff-83a3-72f2130b95dd',
         'https://www.ifood.com.br/delivery/fortaleza-ce/extra-fresh---seis-bocas-jardim-das-oliveiras/0c356673-79e9-4d81-a501-16ab1275f1d0',
         'https://www.ifood.com.br/delivery/fortaleza-ce/extra-fresh---mucuripe-macuripe/d597a579-1dea-49a9-be00-567e2297c5d6',
         'https://www.ifood.com.br/delivery/fortaleza-ce/extra-fresh---rodoviaria-fatima/733f7242-6983-41c7-ae80-d9f81ea010eb',
         'https://www.ifood.com.br/delivery/fortaleza-ce/gbarbosa---fortaleza-aldeota/cfedf19d-9adb-449a-a361-35dcf4167fb7',
         'https://www.ifood.com.br/delivery/fortaleza-ce/leblon-mix-atacarejo-padre-andrade/3e95cd8c-ed7d-482c-b6d7-e45b4209638c',
         'https://www.ifood.com.br/delivery/fortaleza-ce/liderbox-supermercados-alto-da-balanca/b9643650-93bb-4476-b4bc-9cddb65160c2',
         'https://www.ifood.com.br/delivery/fortaleza-ce/marques-supermercado-montese/43e1af8f-233e-4b3e-b851-831678962ef5',
         'https://www.ifood.com.br/delivery/fortaleza-ce/mercadinho-agape-frios---sapiranga-sapiranga-coite/5372e1f9-9595-4ca6-a510-558ddc80592a',
         'https://www.ifood.com.br/delivery/fortaleza-ce/mercadinho-ximenes-serrinha/82163275-45c7-40c0-9a1c-7efdfd3714f5',
         'https://www.ifood.com.br/delivery/fortaleza-ce/pao-de-acucar---fatima-fatima/87ba38bf-612d-470d-a9d2-79e8946a7025',
         'https://www.ifood.com.br/delivery/fortaleza-ce/pao-de-acucar-fresh---sao-gerardo-sao-gerardo/5138b7e5-27e4-4c23-97fa-28d130dc37e6',
         'https://www.ifood.com.br/delivery/fortaleza-ce/super-do-povo---guararapes-guararapes/28bfc814-3ee0-4254-825c-93256108f8e6',
         'https://www.ifood.com.br/delivery/fortaleza-ce/super-do-povo---passare-passare/4fa9b35b-5c0b-4012-98ba-8890ba102210',
         'https://www.ifood.com.br/delivery/fortaleza-ce/super-lagoa-rodolfo-teofilo-rodolfo-teofilo/01bc2354-902e-4564-918a-ed5438bd9c1c',
         'https://www.ifood.com.br/delivery/fortaleza-ce/supermercado-pinheiro---praia-iracema-iracema/03ec7878-7a3b-4291-81bf-7f7491bbe61f')

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

lista_produtos = c('Arroz tipo 1', 'Feijão carioca', 'Farinha de mandioca', 'Tomate kg', 'Pão francês', 'Café', 'Banana kg', 'Açúcar refinado', 'Óleo de soja', 'Manteiga','Coxão mole', 'Coxão duro', 'Patinho', 'Leite integral 1L')
lista_enderecos = ('Rua Vinte e Quatro de Maio, 1289, Centro, Fortaleza - CE, Brasil')
referencia = ('DIEESE')

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
Sys.sleep(3) # Aguarda 3 segundos para carregamento

confirma_localizacao <- remDr$findElement(using='xpath', value="/html/body/div[5]/div/div/div/div/div/div[3]/div[2]/button") # Procura botão para confirmação
confirma_localizacao$clickElement() # Clica no botão para confirmação
Sys.sleep(2) # Aguarda 2 segundos para carregamento

adiciona_referencia <- remDr$findElement(using='xpath', value='/html/body/div[5]/div/div/div/div/div/div[3]/div[1]/div[2]/form/div[2]/div/label') # Procura campo de input de complemento
adiciona_referencia$clickElement() # Clica no campo de input de endereço
adiciona_referencia$sendKeysToElement(list(referencia)) # Escreve o endereço no campo adequado

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
Sys.sleep(2) # Aguarda 2 segundos para carregamento

### Limpeza

campo_de_pesquisa$clearElement() # Limpa campo de pesquisa
}
}
remDr$close() # Fecha browser

### 2.4 - Exportando a base de dados para um csv 

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_CE",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela