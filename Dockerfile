FROM alpine:latest as builder
WORKDIR /build
ADD . /build/
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.81.0/hugo_0.81.0_Linux-64bit.tar.gz
RUN tar -xzvf hugo_0.81.0_Linux-64bit.tar.gz
RUN ./hugo

FROM nginx:latest
COPY --from=builder /build/public /usr/share/nginx/html
ENV NGINX_PORT 80

wget https://github.com/gohugoio/hugo/releases/download/v0.81.0/hugo_0.81.0_Linux-64bit.tar.gz && tar -xzvf hugo_0.81.0_Linux-64bit.tar.gz && ./hugo