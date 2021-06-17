FROM golang:latest as build
WORKDIR /build
COPY . .
RUN go build -o go-helloworld . 
RUN ls

FROM ubuntu:latest as run
WORKDIR /app
COPY --from=build /build/go-helloworld .
ENTRYPOINT [ "/app/go-helloworld" ]