# We're using Alpine Edge
FROM alpine:edge

#
# We have to uncomment Community repo for some packages
#
RUN sed -e 's;^#http\(.*\)/edge/community;http\1/edge/community;g' -i /etc/apk/repositories

#
# Installing Packages
#
RUN apk add --no-cache=true --update \
    coreutils \
    bash \
    build-base \
    bzip2-dev \
    curl \
    figlet \
    gcc \
    g++ \
    git \
    sudo \
    aria2 \
    util-linux \
    libevent \
    jpeg-dev \
    libffi-dev \
    libpq \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl \
    neofetch \
    openssl-dev \
    postgresql \
    postgresql-client \
    postgresql-dev \
    openssl \
    pv \
    jq \
    wget \
    freetype \
    freetype-dev \
    python3 \
    python3-dev \
    readline-dev \
    sqlite \
    ffmpeg \
    libjpeg-turbo-dev \
    sqlite-dev \
    libc-dev \
    sudo \
    chromium \
    chromium-chromedriver \
    zlib-dev \
    jpeg 
    #

RUN curl https://cli-assets.heroku.com/install.sh

RUN python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# Clone repo and prepare working directory
RUN git clone -b master https://github.com/bambank9/testbot /testbot
RUN chmod 777 /testbot
WORKDIR /testbot
# au ah
COPY ./sample_config.env ./userbot.session* ./config.env* /root/userbot/

# Install requirements
CMD ["python3","-m","userbot"]
