FROM python:3.7-alpine
MAINTAINER Gonzalo Munoz

#Recommended for Python in Containers
ENV PYTHONUNBUFFERED 1

# Copy file of requirements to image and install dependencies
COPY ./requirements.txt /requirements.txt
#Install postgres client
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps
# copy app folder
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create new user and use it, for security purposes.
RUN adduser -D user
USER user

