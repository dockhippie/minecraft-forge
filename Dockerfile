FROM opensuse:harlequin
MAINTAINER Thomas Boerger <thomas@webhippie.de>

ENV MINECRAFT_VERSION 1.8
ENV FORGE_VERSION 11.14.0.1299
ENV FORGE_JAR forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-universal.jar
ENV FORGE_MAXHEAP 2048M
ENV FORGE_MINHEAP 512M
ENV FORGE_OPTS nogui
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar

ENV RCON_PASSWORD webhippie

ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_ALL en_US.utf8

RUN mkdir -p /minecraft

ADD bin /usr/bin
ADD scripts /tmp

RUN LC_ALL=C /tmp/prepare.sh

RUN mkdir -p /minecraft/world
RUN mkdir -p /minecraft/logs
RUN mkdir -p /minecraft/merge

RUN mkdir -p /minecraft/template
ADD template /minecraft/template

RUN mkdir -p /minecraft/libexec
ADD libexec /minecraft/libexec
RUN ln -sf /minecraft/libexec/manage /usr/bin/manage

RUN wget -q -O /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar ${FORGE_URL}
RUN cd /minecraft && java -jar forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar --installServer
RUN rm -f /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar

VOLUME ["/minecraft/merge", "/minecraft/world", "/minecraft/logs"]

EXPOSE 25565 25575

WORKDIR /minecraft
ENTRYPOINT ["manage"]
CMD ["bash"]
