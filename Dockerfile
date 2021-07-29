FROM golang:latest as BUILDER

WORKDIR /bin

COPY go/desafio.go .

RUN go build -ldflags "-w" desafio.go

FROM scratch

WORKDIR /bin
COPY --from=builder /bin/desafio .
ENTRYPOINT ["./desafio"]




