source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.1.8'
gem 'arel'

gem 'sprockets-rails', '~> 2.0'
gem 'sass-rails',   github: 'rails/sass-rails'
gem 'uglifier', '>= 1.0.3'

# database
gem 'pg'


# UTILITIES
# -----------------------------------

# for building JSON
gem 'jbuilder', '~> 1.2'

# for background job processing
gem 'delayed_job_active_record'

# web interface for delayed job
gem 'delayed_job_web', '>= 1.2.0'

# for handling file uploads
gem 'carrierwave'

# for email validation
gem 'email_validator'

# display source code in pattern library
gem 'codemirror-rails'


# DEV TOOLS
# -----------------------------------

# admin framework
gem 'activeadmin', github: 'gregbell/active_admin'

# for authentication
gem 'devise', '3.2.3'

# for sending devise emails in background
gem 'devise-async'

# collection of handy tools
gem 'handy'

# dump database records to yaml files
gem 'yaml_dump', github: 'vanboom/yaml_dump'


# FRONT-END
# -----------------------------------

gem 'jquery-rails'

# turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# use bootstrap3
gem 'twitter-bootstrap-rails'

# forms made easy for rails
gem 'simple_form'

# For variants support
gem 'browser'

# Haml as templating engine
gem 'haml-rails'


# UI ELEMENT PLUGINS
# -----------------------------------


# API
# -----------------------------------

# for parsing JSON
gem 'json'

gem 'uuidtools'
gem 'signet'
gem 'rest-client'


# THIRD PARTY PLUGINS
# -----------------------------------

# serve gzipped assets
gem 'rack-zippy'

# sending and tracking emails
gem 'mandrill-api'


# REPORTING
# -----------------------------------

# for error tracking
gem 'honeybadger'

# segment.io tracking
gem 'analytics-ruby', '~> 2.0.0', :require => 'segment/analytics'


group :development do

  # application server for development
  gem 'thin'

  # mutes assets pipeline log messages
  gem 'quiet_assets'

  # speeds up development by keeping your application running in the background
  gem 'spring'

  # better rails error messages
  gem 'better_errors'

  # interactive prompt in error messages
  gem 'binding_of_caller'

  # for using RailsPanel Chrome extension
  gem 'meta_request'

  # notify of db queries that can be improved
  gem "bullet"

  # evaluate against style guide
  gem 'rubocop'

  # automatically run tests
  gem 'guard-minitest'

  # use rubocop with guard
  gem 'guard-rubocop'

  # automatically reload browser when view files are modified
  gem 'guard-livereload', require: false

  # display speed badge on every page
  gem 'rack-mini-profiler'
  gem 'flamegraph', '0.0.5'

end

group :test do

  # customizable MiniTest output formats
  gem 'minitest-reporters', require: false

  # for test coverage report
  gem 'simplecov', require: false

  # high-level acceptance testing with Capybara
  gem 'minitest-rails-capybara'

  # acceptance testing with browser automation
  gem 'selenium-webdriver'

  # mocking and stubbing library
  gem 'mocha', require: false

  gem 'ruby-prof'

  # simulate time in tests
  gem 'timecop', require: false

  # record and reuse external HTTP requests to speed up testing
  gem 'vcr'
  gem 'webmock'

  # send test coverage report to Code Climate
  gem 'codeclimate-test-reporter', require: nil

end

group :development, :test do

  # receive growl notifications from guard
  if !ENV['CI']
    gem 'ruby_gntp'
  end

  gem 'pry'

end

group :staging, :production do

  # HTTP server for Rack applications for staginng and production
  # See https://github.com/bigbinary/wheel/issues/43 for why unicorn is
  # not used in development.
  gem 'unicorn'

  # without this development environment will use default one
  gem 'unicorn-rails'

  # better logging
  gem 'rails_12factor'

end

# logs number of connections opened in the db
gem 'pg_connection_counter'
