source 'https://rubygems.org'

gem 'coffee-rails', '~> 4.0.0'
gem "devise"
gem "foundation-rails"
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem "minitest-rails"
gem "pundit"
gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'sqlite3', group: :test, group: :development
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'spring'
end

group :test do
  gem "launchy"
  gem "minitest-rails-capybara"
  gem "simplecov", "~> 0.7.1"
end

#Setup for heroku.com
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

#Do not use turbolinks until it's compatible with everything else
#gem 'turbolinks'
