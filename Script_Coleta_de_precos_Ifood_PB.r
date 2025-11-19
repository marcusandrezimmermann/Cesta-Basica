###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "12/03/2024"

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
link = c('https://www.ifood.com.br/delivery/joao-pessoa-pb/atacadao-joao-pessoa-ernesto-geisel/763fe32e-64bc-497f-bf10-72fe1eb2ab9a',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/barateiro---bancarios-jardim-cidade-univer/b89b08ce-0665-45d7-8480-a27c9728a35b',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/big-by-carrefour---bancarios-jardim-sao-paulo/6454078c-f116-45a7-a642-f01e57bbc985',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/big-by-carrefour-joao-pessoa-aeroclube/e97582ff-23c7-4cc4-9bd6-856c2b0c5287',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/carrefour-hiper---bancarios-jd-sao-paulo/9cf1f48a-bab6-4d5f-9c5e-1a3b3f9c760b',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/extra---bancarios-jardim-cidade-univer/d5f3cb5f-68e2-420e-8321-0173a70207c7',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/extra---joao-pessoa-bessa/89b35cac-0535-4100-9bdb-2c281f0bdb6d',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/extra---miramar-miramar/a618aec4-23d7-416c-a34f-13cca40c7109',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/mercatto-bancarios-jardim-cidade-universitaria/346f5a6a-e32d-4505-b493-ca4ce9961810',
         'https://www.ifood.com.br/delivery/cabedelo-pb/novo-atacarejo---forrock-morada-nova/28604ff2-28e2-41ce-8f95-1fe2d6475a49',
         'https://www.ifood.com.br/delivery/bayeux-pb/o-cestao-supermercados---bayeux-sesi/d6c818ac-cf6e-4b8a-8725-e3e584123fd2',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/o-cestao-supermercados-geisel-ernesto-geisel/52a5e726-f011-48a4-afe9-97497b06eacc',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/pao-de-acucar---bessa-bessa/31da2813-33bc-4df8-80a5-2ae4990d75d5',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/pao-de-acucar---miramar-miramar/43368532-e542-41d0-bc17-a7efd6f2902d',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/redecompras-aeroclube-aeroclube/4d877e20-523a-4146-b029-6af4e06eaf99',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/supermercado-iob-manaira/ef2fd4b4-3eb2-4872-afcb-e1694acda9e4',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/supermercado-litoral-altiplano--altiplano-cabo-branco/41a7cc20-60d6-4feb-9bee-d2f2394a7db8',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/supermercado-preco-real-jardim-sao-paulo/a7f5c1c6-fa86-4091-9065-d2c018104a5a',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/supermercado-santo-andre-cruz-das-armas/dedcce8b-4233-4539-b561-e015f21ff9de',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/supermercado-uniao-roger/e9aa7855-f222-4100-8f79-79f6445eeedb',
         'https://www.ifood.com.br/delivery/joao-pessoa-pb/verdfrut-tambau-tambau/b36f1223-9a50-4d22-87dc-ea48b829cc48')

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
lista_enderecos = ('Rua Cruz Cordeiro, 75, Varadouro, João Pessoa - PB, Brasil')
referencia = ('DIEESE')

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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_PB",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela