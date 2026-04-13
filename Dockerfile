# Використовуємо образ, який вже іде під i386 архітектуру за замовчуванням
FROM i386/debian:bullseye-slim

# Додаємо силу, щоб apt-get знав, що ми на 32-бітах
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libstdc++6 wget ca-certificates

WORKDIR /app

# Копіюємо файли
COPY . .

# Робимо виконуваними
RUN chmod +x hlds_run hlds_linux

# Порти
EXPOSE 27015/udp
EXPOSE 27015/tcp

# Запуск
CMD ["./hlds_run", "-game", "cstrike", "+ip", "0.0.0.0", "+port", "27015", "+maxplayers", "32", "+map", "de_dust2"]
