#U tilizando o R base

library(ggplot2)

data(mtcars)

modelo <- lm(mpg ~ wt + hp, data = mtcars)

summary(modelo)

predicoes <- predict(modelo, newdata = mtcars)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  geom_smooth(method = "lm", se = FALSE, color = "blue")


# Utilizando o Tidymodels

library(tidymodels)

set.seed(123)

dados_split <- initial_split(mtcars, prop = 0.8)

dados_treino <- training(dados_split)

dados_teste <- testing(dados_split)

modelo_especificacao <- linear_reg() %>%
  
  set_engine("lm")

fluxo_trabalho <- workflow() %>%
  
  add_model(modelo_especificacao) %>%
  
  add_formula(mpg ~ wt + hp)

modelo_ajustado <- fluxo_trabalho %>%
  
  fit(data = dados_treino)

predicoes <- modelo_ajustado %>%
  
  predict(new_data = dados_teste)

predicoes %>%
  
  bind_cols(dados_teste) %>%
  
  ggplot(aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  geom_line(aes(y = .pred), color = "blue")

