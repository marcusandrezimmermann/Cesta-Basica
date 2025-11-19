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
link = c('https://www.ifood.com.br/delivery/recife-pe/arco-mix---areias-estancia/80778fdf-655c-4c35-9a12-d47d90b69594',
         'https://www.ifood.com.br/delivery/olinda-pe/arco-mix---beberibe-aguas-compridas/b9767ad2-f2b5-491a-a107-a4676cd42a5e',
         'https://www.ifood.com.br/delivery/recife-pe/arco-mix---caxanga-caxanga/d82c5f9a-201a-4d79-91af-0dbb479f33e9',
         'https://www.ifood.com.br/delivery/recife-pe/atacadao-av-recife-areias/ba20dbd0-132f-46f4-90c6-c757a6988e2c',
         'https://www.ifood.com.br/delivery/recife-pe/atacadao-center-doces-sao-jose/8c223141-d5ce-4702-9622-521e8cfa8bc1',
         'https://www.ifood.com.br/delivery/recife-pe/atacadao-recife-iputinga-iputinga/5584e42e-0bd2-4b90-9ac0-73ffe9ff5030',
         'https://www.ifood.com.br/delivery/recife-pe/atacarejo-hiper-bem-cordeiro-cordeiro/cf99624d-e31c-48d0-9432-b397895e6fbd',
         'https://www.ifood.com.br/delivery/recife-pe/atacarejo-hiper-bem-varzea-varzea/320a6aed-4c68-4b84-8eff-4cdce30fe142',
         'https://www.ifood.com.br/delivery/recife-pe/barateiro---boa-viagem-boa-viagem/fe1f83d7-f87c-4a29-9863-ac2da13befb8',
         'https://www.ifood.com.br/delivery/recife-pe/barateiro---parnamirim-parnamirim/28d7b24f-d575-48af-b1f8-6018b220cb76',
         'https://www.ifood.com.br/delivery/recife-pe/big-bompreco-by-carrefour---av-recife-areias/f9a3834f-ef37-489d-b1bf-9f9b58ae3aab',
         'https://www.ifood.com.br/delivery/recife-pe/big-by-carrefour---recife-torre/2be2c7d7-46bc-4efb-bcc6-5288b6830d7e',
         'https://www.ifood.com.br/delivery/recife-pe/big-by-carrefour-shopping-tacaruna-santo-amaro/201a23fe-03d9-4c7c-bf02-9cce526b8ebb',
         'https://www.ifood.com.br/delivery/recife-pe/carrefour-hiper---av-recife-cacote/a207b171-049e-4364-832e-56385033f0fb',
         'https://www.ifood.com.br/delivery/recife-pe/carrefour-hiper---domingos-ferreira-boa-viagem/647b4604-63a7-4027-b8d9-aef79abef2fe',
         'https://www.ifood.com.br/delivery/recife-pe/carrefour-hiper---recife-torre/87522a1f-f63c-4b3b-9f6a-230e1534e7b2',
         'https://www.ifood.com.br/delivery/recife-pe/carrefour-hiper---shopping-tacaruna-santo-amaro/ab1b6f6c-2a83-4b95-b964-f6ba2445d7df',
         'https://www.ifood.com.br/delivery/recife-pe/casa-sao-paulo-boa-viagem/795b5080-7eab-40db-a019-a8e0423d070a',
         'https://www.ifood.com.br/delivery/recife-pe/center-doces---dantas-barreto-sao-jose/5bcaff35-81ae-4d47-a717-8ed87dfa6440',
         'https://www.ifood.com.br/delivery/recife-pe/center-doces---mercado-sao-jose-sao-jose/737eb821-ea78-4a83-b4ff-ed78f864f5b1',
         'https://www.ifood.com.br/delivery/recife-pe/deskontao-casa-amarela-casa-amarela/e23f83f0-0501-49cf-8d87-2022be4d5072',
         'https://www.ifood.com.br/delivery/recife-pe/deskontao-ceasa-curado/3b3ae6bb-ca76-422d-82e3-66dd7bf39afe',
         'https://www.ifood.com.br/delivery/recife-pe/extra---parnamirim-parnamirim/bd181f2e-c448-4e3b-bc50-31b85cd2b004',
         'https://www.ifood.com.br/delivery/recife-pe/extra---rosa-e-silva-gracas/9d6ced38-a77d-46ce-aa6b-6d4a6f5fc7a6',
         'https://www.ifood.com.br/delivery/recife-pe/extra-derby-boa-vista/c5942f9c-a5bc-4776-ab97-c6bd477088d3',
         'https://www.ifood.com.br/delivery/recife-pe/extra-fresh---derby-boa-vista/85811ead-90d7-4a2b-b0c7-ed3800454afd',
         'https://www.ifood.com.br/delivery/recife-pe/gmerkado-prado/a120d578-2328-448a-a449-d942437a7375',
         'https://www.ifood.com.br/delivery/olinda-pe/ideal-mix-atacarejo-jardim-brasil/641e3f21-e30f-40d1-9382-c0ccfbce0924',
         'https://www.ifood.com.br/delivery/recife-pe/minuto-pao-de-acucar---domingos-ferreira-boa-viagem/5c38b244-d586-4c8a-9958-f056c984ca67',
         'https://www.ifood.com.br/delivery/recife-pe/minuto-pao-de-acucar---gracas-gracas/34cb16ee-35b3-496e-b585-e92507e02684',
         'https://www.ifood.com.br/delivery/recife-pe/minuto-pao-de-acucar---navegantes-boa-viagem/9562b6c9-9e1b-477f-b3d0-f05815a09eea',
         'https://www.ifood.com.br/delivery/recife-pe/novo-atacarejo---bongi-san-martin/f77d5bc1-c042-4118-9af0-66fca96c31ce',
         'https://www.ifood.com.br/delivery/recife-pe/palato-supermercado-recife-pina/19dae990-66eb-4ac5-a59c-663295d4aa93',
         'https://www.ifood.com.br/delivery/recife-pe/pao-de-acucar---parnamirim-parnamirim/50b765a8-493c-42eb-aec6-aa6406132d22',
         'https://www.ifood.com.br/delivery/recife-pe/pao-de-acucar---rosa-e-silva-gracas/5e902113-aa84-4129-af58-22da473eec5e',
         'https://www.ifood.com.br/delivery/olinda-pe/preco-bom-supermercado-peixinhos/a35efd6a-2ff7-4689-b752-e3dfab6f42eb',
         'https://www.ifood.com.br/delivery/recife-pe/rende-mais-supermercado-iputinga-iputinga/4b531b21-5aea-46a7-a977-a9304b41c760',
         'https://www.ifood.com.br/delivery/recife-pe/soberano---espinheiro-espinheiro/3a3926cf-f134-46fd-987c-8c0cb61a1758',
         'https://www.ifood.com.br/delivery/recife-pe/super-bompreco-espinheiro-aflitos/6d862492-5b99-40a0-bd97-82c5e2fca6c9',
         'https://www.ifood.com.br/delivery/recife-pe/super-bompreco-parque-amorim-boa-vista/cd027eed-3bd0-469e-89a9-88146f4f9386',
         'https://www.ifood.com.br/delivery/olinda-pe/supermercado-supremo-olinda-bairro-novo/7c55d709-19b9-4464-b60a-4465ff6272d4',
         'https://www.ifood.com.br/delivery/recife-pe/supermercado-supremo-santo-amaro-santo-amaro/fa4c9aad-0183-4b93-a7ff-ba73102c4162',
         'https://www.ifood.com.br/delivery/recife-pe/varejao-do-mane-pina/50f058fe-1483-4ae6-bbc9-53dcf108286e',
         'https://www.ifood.com.br/delivery/recife-pe/verdfrut-casa-forte-casa-amarela/4fc3d53c-2146-472a-92f6-265625313702')

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
lista_enderecos = ('Rua João Fernandes Viêira, 43, Soledade Recife - PE, Brasil')
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

Sys.sleep(3) # Aguarda 3 segundos para carregamento
  
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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_PE",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela