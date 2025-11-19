###Título "Script Coleta de Preços da Cesta Básica DIEESE"
###Autor "Marcus André Alves Zimmermann Vieira"
###Última autualização "05/03/2024"

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
link = c('https://www.ifood.com.br/delivery/curitiba-pr/alface-melancia-hortifruti-minimercado-ahu/60556a8c-f3c4-4c46-af56-e602957d7873',
         'https://www.ifood.com.br/delivery/curitiba-pr/angeloni-supermercados---curitiba-batel/6f4887d5-8dfe-4817-9806-fb7e1fc2d3e9',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-av-das-torres-jardim-botanico/7dada04b-6ed2-4e9c-8b11-aff10e4df0ae',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-curitiba-arthur-bernardes-santa-quiteria/14e64c3a-779d-4f5d-b0a7-abd394c83d27',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-curitiba-bairro-alto-atuba/8f34a535-5a3e-4086-ad4f-0f422198fde5',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-curitiba-boa-vista-boa-vista/89068481-062c-47bf-af42-a550c3b14475',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-curitiba-fazendinha-portao/c06d6ae1-f4bd-47f5-b8de-54ef27061861',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-curitiba-santa-felicidade-sao-braz/5bbf33d6-590e-4d88-8739-fa4016c14419',
         'https://www.ifood.com.br/delivery/curitiba-pr/atacadao-parolin-guaira/f89959a5-3127-484d-91c4-e3bc275ee46c',
         'https://www.ifood.com.br/delivery/pinhais-pr/atacadao-pinhais-emiliano-perneta/b7c82a6b-17a9-430d-bf07-5d4bdb4381c5',
         'https://www.ifood.com.br/delivery/curitiba-pr/big-by-carrefour---av-parana-cabral/44953e95-0f25-4e2a-9dd4-c60df8929cde',
         'https://www.ifood.com.br/delivery/curitiba-pr/big-by-carrefour---parolin-prado-velho/a01b905c-0943-4956-8da7-98321e7aea27',
         'https://www.ifood.com.br/delivery/curitiba-pr/big-by-carrefour---portao-portao/602d3e64-0c60-4a45-af28-42834f7891bf',
         'https://www.ifood.com.br/delivery/curitiba-pr/big-by-carrefour-champagnat-campina-do-siqueira/2d42b6a8-5766-4af8-bab7-c8963b20db1f',
         'https://www.ifood.com.br/delivery/curitiba-pr/carrefour-hiper---av-parana-cabral/2c944889-b8f5-42f7-942b-80c88b447ad8',
         'https://www.ifood.com.br/delivery/curitiba-pr/carrefour-hiper---champagnat-campina-do-siqueira/f8c2989a-3a94-46b2-9158-edfd8af3da60',
         'https://www.ifood.com.br/delivery/curitiba-pr/carrefour-hiper---parolin-prado-velho/45136e72-1301-4962-904d-5efafa79b7f0',
         'https://www.ifood.com.br/delivery/curitiba-pr/carrefour-hiper---portao-portao/033c1879-6b8e-4304-ad5b-77698b946f4d',
         'https://www.ifood.com.br/delivery/curitiba-pr/casa-fiesta-alto-da-xv-alto-da-xv/e18b887f-6309-4e7a-99ac-0687e869da7d',
         'https://www.ifood.com.br/delivery/curitiba-pr/cheiro-da-terra--ecoville-cidade-industrial-de-curitiba/1635061b-812a-4a70-98ea-47ac99b28daf',
         'https://www.ifood.com.br/delivery/curitiba-pr/civis-supermercados---loja-raposo-pilarzinho/c4348cbe-fc5e-4083-9c04-953fe5d8b8c7',
         'https://www.ifood.com.br/delivery/curitiba-pr/defruta---hortifruti-delivery-pilarzinho/b4f3e991-fc39-4c6b-85e0-92f292aada9b',
         'https://www.ifood.com.br/delivery/curitiba-pr/emporio-sao-jose--fazendinha-fazendinha/5e410811-c6b5-40ae-bbba-84a4fa54052f',
         'https://www.ifood.com.br/delivery/curitiba-pr/fiesta---c-civico-centro-civico/fa605282-13fa-4bb1-b787-bb108fe0e9f9',
         'https://www.ifood.com.br/delivery/curitiba-pr/fiesta---centro-centro/31b6abcb-2abd-45f4-b846-71b85b5457fd',
         'https://www.ifood.com.br/delivery/curitiba-pr/fris-mini-mercado-agua-verde/7b2e97b5-36a2-44a0-a3fc-caa421de8eff',
         'https://www.ifood.com.br/delivery/curitiba-pr/max-atacadista-bairro-alto-bairro-alto/b29f87e5-4bcb-48d2-8735-3d861b5993e9',
         'https://www.ifood.com.br/delivery/curitiba-pr/max-atacadista-hauer-hauer/b1d56d68-46f1-4271-89b7-fd7d97e4c9ad',
         'https://www.ifood.com.br/delivery/curitiba-pr/max-campo-comprido-bairro-cidade-industrial/8d5f0a57-7f11-4726-8b60-a7cee8cff84c',
         'https://www.ifood.com.br/delivery/colombo-pr/max-colombo-campo-pequeno/0be53d06-c7d0-4ace-b0bc-c5bdba1ab8bc',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-atacadinho-bairro-alto/6e58bada-9535-4a45-88b3-823259c729ad',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-belissima-santa-quiteria/9f9301cb-9544-4818-860c-0120bc66e92f',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-bella-villa---jd-das-americas-jardim-das-americas/b07f1cf2-fa4f-444b-a5e1-5d95b26f00c1',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-bella-villa---vista-alegre-vista-alegre/6817be54-171a-48ed-81ef-0351396c1d97',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-bella-villa-agua-verde-agua-verde/b811e8d8-3b8f-417c-9741-79dff0eca946',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-bella-villa-juveve-juveve/7d871994-ae1d-4064-ba42-eddc9bb9f1ee',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-express-curitiba-centro/5bcafac7-0b9d-457f-b982-fb3286806ad7',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-super-fanny-fanny/d5ba3e1f-c814-4361-b24e-a3c61a699a9d',
         'https://www.ifood.com.br/delivery/curitiba-pr/mercado-unimaster-alto-da-gloria/5b9f9b6d-4246-422e-9bba-1a2c24d48ba8',
         'https://www.ifood.com.br/delivery/curitiba-pr/nacional-jardim-america-jardim-das-americas/2c06f494-03ee-4c4e-bad8-4d80b88c94f1',
         'https://www.ifood.com.br/delivery/curitiba-pr/nacional-juveve-juveve/f71bd8f6-c84b-48c5-a51c-e6d21c96fbc5',
         'https://www.ifood.com.br/delivery/curitiba-pr/nacional-reboucas-curitiba-reboucas/cd47df7b-ed9b-46e3-817c-81bfedef840c',
         'https://www.ifood.com.br/delivery/curitiba-pr/o-sacolao---frutaria-e-hortifruti-pilarzinho/82acfd6e-6d4b-4b5e-96be-1f6597308b91',
         'https://www.ifood.com.br/delivery/curitiba-pr/qualifruti-boqueirao-boqueirao/4002047b-1cdd-4011-a852-3bb4333ce95a',
         'https://www.ifood.com.br/delivery/curitiba-pr/super-muffato-champagnat-bigorilho/0e240533-7de9-47b1-966b-a588ac298dde',
         'https://www.ifood.com.br/delivery/curitiba-pr/super-muffato-go-agua-verde/be1476e2-3005-4f70-9ff8-5fd0f12509d5',
         'https://www.ifood.com.br/delivery/curitiba-pr/super-muffato-taruma-taruma/82ead5ee-dbd9-4f40-aa6c-ff3222473c70',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-basso-pilarzinho/5ea2c568-0e9f-4a5b-b489-06952badc6f7',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-bom-gourmet-cachoeira/083dc3c3-724a-448d-894e-bf1d7a6d63e7',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-delicatto-fast-batel/fcf10cd8-1cba-4a1c-b1d2-553a498b2989',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-isabela---santa-candida-santa-candida/b77bb6fb-2c3c-4cc4-b034-811aac75fb1f',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-jacomar---capao-raso-novo-mundo/b582a519-7fb9-4287-98e3-ff1a0d3dd21a',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-matriz-centro/6204754c-f540-47a9-9ba1-0c56806ee6f8',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-mercobom-abranches-abranches/96e53b95-f60d-4421-bbf6-df8e75a41d37',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-sierra-campo-comprido-campo-comprido/d50bee9e-3915-42dd-9d42-6cde71145e8a',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-storil-e-macedo---novo-mundo-novo-mundo/673fd4b0-e429-4111-ba68-d56b5410ecf5',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-total---cajuru-cajuru/8dd5ef87-f2d8-4bd0-b26e-528efa1eeee9',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-triunfo-abranches-abranches/17946378-2278-4c95-81c4-5d516ede4954',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercado-venda-oliveira-cabral/0b528c4b-2eac-45c8-bfdc-e3babd33b013',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercados-boni---bacacheri-tingui/dff0f1f3-0ff0-4cf0-9cc0-bb4bb5357d99',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercados-boni--bairro-alto-bairro-alto/010366fc-6d74-4ca3-9f89-c38af4c04f67',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercados-tissi-pilarzinho-pilarzinho/7ef02168-0f55-4ee4-bf00-e93791f64bd2',
         'https://www.ifood.com.br/delivery/curitiba-pr/supermercados-tissi-guaira-guaria/d31eb733-3582-4b77-b09c-49fea051caf8',
         'https://www.ifood.com.br/delivery/curitiba-pr/verde-mais-fresh-market---cabral-cabral/0bfa9c8c-febe-4140-a569-987b27b546c5',
         'https://www.ifood.com.br/delivery/curitiba-pr/verde-mais-fresh-market---hauer-hauer/609d8335-3bdb-496d-b308-98c584cf37c1',
         'https://www.ifood.com.br/delivery/curitiba-pr/verde-mais-fresh-market---vila-izabel-vila-izabel/d79f82d9-d0e3-49cb-92da-a37c3cefc241')

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
lista_enderecos = ('Rua Treze de Maio, 778, São Francisco, Curitiba - PR, Brasil')

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

Nome_do_arquivo = paste(c("Cesta_BasicaIfood_PR",gsub(":", "-", Sys.Date()),".csv"),collapse ="", sep="")
write.table(dframe_total, file=Nome_do_arquivo, sep=';') # Exportação de dados para tabela