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
link = c('https://www.ifood.com.br/delivery/goiania-go/bretas---goiania-shopping-setor-bueno/7484b809-9156-4713-b05a-69e6d5ae4e89',
         'https://www.ifood.com.br/delivery/goiania-go/carrefour-hiper---goiania-sul-jardins-goias/0e356489-2ab2-49d2-906e-5e5c91eada52',
         'https://www.ifood.com.br/delivery/goiania-go/emporio-caseiro-setor-marista/be858bdd-f7c1-4bc5-ad84-8649eb19c46e',
         'https://www.ifood.com.br/delivery/goiania-go/emporio-prime-jardim-goias/f5eb3e2c-e565-4713-aba8-a80eaf268936',
         'https://www.ifood.com.br/delivery/goiania-go/express-by-mega--goiania-setor-bueno/1db7d1b2-67cf-4fa4-ad4b-1ce06b564573',
         'https://www.ifood.com.br/delivery/goiania-go/extra---flamboyant-jardim-goias/d039140d-454d-4bc9-a86e-742e4664abdd',
         'https://www.ifood.com.br/delivery/goiania-go/extra---vaca-brava-setor-bueno/019ba4fa-5dc1-4d2a-8fb0-62bdc239b60d',
         'https://www.ifood.com.br/delivery/goiania-go/hiper-moreira---jd-goias-jardim-goias/bef53879-464d-4ff8-bb95-768e657a451d',
         'https://www.ifood.com.br/delivery/goiania-go/nsa-supermercado-bueno-set-bueno/9bc2624d-37e2-470d-9864-a968d55ac025',
         'https://www.ifood.com.br/delivery/goiania-go/nsa-supermercado-oeste-set-oeste/80d00f39-4283-4ff7-a07c-8dc46896bf98',
         'https://www.ifood.com.br/delivery/goiania-go/oba-hortifruti---flamboyant-jardim-goias/ef7a8a46-398d-48ca-836e-27b95cbfbb95',
         'https://www.ifood.com.br/delivery/goiania-go/oba-hortifruti---t63-setor-bueno/79570d59-fdaa-4045-9a92-8bc9a37ffb15',
         'https://www.ifood.com.br/delivery/goiania-go/pao-de-acucar---flamboyant-jardim-goias/a36311fd-34aa-4496-a700-dd1688e92910',
         'https://www.ifood.com.br/delivery/goiania-go/pao-de-acucar---praca-tamandare-setor-oeste/af38a8e2-c9b5-4f74-b46c-3177aced8286',
         'https://www.ifood.com.br/delivery/goiania-go/pao-de-acucar-fresh---goiania-st-bueno/10edd949-0c5b-4a22-885a-6159c0beee5c',
         'https://www.ifood.com.br/delivery/goiania-go/supermercado-barbosa----vila-concordia-vila-concordia/6f8162d7-72c2-4e33-8d26-300818d911c4',
         'https://www.ifood.com.br/delivery/goiania-go/supermercado-barbosa-jd-guanabara-jardim-guanabara/6cf00312-651e-4b3d-a9f8-77d93bb1e61a',
         'https://www.ifood.com.br/delivery/goiania-go/supermercado-mega-vizinho-setor-bueno/11288e1d-f241-4db1-9dd4-1db6e378cdf6',
         'https://www.ifood.com.br/delivery/goiania-go/supermercado-royal-aeroviario/2099a00c-af7c-458b-8392-87d9a19e4be7',
         'https://www.ifood.com.br/delivery/aparecida-de-goiania-go/supermercado-uaifood-jardim-bela-vista---continuacao/0a57d6a3-98dd-4fa2-ae28-03d1f0ac70fb')

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
lista_enderecos = ('Avenida Independencia, 942, Setor Leste Vila Nova, Goiânia - GO, Brasil')
complemento = ('Qd 943 Lt 33')
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
Sys.sleep(2) # Aguarda 2 segundos para carregamento

confirma_localizacao <- remDr$findElement(using='xpath', value="/html/body/div[5]/div/div/div/div/div/div[3]/div[2]/button") # Procura botão para confirmação
confirma_localizacao$clickElement() # Clica no botão para confirmação
Sys.sleep(2) # Aguarda 2 segundos para carregamento

adiciona_complemento <- remDr$findElement(using='xpath', value='/html/body/div[5]/div/div/div/div/div/div[3]/div[1]/div[2]/form/div[1]/div[2]') # Procura campo de input de complemento
adiciona_complemento$clickElement() # Clica no campo de input de endereço
adiciona_complemento2 <- remDr$findElement(using='xpath', value='/html/body/div[5]/div/div/div/div/div/div[3]/div[1]/div[2]/form/div[1]/div[2]/label/input') # Procura campo de input de complemento
adiciona_complemento2$sendKeysToElement(list(complemento)) # Escreve o endereço no campo adequado

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
Sys.sleep(3) # Aguarda 3 segundos para carregamento

### Limpeza

campo_de_pesquisa$clearElement() # Limpa campo de pesquisa
}
}
remDr$close() # Fecha browser

### 2.4 - Exportando a base de dados para um csv 

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_GO",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela