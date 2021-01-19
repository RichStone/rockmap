# Your 1-Year Accountability Rockmap

## Run the App

```shell
r s
```

## Migrations

```shell
rails db:migrate RAILS_ENV=development
```

REALLY drop database and migrate everything over again:

```shell
rake db:drop db:create db:migrate
```

## Tests

### Run the tests

```shell
bundle exec rspec spec
```

## Credentials

Edit/show credentials:

```shell
EDITOR="code --wait" bin/rails credentials:edit
```

## Debug

```shell
rails c --sandbox
```

## Troubleshootings

On Linux, run RubyMine from Terminal to avoid issues with 
[yarn integrity checks](https://youtrack.jetbrains.com/issue/IDEABKL-7589). Like
when you want to run Rails console via the IDE for autocomplete etc.

## README boiler

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
