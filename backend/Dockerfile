FROM gitlab.praktikum-services.ru:5050/std-011-065/momo-store/golang:latest
ARG VERSION=${VERSION}
ENV VERSION=${VERSION}
WORKDIR /app
ADD . /app 
RUN go mod download \
    && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo ./cmd/api \
    && mv api /momo-store-api-${VERSION}
EXPOSE 8081
CMD ["sh", "-c", "/momo-store-api-${VERSION}"]
