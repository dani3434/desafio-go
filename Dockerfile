# Use a imagem oficial do Go
FROM golang:1.16-alpine

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o código Go para o container
COPY hello.go .

# Inicialize o módulo Go
RUN go mod init hello

# Compile o programa Go
RUN go build -o hello

# Execute o programa Go quando o container iniciar
CMD ["/app/hello"]
