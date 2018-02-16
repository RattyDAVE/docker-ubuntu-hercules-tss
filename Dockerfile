FROM	ubuntu:16.04

RUN	apt-get update && \
      apt-get install -y  unzip wget hercules mc screen && \
      cd /opt && \
      mkdir hercules && \
      cd hercules && \
      mkdir tss && \
      cd tss && \
      wget http://www.ibiblio.org/jmaynard/tss370r3.zip && \
      unzip tss370r3.zip && \
      rm tss370r3.zip && \
      echo "HTTPPORT       8038" >> /opt/hercules/tss/tss.cnf && \
      apt-get -y autoclean && apt-get -y autoremove && \
      echo "#!/bin/bash" > start_tss.sh && \
      echo "cd /opt/hercules/tss"  >> start_tss.sh && \
      echo "hercules -f tss.cnf > Log.txt"  >> start_tss.sh && \
      chmod 755 start_tss.sh && \
      apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
      rm -rf /var/lib/apt/lists/*

EXPOSE      3270 8038
WORKDIR     /opt/hercules/tss
ENTRYPOINT  ["./start_tss.sh"]

#ENTRYPOINT  ["/usr/bin/screen", "-dm", "-S", "herc", "./start_tss.sh"]
