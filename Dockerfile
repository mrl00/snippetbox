FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go build

FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder /app/snippetbox.mrl00.net /app/

CMD [ "./snippetbox.mrl00.net" ]


