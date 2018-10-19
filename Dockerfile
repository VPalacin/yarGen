FROM python:3.7.0-stretch
RUN mkdir /yarGen
ADD . /yarGen/
WORKDIR /yarGen
ENV PYTHONUNBUFFERED=0
ENV YARA_VERSION 3.6.3
RUN apt-get update
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade -r requirements.txt
ENTRYPOINT ["python", "yarGen.py", "-m", "/mounted"]
