FROM siwatinc/nodejsubuntu_base_image
RUN npm install -g --unsafe-perm homebridge
RUN timeout 10s homebridge || :
RUN touch /root/.homebridge/config.json
RUN npm install -g --unsafe-perm homebridge-config-ui-x
RUN npm install -g --unsafe-perm homebridge-camera-ffmpeg
RUN apt-get update --fix-missing
RUN apt-get -y install ffmpeg
RUN apt-get -y install wget git
RUN apt-get -y install python-pip
RUN pip install arlo
CMD apt-get update && wget -nc https://raw.githubusercontent.com/SiwatINC/unraid-ca-repository/master/docker-template/config.json -O "/root/.homebridge/config.json" || : && apt-get -y install $aptpackages || : && npm install -g --unsafe-perm $packages && homebridge -I
