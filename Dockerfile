FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    openssh-server \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m deploy
RUN mkdir /app

COPY . /app

WORKDIR /app

COPY deploy_key.pub /home/deploy/.ssh/authorized_keys
# Устанавливаем зависимости
RUN python -m pip install --upgrade pip && \
    pip install poetry && \
    poetry install

# Настроим SSH для работы
RUN mkdir /home/.ssh && \
    touch /home/.ssh/authorized_keys && \
    chmod 600 /home/.ssh/authorized_keys

# Открываем порт для SSH
EXPOSE 22

# Запуск SSH сервера
CMD service ssh start && tail -f /dev/null
