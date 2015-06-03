source 'https://rubygems.org'


gem 'rails', '4.1.9'
gem 'sqlite3'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'jquery-rails'
# gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sass-rails'
# gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.0.0'


gem 'haml-rails'
gem 'simple_form'

gem 'unicorn'

group :development do
  # rails application preloader
  #(set DISABLE_SPRING environment variable to temporary disable)
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'thin'
  gem 'pry-nav', group: :test
  gem 'pry', group: :test
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'mina'
  gem 'mina-unicorn', :require => false
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda'
  gem 'database_cleaner'
  gem 'factory_girl_rails', group: :development
end
