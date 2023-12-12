FROM python:3.11-alpine
LABEL mantainer='gpdev'

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

# This arg is overwritten in docker-compose
# When this dockerfile is used for production as single container
# it will be set to false
ARG DEV=false
# Using just one RUN command to reduce the number of layers
# (Docker creates a layer for each RUN command)
RUN python -m venv /env && \
    /env/bin/pip install --upgrade pip && \
    /env/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ] ; then \
        /env/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        #--no-create-home \
        django-user
#RUN mkdir /home/django-user && chown django-user:django-user /home/django-user

ENV PATH="/env/bin:$PATH"

USER django-user