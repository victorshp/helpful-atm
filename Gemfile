source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Devise for user authentication
gem 'devise', '~> 4.7', '>= 4.7.2'
# Use Simple Token Authentication as a simple form of user authentication
gem 'simple_token_authentication', '~> 1.15', '>= 1.15.1'
# Use SendGrid in production environment as Heroku Addon to send token to signed-up user
gem 'sendgrid-ruby', '~> 5.0'
# Use Dotenv-Rails to use SendGrid token without exposign it
gem 'dotenv-rails'
# Use Rails_Admin for Admin users to access the db mainly. Particulararly good for non-developer admins
gem 'rails_admin', '~> 2.0'



# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use Rspec for powerful testing
  gem 'rspec-rails', '>=4.0.1'
  # Use Shoulda to simplify testing
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-callback-matchers', '~> 1.1', '>= 1.1.3'
  # Use Faker to randomize samples and work with Factory Bot
  gem 'faker', '>=2.13.0'
  # Use Database_Cleaner to properly clean the database
  gem 'database_cleaner', '>=1.8.5'
  # Use pry as a Debugger
  gem 'pry', '~> 0.10.3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
