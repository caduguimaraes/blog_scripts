library(here)


caminho_dados <- here("dados", "dados.csv")


dados <- read.csv(caminho_dados)


head(dados)

#Neste exemplo, a função `here("dados", "dados.csv")` gera o o caminho correto para o arquivo "dados.csv" independentemente de onde o script "analise.R" estiver sendo executado, desde que a estrutura do projeto permaneça a mesma.

# A função `here()` é especialmente útil quando se trabalha com projetos que envolvem muitos arquivos e diretórios, pois evita a necessidade de especificar caminhos absolutos ou relativos para acessar os arquivos. Isso torna o código mais portável e menos propenso a erros devido a mudanças na estrutura de diretórios do projeto.

# Além disso, a função `here()` facilita a colaboração em projetos, pois os caminhos dos arquivos são relativos ao projeto e não dependem da estrutura de diretórios específica de cada usuário. Isso torna mais fácil compartilhar e reproduzir o código em diferentes ambientes de trabalho.

# Em resumo, a função `here()` é uma ferramenta útil para gerenciar caminhos de arquivos em projetos de análise de dados no R, tornando o código mais portável, robusto e fácil de colaborar.