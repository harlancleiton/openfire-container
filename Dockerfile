FROM ubuntu

ENV OPENFIRE_VERSION 4.5.1
RUN apt update && apt upgrade -y
RUN apt install openjdk-8-jdk wget -y

RUN wget https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}_all.deb -O openfire_${OPENFIRE_VERSION}_all.deb
RUN dpkg -i openfire_${OPENFIRE_VERSION}_all.deb
RUN apt install -f -y

COPY openfire.sh /root/openfire.sh
RUN chmod +x /root/openfire.sh

EXPOSE 3478
EXPOSE 3479
EXPOSE 5222
EXPOSE 5223
EXPOSE 5229
EXPOSE 7070
EXPOSE 7443
EXPOSE 7777
EXPOSE 9090
EXPOSE 9091

CMD [ "/root/openfire.sh" ]