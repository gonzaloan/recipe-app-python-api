FROM python:3.7-alpine
MAINTAINER Gonzalo Munoz

#Recommended for Python in Containers
ENV PYTHONUNBUFFERED 1

# Copy file of requirements to image and install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# copy app folder
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create new user and use it, for security purposes.
RUN adduser -D user
USER user

