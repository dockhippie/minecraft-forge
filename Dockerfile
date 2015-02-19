FROM webhippie/minecraft-vanilla:1.8
MAINTAINER Thomas Boerger <thomas@webhippie.de>

ENV MINECRAFT_VERSION 1.8
ENV FORGE_VERSION 11.14.0.1299
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar
ENV FORGE_JAR forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-universal.jar

ENV SERVER_MAXHEAP 2048M
ENV SERVER_MINHEAP 512M
ENV SERVER_OPTS nogui
ENV SERVER_MOTD Minecraft
ENV SERVER_RCONPWD webhippie

ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_ALL en_US.utf8

ADD libexec /minecraft/libexec

RUN wget -q -O /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar ${FORGE_URL}
RUN cd /minecraft && java -jar forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar --installServer
RUN rm -f /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar

VOLUME ["/minecraft/merge", "/minecraft/world", "/minecraft/logs"]

EXPOSE 25565 25575

WORKDIR /minecraft
ENTRYPOINT ["manage"]
CMD ["bash"]
