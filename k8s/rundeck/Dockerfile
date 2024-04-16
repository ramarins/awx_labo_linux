# Etapa 1: Construir la imagen base con el binario de rundeck y el usuario de rundeck con los permisos correspondientes
FROM oraclelinux:8 as base
ENV REMCO_VER=0.12.4
ENV RUNDECK_HOME=/var/lib/rundeck
ENV RUNDECK_LOG=/var/log/rundeck

WORKDIR /tmp

RUN curl https://raw.githubusercontent.com/rundeck/packaging/main/scripts/rpm-setup.sh 2> /dev/null | bash -s rundeck && \
    yum install sudo rundeck wget unzip -y && \
    yum remove wget unzip && \
    yum clean all


RUN echo "rundeck ALL=(ALL) NOPASSWD: /etc/init.d/rundeckd start, /etc/init.d/rundeckd stop" > /etc/sudoers.d/rundeck_service

# Etapa 2:
FROM base as builder

# Establecer el directorio de trabajo
WORKDIR $RUNDECK_HOME
# Copiar todas las dependencias
COPY entry.sh bin/entry.sh
# Cambiar los permisos y propietario del script
RUN chown -R rundeck:rundeck bin

USER rundeck
# Expone el puerto 4440
EXPOSE 4440

# Define el comando principal que se ejecutará al iniciar el contenedor
ENTRYPOINT ["bin/entry.sh"]
