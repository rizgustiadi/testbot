FROM ubuntu:latest

# Clone repo and prepare working directory
RUN git clone -b master https://github.com/bambank9/testbot /testbot
RUN chmod 777 /testbot
WORKDIR /testbot

# auah
COPY ./sample_config.env ./userbot.session* ./config.env* /root/userbot/

# Install requirements
CMD ["python3","-m","userbot"]
