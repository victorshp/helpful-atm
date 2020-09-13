# Helpful ATM

This Ruby on Rails application is an API where one can withdraw money starting with the largest bills. The app will analyze the value the user wants to withdraw and show how many of each respective bills (bank notes) they can receive.

These are the existing bills:
* 100
* 50
* 20
* 10

`# So a $180 withdrawal will provide the user with one of each bill and a $90 withdrawal would amount to 1 bill of $50 and 2 bills of $20.`

The strucut

# Table of contents
- [General Information](#general-information)
- [Technical Information](#technical-information)
  - [Production Environment](#production-environment)
  - [Development Environment](#development environment)
  - [CRUD Operations](#crud-operations)
    - [Create](#create)
    - [Read](#read)
    - [Update](#update)
    - [Destroy](#destroy)
  - [Used gems](#used-gems)
- [Testing](#testing)
  - [How to test this app locally](#how-to-test-this-app-locally)
  - [Environments and Tools](#environments-and-tools)
- [Other Information](#other-information)

## General Information

This app is an MVC-based framework and was integrated with the following attributes:

* Concepts of OOP incorporated: Abstraction, Inheritance, Encapsulation
* No N+1 queries! Views rendered as jsons through the controller (no need for separate views)
* Skinny Model, Skinny Controller; Logic separate from both were rendered as Services (./app/services)
* Admin dashboard (/admin route) for admin users to manipulate data with a clear UI
* Model validations and Controller appopriate logic
* Unit Testing through Rails' Rspec testing framework
* Relational Database through PostgreSQL

Look at the screenshots directory (./screeshots) for some visual representation.

## Technical Information
### Production Environment
:star::star::star:**IMPORTANT**:star::star::star:
To interact with the API and perform CRUD operations, one first needs to signup and an receive a user email and user API token (via SendGrid). To create a user, access the [Heroku App](http://helpful-atm.herokuapp.com/) and create a user. The API token will be sent to the email you registered when signing up. Notice that this is production environment, meaning the token you receive from creating a user here isn't valid in development!

`Alternatively, you can clone this repo and create a user in the Terminal.`

### Development Environment

If you don't have the following requirements physically inside your machine, I recommend installing them with the respective versions:
* Ruby 2.6.5
* Rails 6.0.3.2
* PostgreSQL 12.2


To install it locally, clone this repo and run these commands:
```
$ gem install bundler
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
```

### CR(~UD~) Operations
In simple words, this app a CR(~UD~) API that serves as an ATM machine. You can create a withdrawal and read them.
CR(~UD~) here...

`Only admin users have full CRUD authority.`

#### CREATE
Once the user inputs data (the amount they want), the API will output the amount of bills as per the example shown below:
`{"id":1,"amount":180,"banknotes":"{:G=>1, :O=>1, :M=>1, :A=>1}"`

```
curl -i -X POST                                         \
       -H 'Content-Type: application/json'              \
       -H 'X-User-Email: john@example.org'              \
       -H 'X-User-Token: xxxxxxxxxxxxxxxxxxxx'          \
       -d '{ "amount": 180 }'                           \
       http://helpful-atm.herokuapp.com/api/v1/withdrawals/

```

#### READ
To show all withdrawals that your user has made:

```
curl -s GET                                             \
       -H 'Content-Type: application/json'              \
       -H 'X-User-Email: john@example.org'              \
       -H 'X-User-Token: xxxxxxxxxxxxxxxxxxxx'          \
       http://helpful-atm.herokuapp.com/api/v1/withdrawals/
```

To show one specific withdrawal that your user has made:

```
curl -s GET                                             \
       -H 'Content-Type: application/json'              \
       -H 'X-User-Email: john@example.org'              \
       -H 'X-User-Token: xxxxxxxxxxxxxxxxxxxx'          \
       http://helpful-atm.herokuapp.com/api/v1/withdrawals/3
```

#### UPDATE

Avaiable for admin users in /admin route

#### DELETE

Avaiable for admin users in /admin route


### Used gems

For development

* devise (user authentication)
* simple_token_authentication (token authentication)
* sendgrid-ruby (transactional emails; send token to new user)
* dotenv-rails (prevent exposure of sensitive data)
* rails_admin (full admin dashboard for admin users ONLY)

For testing

* rspec-rails (powerful Rails testing framework)
* shoulda (simplifies testing)
* shoulda-callback-matchers (simplifies testing)
* faker (for generating random samples)
* database_cleaner (properly clean the database)
* rails-controller-testing (to test controllers)
* Manual Testing :wink: (NOT A GEM, BUT ATTENTIVE HUMAN WORK)

For debugging

* pry (quite none like this debugger)

## Testing
### How to test this app locally
After cloning...

To test everything at once
```
$ rspec
```

To test seperately
```
# Runs WithdrawalServices tests
$ rspec spec/services/withdrawal_services_spec.rb

# Runs WithdrawalsController tests
$ rspec spec/controllers/withdrawals_controller_spec.rb

# Runs Withdrawal model tests
$ rspec spec/models/withdrawal_spec.rb

# Runs User model tests
$ rspec spec/models/withdrawal_spec.rb
```

### Environments and Tools

This app was tested locally with different tools and in different environments:
* Third-party via Postman
* Test environment via RSpec
* Development environment
* Production environment in Heroku

## Other Information

Those who want to see the exercise that started this whole project, see it in Portuguese [here](http://dojopuzzles.com/problemas/exibe/caixa-eletronico/). Or in English [here](https://cs50.harvard.edu/x/2020/psets/1/cash/). This app was built on top of the Portuguese-written exercise, but the logic is the same.
