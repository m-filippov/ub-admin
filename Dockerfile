FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nodejs && apt-get install libnspr4
RUN apt-get install -y nano  
RUN apt-get install -y npm
RUN apt install -y libx11-dev libgtk2.0-dev libcairo2-dev libpango1.0-dev libxtst-dev libgdk-pixbuf2.0-dev libatk1.0-dev libghc-x11-dev subversion
RUN wget -O ub-server.deb https://git-pub.intecracy.com/unitybase/ub-server/-/jobs/artifacts/master/raw/package/ub-server.deb?job=package-linux
RUN apt install -y ./ub-server.deb  
RUN npm i -g npm
COPY ./init_and_run_ub.sh				/usr/lib/app/
COPY ./ub-app/       				/usr/lib/app/
WORKDIR 				                /usr/lib/app
#RUN sh init_and_run_ub.sh
EXPOSE 80 443 8881
ENTRYPOINT ["sh", "./init_and_run_ub.sh"]
CMD ["tail", "-f", "/var/log/wtmp]
