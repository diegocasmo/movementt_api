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
- Start the server: `bundle exec rails s`
