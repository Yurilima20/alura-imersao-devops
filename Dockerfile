# Etapa 1: Usar uma imagem base oficial do Python
# Usamos a versão 'slim' por ser mais leve
FROM python:3.13.4-alpine3.22

# Etapa 2: Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências
# Copiamos primeiro para aproveitar o cache do Docker. As dependências
# só serão reinstaladas se o requirements.txt mudar.
COPY requirements.txt .

# Etapa 4: Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar o código da aplicação para o diretório de trabalho
COPY . .

# Etapa 6: Expor a porta em que a aplicação será executada
EXPOSE 8000

# Etapa 7: Comando para iniciar a aplicação quando o contêiner for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000",  "--reload"]