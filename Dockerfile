FROM i386/debian:bullseye-slim

# Встановлюємо необхідні ліби (wget і ca-certificates для завантажень, якщо треба)
RUN apt-get update && apt-get install -y libstdc++6 wget ca-certificates

WORKDIR /app

# Копіюємо всі твої файли в контейнер
COPY . .

# Робимо файли виконуваними
RUN chmod +x hlds_run hlds_linux

# Відкриваємо порти для гри
EXPOSE 27015/udp
EXPOSE 27015/tcp

# Запуск сервера
CMD ["./hlds_run", "-game", "cstrike", "+ip", "0.0.0.0", "+maxplayers", "16", "+map", "de_dust2", "-nomaster", "-noipx"]
