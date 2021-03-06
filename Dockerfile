# Base image with ruby 2.2.0
FROM ruby:2.2.0

# Install required libraries and dependencies
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Build whaler-api project
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# Add and install Gemfile
ADD ./Gemfile /usr/src/app/Gemfile
ADD ./Gemfile.lock /usr/src/app/Gemfile.lock
# RUN bundle install

# Add source code
ADD . /usr/src/app

# Expose server port
EXPOSE 3000

# Start rails server
CMD ruby bin/setup && rails server -b "0.0.0.0" -p 3000
