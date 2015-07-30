FROM webhippie/minecraft-vanilla:1.7.10
MAINTAINER Thomas Boerger <thomas@webhippie.de>

ENV MINECRAFT_VERSION 1.7.10
ENV FORGE_VERSION 10.13.4.1448
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}-${MINECRAFT_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-${MINECRAFT_VERSION}-installer.jar
ENV FORGE_JAR forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-${MINECRAFT_VERSION}-universal.jar

ENV SERVER_MAXHEAP 2048M
ENV SERVER_MINHEAP 512M
ENV SERVER_MAXPERM 128M
ENV SERVER_OPTS nogui
ENV SERVER_MOTD Minecraft
ENV SERVER_RCONPWD webhippie
ENV SERVER_DYNMAP true
ENV JAVA_OPTS -server -XX:+UseConcMarkSweepGC

RUN curl -o /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-${MINECRAFT_VERSION}-installer.jar ${FORGE_URL} 2> /dev/null && \
  cd /minecraft && \
  java -jar forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-${MINECRAFT_VERSION}-installer.jar --installServer && \
  rm -f /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-${MINECRAFT_VERSION}-installer.jar

VOLUME ["/minecraft/merge", "/minecraft/world", "/minecraft/logs", "/minecraft/dynmap"]

ADD rootfs /
EXPOSE 25565 25575 8123

WORKDIR /minecraft
CMD ["/usr/bin/s6-svscan","/etc/s6"]
