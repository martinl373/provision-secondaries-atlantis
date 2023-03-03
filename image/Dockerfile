FROM ghcr.io/runatlantis/atlantis:v0.22.3

## Install the template CLI
ADD https://github.com/hairyhenderson/gomplate/releases/download/v3.11.3/gomplate_linux-arm64 /usr/local/bin/gomplate
RUN chmod 755 /usr/local/bin/gomplate

## Install scripts
COPY /scripts/* /novus/scripts/
RUN chmod 755 /novus/scripts/*

## Install all templates
COPY /templates/* /novus/templates/
