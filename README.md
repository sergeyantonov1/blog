# IT blog

[![Build Status](https://semaphoreci.com/api/v1/sergeyantonov1/blog/branches/master/badge.svg)](https://semaphoreci.com/sergeyantonov1/blog)

Blog about IT

## Dependencies
PostgreSQL 9.1 and later
Ruby 2.4.2
Rails 5.1.2

## Quick Start

```bash
# clone repo
git clone git@github.com:sergeyantonov1/blog.git
cd blog

# run setup script
bin/setup

# configure ENV variables in .env
vim .env

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

