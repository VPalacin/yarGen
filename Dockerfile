FROM python:3.7.0-stretch
ADD . /yarGen
WORKDIR /yarGen
ENV PYTHONUNBUFFERED=0
ENV YARA_VERSION 3.6.3
RUN apt-get update
RUN pip install --upgrade pip
RUN pip install --upgrade -r /yarGen/requirements.txt
ENTRYPOINT ["python", "/yarGen/yarGen.py", "-m", "/yarGen/mounted"]
