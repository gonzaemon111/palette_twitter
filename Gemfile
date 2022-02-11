source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

gem "rails", "~> 5.2.3"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 4.3"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "mini_racer", platforms: :ruby
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "redis", "~> 4.0"
gem "bcrypt", "~> 3.1.7"
gem "mini_magick", "~> 4.8"
gem "bootsnap", ">= 1.1.0", require: false

# 追加 gem
gem "bootstrap", "~> 4.1.1"
gem "jquery-rails"
gem "shrine"
gem "docker-sync", "0.5.9"
gem 'image_processing'
gem "draper"
gem 'font-awesome-sass', '~> 5.2.0'
gem "html2slim"
gem 'slim-rails'
gem 'rails-i18n', '~> 5.1'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
