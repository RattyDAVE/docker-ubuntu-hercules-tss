# A docker container containing a fully running version 3.0 of IBM's Time Sharing System/370

Use https://github.com/RattyDAVE/docker-ubuntu-hercules-tss/issues to send feedback, issues, comments and general chat.

# Part of the retro mini and mainframe series.

* https://hub.docker.com/r/rattydave/alpine-multics - Fully Running Multics mainframe time sharing operating system.
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-tss - Fully running version 3.0 of IBM's Time Sharing System/370
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-vm370 - vm370 Emulator with Robert O'Hara's Six Pack
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-mvs - Fully running MVS 3.8j Tur(n)key 4- System. IBM Mainframe.
* https://hub.docker.com/r/rattydave/alpine-simh/ - AT&T, Data General, DEC PDPs and VAXen, Honeywell, HP and others. All with OSs. 


## Note

This is not a ready to run system. You need to IPL 250 and then you can control via the telnet connection. (If you dont know what IPL 280 means then this container is not for you.)

## Usage

```
docker run -dit --name tss \
           -p 3270:3270 -p 8038:8038 \
           rattydave/docker-ubuntu-hercules-tss:latest
```

Connect a 3270 terminal to port 3270 on the docker host.
To get the http://docker.host:8038 for the Hercules console.

Or

```
docker run -dit --name tss rattydave/docker-ubuntu-hercules-tss:latest

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tss
```

Then connect a 3270 terminal to the container ip address on port 3270.

```
x3270 ipaddress:3270
```

To access a console connection - this will also be the console connection on failure.

```
telnet ipaddress 3270
```

To get to the hercules screen in the docker container.

```
docker exec -it tss screen -d -RR herc
```
