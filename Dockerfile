FROM ubuntu

WORKDIR /App

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip sqlite3 git && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install flask flask_sqlalchemy markdown pygments

COPY . /App
# Convert the line endings from DOS to UNIX format
RUN chmod +x run.sh && sed -i -e 's/\r$//' run.sh 

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=1


ENTRYPOINT ["./run.sh"]
