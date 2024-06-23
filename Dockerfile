FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go build ./cmd/web

FROM debian:bookworm-slim AS runtime

WORKDIR /app

COPY --from=builder /app/web /app/

CMD [ "./web" ]


