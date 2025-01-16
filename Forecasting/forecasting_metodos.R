#1. ARIMA (AutoRegressive Integrated Moving Average)

#Para implementar um modelo ARIMA em R, podemos usar o pacote forecast. Veja um exemplo:

#install.packages("forecast")

library(forecast)

dados <- AirPassengers

modelo_arima <- auto.arima(dados)

previsao_arima <- forecast(modelo_arima, h = 12)

plot(previsao_arima)


#2. SARIMA (Seasonal ARIMA)

##O modelo SARIMA é uma extensão do ARIMA que incorpora a sazonalidade. É útil para séries temporais que apresentam padrões sazonais. A implementação do modelo SARIMA também pode ser feita com o pacote forecast:

modelo_sarima <- Arima(dados, seasonal = list(order = c(1, 1, 1), period = 12))

previsao_sarima <- forecast(modelo_sarima, h = 12)

plot(previsao_sarima)


#3. Exponential Smoothing

# O método de suavização exponencial é uma técnica que dá mais peso aos dados mais recentes. É particularmente útil para séries temporais que não apresentam tendências ou sazonalidade. Podemos usar o pacote forecast para aplicar a suavização exponencial:

modelo_es <- ets(dados)

previsao_es <- forecast(modelo_es, h = 12)

plot(previsao_es)


#4. Prophet

## O Prophet é um pacote desenvolvido pelo Facebook que facilita a modelagem de séries temporais com tendências e sazonalidades. É especialmente útil para dados com sazonalidade diária, semanal ou anual.


#install.packages("prophet")

library(prophet)

df <- data.frame(ds = as.Date(time(dados)), y = as.numeric(dados))

modelo_prophet <- prophet(df)

futuro <- make_future_dataframe(modelo_prophet, periods = 12, freq = 'month')

previsao_prophet <- predict(modelo_prophet, futuro)

plot(modelo_prophet, previsao_prophet)


#5. Tidymodels

##O tidymodels é um conjunto de pacotes que facilita a modelagem e a validação de modelos em R. Ele pode ser utilizado para implementar técnicas de forecasting de forma organizada e eficiente.

#install.packages("tidymodels")

library(tidymodels)

dados_tidy <- tibble(ds = as.Date(time(dados)), y = as.numeric(dados))

modelo_tidy <- prophet_reg() %>%
  
  set_engine("prophet")

modelo_fit <- modelo_tidy %>%
  
  fit(y ~ ds, data = dados_tidy)

previsao_tidy <- modelo_fit %>%
  
  predict(new_data = future)

autoplot(previsao_tidy)

