FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /helpful-atm
WORKDIR /helpful-atm
COPY Gemfile /helpful-atm/Gemfile
COPY Gemfile.lock /helpful-atm/Gemfile.lock 
COPY . /helpful-atm

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
