FROM scratch
COPY ./public/ /usr/share/nginx/html/
VOLUME /usr/share/nginx/html
ENTRYPOINT ["/"]