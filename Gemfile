source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(File.dirname(__FILE__), ".ruby-version")).strip

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 5.5'
gem 'firebase-auth-rails', '~> 0.1.2'
gem 'active_model_serializers', '~> 0.10.12'
gem 'pundit', '~> 2.1', '>= 2.1.1'
gem 'bootsnap', '~> 1.7', '>= 1.7.7', require: false
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'simple_command', '~> 0.0.9'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.7'
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'chusaku', '~> 0.5.0', require: false
  gem 'rails-erd', '~> 1.6', '>= 1.6.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
