# Movementt API

API for [Movementt](https://github.com/diegocasmo/movementt).

## Installation

- Install [asdf](https://github.com/asdf-vm/asdf)
- Install `asdf` plugins
  - `asdf plugin add ruby`
  - `asdf plugin add postgres`
  - `asdf plugin add redis`
- Run `asdf install`
- Copy the `.env.example` file and rename it to the `.env`
  - `cp .env.example .env`
- Fill-in the `.env` file and add the Firebase SDK development configuration
- Run `bundle install`
  - Issues with `pg`?
    - Run `gem install pg -v '1.3.5' --source 'https://rubygems.org/' -- --with-pg-config=/Users/<your_user>/.asdf/installs/postgres/13.4/bin/pg_config `
- Create the database: `bundle exec rake db:create`
- Run migrations: `bundle exec rake db:migrate`
- Start the server: `bundle exec rails s`

