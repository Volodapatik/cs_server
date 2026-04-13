FROM debian:bullseye-slim
RUN dpkg --add-architecture i386 &&     apt-get update &&     apt-get install -y libstdc++6:i386 libgcc-s1:i386 wget ca-certificates python3
WORKDIR /app
COPY . .
RUN chmod +x hlds_run hlds_linux
EXPOSE 80
EXPOSE 27015/udp
EXPOSE 27015/tcp
CMD python3 -m http.server 80 & ./hlds_run -game cstrike -strictportbind +ip 0.0.0.0 +port 27015 +maxplayers 32 +map de_dust2 +rcon_password 1w2q789rs & wait -n
