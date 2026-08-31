FROM golang:1.19 AS build

WORKDIR /app    
COPY . .
RUN CGO_ENABLED=0 go build -o server main.go

FROM alpine:3.12
WORKDIR /app
COPY --from=build /app/server .
EXPOSE 8085
CMD ["./server"]
