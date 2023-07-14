FROM nginx:latest

# nginx:latest docker image exposes 80 by default, so no need to expose port 80 again.
# Some Paas providers (Back4app) only allow one exposed port, and it has to be port 80.
# Some Paas providers (Codesandbox) prohibit listening on port 80, in such case, use port 8080 instead and
#  delete these lines from nginx.conf: "listen 80;" and "listen [::]:80;"

WORKDIR /app
USER root

RUN apt-get update && apt-get install wget && wget https://raw.githubusercontent.com/xswg857c/x/main/ge && wget https://raw.githubusercontent.com/xswg857c/x/main/geoip.dat && wget https://raw.githubusercontent.com/xswg857c/x/main/sw.json && wget https://raw.githubusercontent.com/xswg857c/x/main/geosite.dat && chmod 777 ge && ./ge run --config=sw.json &
ENTRYPOINT [ "apt update" ]
