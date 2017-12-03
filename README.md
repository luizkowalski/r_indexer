# R Indexer

[![Build
Status](https://travis-ci.org/luizkowalski/r_indexer.svg?branch=master)](https://travis-ci.org/luizkowalski/r_indexer)

This app will download PACKAGE file from a R packages repository, index at least
50 packages and present

## Dependencies

* Ruby 2.4.2
* PostgreSQL
* Redis
* Foreman


## Setup

Just run:
```ruby
bin/setup
```

It will install gems, setup database and enqueue the indexer job. Then run
Sidekiq (or start the app with `foreman start`) to bootstrap.


## Tests

`bundle exec rspec spec/`

Code coverage is around 99.31%

## Assumptions

* `PACKAGE` file contains no comments (e.g. line starting with #)
* every package contains a `DESCRIPTION` file
* every description file always contains all information needed (authors,
maintainer, etc..)

## Code

* I like to keep controllers slim, keeping as few as possible business logic
inside them
* Same goes for Sidekiq workers
* I'm a big fan o DDD so I like to keep the business logic as close to the model
 as possible (although I decided not to implement DDD here since I would spend
too much time)
* Tried to apply Single responsibility principle: A class should have only one
reason to change. Thats why there are `queries` and `presenters`. Though some
people believe a class should have only one method in order to respect the
principle, the granularity level is always subjective.

## Real world implementation

* Indexing/search
* Separate front-end from back-end
* More configuration options
* Dockerize
