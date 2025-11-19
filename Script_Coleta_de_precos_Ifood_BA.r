###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "21/03/2023"

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
link = c('https://www.ifood.com.br/delivery/salvador-ba/apipao-jardim-apipema/a379480e-7696-409e-b768-56d5b8770d1e',
         'https://www.ifood.com.br/delivery/salvador-ba/atacadao-salvador-bonoco-brotas/e5bca1e9-471d-4f7d-9de8-9fa7b3718f64',
         'https://www.ifood.com.br/delivery/salvador-ba/atacadao-salvador-iguatemi-caminhos-das-arvores/03f92499-c79e-4e3f-82d0-4745e04f4217',
         'https://www.ifood.com.br/delivery/salvador-ba/atacadao-salvador-mares-mares/be5cc7c6-2778-4b78-8bc0-753cccc88f4a',
         'https://www.ifood.com.br/delivery/salvador-ba/atacado-cestao-do-povo---sete-portas-barbalho/c846227a-da67-4f06-971a-a2175b2f47a0',
         'https://www.ifood.com.br/delivery/salvador-ba/bompreco-rio-vermelho-rio-vermelho/69f6af91-7678-4dea-ba23-af35e5284990',
         'https://www.ifood.com.br/delivery/salvador-ba/cesta-premium---armacao-armacao/9ea4d5a3-7a25-4351-9017-832fbb031831',
         'https://www.ifood.com.br/delivery/salvador-ba/crisboni-supermercado-garcia/ed9d74ab-4176-405d-ba8a-611df8d9a7f3',
         'https://www.ifood.com.br/delivery/salvador-ba/delliporto-delicatessen-barra/a3872288-7652-495c-8a0a-11a27e161d8b',
         'https://www.ifood.com.br/delivery/salvador-ba/emporio-garcia-garcia/ed9d74ab-4176-405d-ba8a-611df8d9a7f3',
         'https://www.ifood.com.br/delivery/salvador-ba/extra---salvador-costa-azul/ea4539e0-643c-445a-a256-6456670058b3',
         'https://www.ifood.com.br/delivery/salvador-ba/g-mix-supermercado-pituba-pituba/dbe611ac-d921-47af-9d6b-5c39a2e03dc6',
         'https://www.ifood.com.br/delivery/salvador-ba/gbarbosa---salvador-costa-azul/8d328c9b-f581-48ce-a9a5-994bdda28d4d',
         'https://www.ifood.com.br/delivery/salvador-ba/mercado-central-alto-das-pombas/0d993782-1a05-4967-83d4-e90830cf016b',
         'https://www.ifood.com.br/delivery/salvador-ba/mercado-dfabrica-centenario-garcia/13b19ad0-74d7-471f-832f-c28abea57c98',
         'https://www.ifood.com.br/delivery/salvador-ba/mercado-smix-candeal/e713652f-566b-413c-adcc-6fd8957c320c',
         'https://www.ifood.com.br/delivery/salvador-ba/mercantil---salvador-agua-de-meninos/eadf0768-b468-4596-9779-a3163e087f0b',
         'https://www.ifood.com.br/delivery/salvador-ba/mercantil---san-martin-fazenda-grande-do-retiro/d908953d-29b1-4f3a-a40b-81de461c2fcd',
         'https://www.ifood.com.br/delivery/salvador-ba/mix-bahia---federacao-federacao/7e548693-e809-4327-b6b4-4aaa5814a85a',
         'https://www.ifood.com.br/delivery/salvador-ba/mix-bahia-brotas-brotas/9ca75c52-2109-4203-93fd-1d0e9ea90619',
         'https://www.ifood.com.br/delivery/salvador-ba/novo-varejo---politeama-politeama/4ce850f7-0c5e-40e6-bad7-18ba8bd4d877',
         'https://www.ifood.com.br/delivery/salvador-ba/ondina-delicatessen-ondina/7e6533ff-5e3e-4eab-9649-7b3bc3c9c8c8',
         'https://www.ifood.com.br/delivery/salvador-ba/pao-de-acucar---costa-azul-costa-azul/a905c556-9807-4c27-a83e-e41aa68e2bec',
         'https://www.ifood.com.br/delivery/salvador-ba/perini---salvador-vasco-da-gama/342745e1-9ea2-48a7-98ae-c23bc403e7ad',
         'https://www.ifood.com.br/delivery/salvador-ba/super-bompreco-canela-canela/6d58acd9-ddbf-4599-b40b-098df533a5a3',
         'https://www.ifood.com.br/delivery/salvador-ba/super-bompreco-chame-chame-chame-chame/c7488243-28e2-4cdc-9d49-aa51a3264982',
         'https://www.ifood.com.br/delivery/salvador-ba/todo-dia-rodoviaria-setor-bumerangue/e0da3341-632a-4e15-93ad-1eac9a051199',
         'https://www.ifood.com.br/delivery/salvador-ba/victorine-delicatessen-matatu/6356dada-c697-4fa2-a49d-776062fb08ef')

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
lista_enderecos = ('Rua General Labatut, 65, Barris, Salvador - BA, Brasil')
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
Sys.sleep(2) # Aguarda 2 segundo para carregamento

adiciona_referencia <- remDr$findElement(using='xpath', value='/html/body/div[5]/div/div/div/div/div/div[3]/div[1]/div[2]/form/div[2]/div/label') # Procura campo de input de complemento
adiciona_referencia$clickElement() # Clica no campo de input de endereço
adiciona_referencia$sendKeysToElement(list(referencia)) # Escreve o endereço no campo adequado

salva_endereco <- remDr$findElement(using='xpath', value="/html/body/div[5]/div/div/div/div/div/div[3]/div[1]/div[2]/form/div[4]/button/span") # Procura botão para salvamento
salva_endereco$clickElement() # Clica no botão para salvamento
Sys.sleep(3) # Aguarda 3 segundo para carregamento

### Entrando em cada mercado

for(h in 1:length(link)){  #criando um looping para processar todos os produtos

remDr$navigate(link[h]) # Navega pelo link

Sys.sleep(2) # Aguarda 2 segundos para carregamento
  
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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_BA",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela