FROM nginx:1.17.6 AS build-python

# install python
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc python3 python3-venv cron

# virtualenv
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# add and install requirements
RUN pip install --upgrade pip
COPY ./.data/requirements.txt .
RUN pip install -r requirements.txt

# ADD ./.data/run.py .

WORKDIR /app

COPY ./.data /app

ADD create.sh /app/create.sh
ADD entrypoint.sh /app/entrypoint.sh

#chmod 777 on /app dir is optional
RUN chmod +x /app/create.sh /app/entrypoint.sh && \
    chmod a+x /app/run.py
    # chmod 777 /app

ENTRYPOINT /app/entrypoint.sh
