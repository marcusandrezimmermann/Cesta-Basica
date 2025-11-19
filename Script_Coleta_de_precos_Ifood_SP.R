###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "28/03/2024"

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
link = c('https://www.ifood.com.br/delivery/sao-paulo-sp/a-vendinha-mercado-pinheiros/f9180af2-acd1-4f9b-9fc1-1ef3a0f673a7',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/atacadao---vila-guilherme-vila-guilherme/7609d2e1-f0c5-497a-a5e1-3d6b4581f49a',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/atacadao-pacaembu-barra-funda/31dbd467-bb46-4884-8879-e545789acc39',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/barateiro---frei-caneca-cerqueira-cesar/4e9a549b-3644-4729-b2d3-17534ab770e8',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/big-by-carrefour-pamplona-jardim-paulista/404f0376-6d49-4f2f-a96c-00ecd66540c7',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/carrefour-express---maria-antonia-consolacao/18a4de2e-a958-471a-9013-4d54394ee898',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/carrefour-hiper---casa-verde-casa-verde/ad041803-fe60-42b8-acbf-cec17b9ceb3d',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/carrefour-hiper---pamplona-jardim-paulista/b06518dd-4c48-4e0e-8f19-277baaa0772f',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/carrefour-market---higienopolis-higienopolis/e15e6285-4fc2-4963-bc3d-a1180bc441e8',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/compre-bem---cambuci-cambuci/0883b872-b89e-4fc0-b921-725ce2e1b2aa',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/dia-supermercado---celso-azevedo-parque-da-mooca/e11cb172-1f4b-4590-bf72-1b0e4f60de69',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/dia-supermercado---fagundes-filho-vila-monte-alegre/86228431-5d6d-4080-ba68-5ae7e986ba13',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/dia-supermercado---r-rego-freitas-republica/346452a5-b4b0-41e2-b94a-76afa1dfc8ab',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/dia-supermercado---teodoro-sampaio-pinheiros/019b4a0f-4db6-4305-8223-f1304ab3d9cd',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/emporio-paulista---jabaquara-jabaquara/e2328c55-960e-4fc9-b0d1-574847fa0576',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/emporio-paulista---vila-da-saude-vila-da-saude/d145f54d-8b98-4630-83a7-f79682c26783',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/emporio-quatro-estrelas-perdizes/abda3599-8f5e-480b-a2e1-eb6cdaff0aaf',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/express--consolacao-consolacao/686ebcf0-2a70-401b-8fb9-4f534b1f6dca',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/express-by-daki--santa-cecilia-santa-cecilia/c80de91c-ceb0-416e-a06b-ec5071f2f4ce',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/extra-fresh---cambuci-cambuci/6c2a60a2-db79-4bd1-b2fb-61153c2242db',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/extra-fresh---liberdade-liberdade/cf788380-88aa-46ae-b811-773213e1183c',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/extra-hiper---ricardo-jafet-vila-santa-eulalia/52c1bc7d-6ac9-489e-a31b-579f1bc4901b',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/extra-rego-freitas-republica/f2b11430-e82f-41c2-8147-5d997258bb7e',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/galeria-dos-paes---mercado-jardim-america/0347f8f7-3bfa-44df-b513-c54491022b3b',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/hirota---aclimacao-aclimacao/0af989f4-8396-474a-be4a-8a99798f590c',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/hirota---ed-italia-republica/4d32b942-8394-4b76-9291-052024355ad7',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/hortifruti-sabor-da-roca-aclimacao/750cf514-6e0a-4029-ae14-26a11929a5cb',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/kuchos-atacado-e-varejo-sao-paulo/0a9785ad-c2c6-443a-91a8-2619e9ad7640',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/lelis-supermercados-mooca-vila-bertioga/6737bd17-c66b-4c7b-aa99-9dee5f3af654',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/marsil-hipermercado-dos-doces-pari/d3ce4a76-7668-468c-be6f-4e600280e3de',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercadinho-copa-vila-palmeiras/fb4cfa69-4a25-4059-a85e-3441028bb797',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-adj-vila-mariana-vila-clementino/8835dae8-ae52-470f-a152-d8b1d4cb7441',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-levo-ja-bom-retiro/a3d1942c-4d3b-4e5f-b3bf-fd413e7ff45b',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-mais-mix-casa-verde-alta/24439e6a-2314-4aab-aaed-379289e36848',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-maximo-perdizes-perdizes/b05a679b-afaa-4823-b324-60d41513aff3',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-remax-cerqueira-cesar/a3cf8a1c-08e9-48e3-9724-5663e39a2444',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-shalon-barra-funda-bom-retiro/bee17838-8d70-4afa-be73-809873bf21e5',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mercado-tudo-tem-vila-mariana-vila-clementino/30cf5386-606e-4177-9319-1ab1fd9442d9',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/minha-cestinha-589-vila-buarque/596e3a42-3d19-4f05-a4f2-bbfe5932faa2',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/mini-extra-largo-do-arouche-republica/5190ffc0-c5c5-4e0d-a569-c01447afe05f',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/minuto-pao-de-acucar-paim-bela-vista/33df4b42-2102-4fa7-8f62-a2f216b9df58',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/natural-da-terra-rosa-e-silva-santa-cecilia/ce5cc2e2-ff32-46c4-8093-59c71b19a711',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/oba-hortifruti---angelica-santa-cecilia/ce1ca05d-9105-4ceb-984d-0390ebefd1f4',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/oxxo---consolacao-consolacao/4ccb6c77-1b34-4cb7-9dc8-28f79e2e5853',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/pao-de-acucar---brigadeiro-bela-vista/2b63875a-e5fa-41de-aefe-89155a6f66c6',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/pao-de-acucar---maria-antonia-higienopolis/8afe27f8-34c7-484c-a8fb-003acfc2268c',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/pao-de-acucar---ricardo-jafet-jd-vila-mariana/cfc4dcd4-2a04-433c-a731-61ee19e65eb5',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/pao-de-acucar-fresh---higienopolis-higienopolis/70064912-b300-4b30-8568-32b1bb0eacaa',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/pao-de-acucar-fresh-perdizes-perdizes/57ba9497-12ac-437a-b72a-b3abe77ed2bd',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/quitanda-pinheiros/efe332d7-74fa-48a8-949d-ac1a45ab4738',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/real-mercado-mooca-mooca/acfa50dc-f129-4771-bba2-837029ec7a0d',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/recanto-supermercado-butanta/e1e814c7-9a9b-479b-9cfb-1b32b6b02069',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/ricoy---cambuci-36-aclimacao/afa1d0ff-f8e8-415a-900e-d26f7e925a27',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/roldao---mooca-hipodromo-bras/12945dc4-9474-4f9b-9567-2d9d3c455c56',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/roldao---santana-carandiru/a35a2d84-4880-4ff2-9f13-9787c2f2e758',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/supermercado-dona-maria-vila-libanesa/d5a51f23-5981-4f1b-97af-cd644b17eb39',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/supermercado-maceio-consolacao/3326e598-e655-46c8-a2b3-de144693a58b',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/supermercado-santa-gemma-vila-clementino/fb65594f-2d24-4f1d-a097-4528f511b293',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/trimais-supermercados---lauzane-lauzane-paulista/bcdf5967-c9c7-4f39-9482-9bc18ab32374',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/varanda---patio-paulista-bela-vista/31659a80-7634-4395-b50d-a3769b1b9dc5',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/varanda-cidade-jardim-cidade-jardim/93550b9e-f2d0-489f-86f3-3825238e848b',
         'https://www.ifood.com.br/delivery/sao-paulo-sp/vila-das-frutas---lj-4-turmalina-aclimacao/ebedd9fe-eaec-4b4b-89b1-813dfd6d0918')

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
lista_enderecos = ('R. Aurora, 957, Santa Ifigênia, São Paulo - SP, Brasil')

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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_SP",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela