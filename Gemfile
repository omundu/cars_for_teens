source 'https://rubygems.org'

ruby '3.3.2'

gem 'rails', '~> 6.1'
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

gem 'mutex_m'
gem 'drb'
gem 'json', '~> 2.6'

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
  gem 'minitest', '~> 5.26'
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
  # gem 'minitest-notification'
  gem 'webmock'
  gem 'rails-controller-testing'
end

group :test, :ci do
  gem "bundler-audit"
  gem "brakeman"
  gem "rubocop"
end


gem 'dotenv', groups: [:development, :test, :ci]

group :production do
  gem 'rails_12factor'
end
