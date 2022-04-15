source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(File.dirname(__FILE__), ".ruby-version")).strip

gem 'rails', '~> 6.1.5'
gem 'pg', '~> 1.3', '>= 1.3.5'
gem 'puma', '~> 5.6', '>= 5.6.4'
gem 'firebase-auth-rails', '~> 0.1.2'
gem 'active_model_serializers', '~> 0.10.13'
gem 'pundit', '~> 2.2'
gem 'bootsnap', '~> 1.11', '>= 1.11.1', require: false
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'simple_command', '~> 0.1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.7', '>= 3.7.1'
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'spring', '~> 4.0'
  gem 'chusaku', '~> 0.6.1'
  gem 'rails-erd', '~> 1.6', '>= 1.6.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
