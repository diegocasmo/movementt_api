source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'firebase-auth-rails', '~> 0.1.2'
gem 'active_model_serializers', '~> 0.10.12'
gem 'pundit', '~> 2.1'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'spring'
  gem 'chusaku', require: false
  gem 'rails-erd', '~> 1.5', '>= 1.5.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
