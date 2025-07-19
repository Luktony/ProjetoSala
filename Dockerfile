
FROM node:22-alpine

# Instalar OpenSSL e dependências de compilação
RUN apk add --no-cache openssl build-base

# Define o diretório de trabalho dentro do container
RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app

# Declara os argumentos que serão usados como variáveis de ambiente
ARG PORT

# Configuração das variáveis de ambiente
ENV PORT=${PORT} 

# Instala as dependências
RUN npm install

# Builda a aplicação
RUN npm run build

# Expõe a porta que sua aplicação usará
EXPOSE ${PORT}

# Comando para executar a aplicação
CMD ["sh", "-c", "npx prisma migrate deploy && npx prisma generate && npm start"]