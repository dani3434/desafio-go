# Fase de compilação
FROM golang:1.16-alpine AS build

WORKDIR /app

RUN printf 'package main\nimport "fmt"\nfunc main() {\n    fmt.Println(" Full Cycle Rocks!!")\n}' > hello.go
RUN go mod init hello
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

# Fase de execução
FROM scratch

COPY --from=build /app/hello /hello

CMD ["/hello"]
