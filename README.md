# Helpful ATM

This Ruby on Rails application is an API where one can withdraw money starting with the largest bills. The app will analyze the value the user wants to withdraw and show how many of each respective bills (bank notes) they can receive.

These are the existing bills:
* 100
* 50
* 20
* 10

`# So a $180 withdrawal will provide the user with one of each bill and a $90 withdrawal would amount to 1 bill of $50 and 2 bills of $20.`

# Table of contents
- [General Information](#general-information)
  - [User Stories](#user-stories)
- [CRUD Operations](#crud-operations)
  - [Create](#create)
- [Interactivity](#interactivity)
  - [Run it locally](#run-it-locally)
  - [Used gems](#used-gems)
- [Testing](#testing)
  - [How to test this app locally](#how-to-test-this-app-locally)
  - [Environments and Tools](#environments-and-tools)

## General information
Those who want to see the exercise that started this whole project, see it in Portuguese [here](http://dojopuzzles.com/problemas/exibe/caixa-eletronico/). Or in English [here](https://cs50.harvard.edu/x/2020/psets/1/cash/). This app was built on top of the Portuguese-written exercise, but the logic is the same.

And remember => HAVE FUN! This can serve as a easy calculator, as a guide for you to code your own similar application for learning or, who knows, transform it into a full-blown product!

TAKE IT! It's OURS :wink:


### User Stories
Using this API, we have the 
* AN AUTHENICATED USER CAN Withdraw bank notes and save their transaction history.
* AN AUTHENICATED USER CAN View their previous transaction histories as a whole and when each transaction occurred.
* AN AUTHENTICATED USER CAN Withdraw bank notes, but can't save their transaction logs.

In simple words, its a CRU(~D~) application that serves as an ATM machine.

## CRU(~D~) Operations
CRU(~D~) here...

### CREATE
Once the user inputs data (the amount they want), the API will output the amount of bills as per the example shown below:
`{"id":1,"amount":180,"banknotes":"{:G=>1, :O=>1, :M=>1, :A=>1}"`




## Interactivity

### Run it locally

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

### Used gems
For development

* devise (user authentication)
* pundit (behavior authorization)
* simple_token_authentication (token authentication)

For testing

* rspec-rails (only test environment)
* Manual Testing :wink: (NOT A GEM, BUT ATTENTIVE HUMAN WORK)

## Testing
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

### Environments and Tools

This app was tested locally with different tools and in different environments:
* Third-party via Postman
* Test environment via RSpec (ran it locally)
* Development environment via Chrome Debugger
* Production environment via Heroku


