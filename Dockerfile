FROM ruby:3.0.2-slim

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl \
  git unixodbc unixodbc-dev tdsodbc \
  postgresql-client libxrender1 libfontconfig wget ghostscript

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g yarn

# create a folder /myapp in the docker container and go into that folder
RUN mkdir /app
WORKDIR /app

# Copy the whole app
COPY . /app
