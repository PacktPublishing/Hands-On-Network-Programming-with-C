FROM alpine:3.14

COPY . /src

WORKDIR /src/build

RUN apk add --no-cache gcc cmake make musl-dev && \
    cmake .. && \
    cmake --build .

ENTRYPOINT ["/src/build/chap05_dns_query"]
