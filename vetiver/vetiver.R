#install.packages("vetiver")

#Passo 1: Carregar as Bibliotecas Necessárias

library(vetiver)
library(dplyr)
library(magrittr)


#Passo 2: Preparar os Dados e Treinar o Modelo

data(mtcars)

modelo <- lm(mpg ~ wt + hp, data = mtcars)


#Passo 3: Criar um Vetiver Model

vetiver_model <- vetiver_model(modelo, "mpg ~ wt + hp")


#Passo 4: Implantar o Modelo como uma API

vetiver_api <- vetiver_api(vetiver_model)

vetiver_api$run()

#Após executar o código acima, o modelo estará disponível como uma API, permitindo que você faça previsões a partir de requisições HTTP.



#Passo 5: Fazer Previsões

##Para fazer previsões, você pode enviar uma requisição POST para a API com os dados necessários. Aqui está um exemplo usando o httr:


library(httr)

dados <- list(wt = 3.0, hp = 150)

resposta <- POST("http://localhost:8000/predict", body = dados, encode = "json")

content(resposta)

#O pacote Vetiver permitirá que você implante modelos de machine learning como APIs de forma rápida e fácil, facilitando a integração com outras aplicações e sistemas.


