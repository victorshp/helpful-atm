# Helpful ATM

This app is an API ...

## General information

### Table of contents
### Why this app?


## Run it locally

If you don't have the following requirements physically inside your machine, I recommend installing them with the respective versions:
* Ruby 2.6.5
* Rails 6.0.3.2
* PostgreSQL 12.2


To run it locally, clone this repo and run these commands:
```
$ gem install bundler
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
```

## Used gems
### For development
* simple_token_authentication
### For testing
* rspec-rails (only test environment)
* Manual Testing ;) (NOT A GEM, BUT CAREFUL HUMAN LABOR)

## Testing
### Environments and Tools

This app was tested locally with different tools and in different environments:
* Third-party via Postman
* Test environment via RSpec (run locally)
* Development environment via Chrome Debugger
* Production environment via Ngrok

### How to test this app locally
After cloning...

To test everything at once
```
$ rspec
```

To test seperately
```
$ rspec spec/services/withdrawal_services_spec.rb
# Runs WithdrawalServices tests

...
```
