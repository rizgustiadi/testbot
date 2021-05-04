
FROM ubuntu:latest


RUN git clone -b master https://github.com/bambank9/testbot /testbot
RUN chmod 777 /testbot
WORKDIR /testbot
# au ah
COPY ./sample_config.env ./userbot.session* ./config.env* /root/userbot/
# Install requirements
CMD ["python3","-m","userbot"]
