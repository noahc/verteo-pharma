source 'https://rubygems.org'

gem 'rails', '3.2.7'

gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'bootstrap-sass', '2.0.0'
gem 'bootswatch-rails'
gem 'devise'
gem 'jquery-ui-rails'
gem 'populator'
gem 'faker'
gem 'paperclip'
gem 'aws-sdk', '~> 1.3.4'
gem 'validates_timeliness', '~> 3.0'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  
  gem 'quiet_assets'
  gem 'sqlite3'
  gem "simplecov"
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'sqlite3'

  # Newer version of test::unit:
  gem 'minitest'

  # spork preloads a rails instance which is forked every time the tests are
  # run, removing test startup time.
  gem 'spork'

  # Run 'spork minitest' to start drb server (test server). Use 'testdrb' to
  # run individual tests via spork.
  gem 'spork-minitest'

  # Run 'bundle exec autotest' to rerun relevant tests whenever a file/test is
  # changed. '.autotest' makes sure the tests are run via test server (spork).
  gem 'autotest-standalone'

  # -pure gives us autotest without ZenTest gem.
  gem 'autotest-rails-pure'
end

group :production do
  gem 'pg', '0.12.2'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
