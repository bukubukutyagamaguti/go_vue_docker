FROM golang:latest

COPY ./dev/back /app
WORKDIR /app

# RUN go mod init main
RUN go mod tidy
RUN go build
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    GO111MODULE=on
ENV PATH="$GOPATH/bin:$PATH"
EXPOSE 8080

RUN go get github.com/cosmtrek/air
RUN go install github.com/golang/mock/mockgen@v1.6.0
RUN go build -o /go/bin/air github.com/cosmtrek/air

CMD ["go", "run", "main.go"]