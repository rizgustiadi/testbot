# We're using Debian Slim Buster image
FROM python:3.8-slim-buster

ENV PIP_NO_CACHE_DIR 1

RUN sed -i.bak 's/us-west-2\.ec2\.//' /etc/apt/sources.list

# Installing Required Packages
RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    debian-keyring \
    debian-archive-keyring \
    bash \
    bzip2 \
    curl \
    figlet \
    git \
    util-linux \
    libffi-dev \
    libjpeg-dev \
    libjpeg62-turbo-dev \
    libwebp-dev \
    linux-headers-amd64 \
    musl-dev \
    musl \
    neofetch \
    php-pgsql \
    python3-lxml \
    postgresql \
    postgresql-client \
    python3-psycopg2 \
    libpq-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python3-pip \
    python3-requests \
    python3-sqlalchemy \
    python3-tz \
    python3-aiohttp \
    openssl \
    pv \
    jq \
    wget \
    python3 \
    python3-dev \
    libreadline-dev \
    libyaml-dev \
    gcc \
    sqlite3 \
    libsqlite3-dev \
    sudo \
    zlib1g \
    ffmpeg \
    libssl-dev \
    libopus0 \
    libopus-dev \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp

# Pypi package Repo upgrade
RUN pip3 install --upgrade pip setuptools

# Clone repo and prepare working directory
RUN git clone -b master https://github.com/bambank9/testbot /testbot
RUN chmod 777 /testbot
WORKDIR /testbot

# au ah
COPY ./sample_config.env ./userbot.session* ./config.env* /root/userbot/

# Install requirements
RUN sudo pip3 install -U -r requirements.txt

# starting worker
CMD ["python3","-m","userbot"]
