FROM python:3.7.0-stretch
RUN mkdir /yarGen
ADD . /yarGen/
WORKDIR /yarGen
ENV PYTHONUNBUFFERED=0
ENV YARA_VERSION 3.6.3
RUN apt-get update
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade -r requirements.txt
RUN pip install --upgrade -r /yarGen/requirements.txt && mkdir ./dbs && \
cd ./dbs && \
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=0B2S_IOa0MiOHM2FTYU1WYlR6RlU' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=0B2S_IOa0MiOHM2FTYU1WYlR6RlU" -O 'good-strings.db' && rm -rf /tmp/cookies.txt && \
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=0B2S_IOa0MiOHQlVxLUZ3V2swSUE' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=0B2S_IOa0MiOHQlVxLUZ3V2swSUE" -O 'good-opcodes.db' && rm -rf /tmp/cookies.txt && \
wget -nv -nc https://winitor.com/tools/pestudio/current/pestudio.zip -O /tmp/pestudio.zip
ENTRYPOINT ["python", "yarGen.py", "-m", "/mounted"]
