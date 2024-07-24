FROM docker.io/golang:alpine AS b_100pfps-builder
WORKDIR /app/
ENV MODE=Release
COPY . .
RUN go build -o 100pfps main.go

FROM docker.io/alpine:latest
ENV MODE=Release
ARG UNAME=shawn
ARG UID=1000
ARG GID=1000
RUN addgroup -g $UID $UNAME && adduser -D -u $GID -G $UNAME $UNAME
USER $UNAME
WORKDIR /app
COPY --chown=$UID:$GID --from=b_100pfps-builder /app/100pfps /app/
COPY --chown=$UID:$GID --from=b_100pfps-builder /app/views/ /app/views/
RUN mkdir /app/imgs/ && chown $UID:$GID /app/imgs/
VOLUME /app/imgs/
ENTRYPOINT /app/100pfps

