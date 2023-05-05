FROM golang:1.8 as builder
WORKDIR /app
COPY ./app/message.go /app
RUN go build -o message

CMD ./message

#Segunda Imagem (com tamanho reduzido)
FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["./message"]