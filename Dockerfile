FROM rocker/shiny-verse:3.5.1

COPY app /srv/shiny-server
WORKDIR /srv/shiny-server

ENTRYPOINT ["/usr/bin/shiny-server.sh"]

EXPOSE 3838
