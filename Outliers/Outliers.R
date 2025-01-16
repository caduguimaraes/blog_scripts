
#Exemplo 1: Método do Desvio Padrão

dados <- c(10, 12, 12, 13, 12, 14, 15, 100)

media <- mean(dados)

desvio_padrao <- sd(dados)

outliers <- dados[dados > (media + 2 * desvio_padrao) | dados < (media - 2 * desvio_padrao)]

print(outliers)



E#xemplo 2: Método do Intervalo Interquartil (IQR)

dados <- c(10, 12, 12, 13, 12, 14, 15, 100)

Q1 <- quantile(dados, 0.25)

Q3 <- quantile(dados, 0.75)

IQR <- Q3 - Q1

outliers <- dados[dados < (Q1 - 1.5 * IQR) | dados > (Q3 + 1.5 * IQR)]

print(outliers)



#Exemplo 3: Visualização com Boxplot

dados <- c(10, 12, 12, 13, 12, 14, 15, 100)

boxplot(dados, main="Boxplot dos Dados", ylab="Valores")




