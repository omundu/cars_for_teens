source 'https://rubygems.org'

ruby '2.4.5'

gem 'rails', '~> 4.2'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'pg'

gem 'nokogiri'
gem 'foundation-rails', '~> 5.0'

gem 'puma'
gem 'newrelic_rpm'

gem 'sdoc', group: :doc

group :development do
  gem 'spring'
  gem 'compass'
  gem 'web-console'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'mechanize'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
  # gem 'minitest-notification'
  gem 'fakeweb', github: 'chrisk/fakeweb', branch: 'master'
end

group :production do
  gem 'rails_12factor'
end
