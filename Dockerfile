# Base image with ruby 2.2.0
FROM ruby:2.2.0

# Install required libraries and dependencies
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*


# Build whaler-api project
RUN mkdir /whaler-api
WORKDIR /whaler-api

# Add and install Gemfile
ADD ./Gemfile /whaler-api/Gemfile
ADD ./Gemfile.lock /whaler-api/Gemfile.lock
RUN bundle install

# Add source code
ADD . /whaler-api

# Add docker certificates
# ADD /home/docker/.docker /home/.docker

# Create and fill database
# RUN bundle exec rake db:setup
# RUN bundle exec rake db:seed


# Expose server port
EXPOSE 3000

# Start rails server
CMD ["rails","server","-b","0.0.0.0","-p","3000"]