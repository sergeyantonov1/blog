source "https://rubygems.org"

ruby "2.4.2"

gem "pg"
gem "rails", "~> 5.1.6.1"

# assets
gem "autoprefixer-rails"
gem "bootstrap", "~> 4.1.1"
gem "coffee-rails"
gem "font-awesome-rails"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "mini_racer"
gem "premailer-rails"
gem "sass-rails", "~> 5.0.0", ">= 5.0.6"
gem "uglifier", ">= 2.7.2"

# views
gem "active_link_to"
gem "inky-rb", require: "inky"
gem "meta-tags"
gem "simple_form"
gem "slim"

# all other gems
gem "active_model_serializers"
gem "carrierwave"
gem "ckeditor"
gem "decent_decoration"
gem "decent_exposure"
gem "devise"
gem "draper"
gem "flamegraph"
gem "fragments.js", git: "https://github.com/fs/fragments.js.git"
gem "google-analytics-rails"
gem "health_check"
gem "httparty"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "mini_magick"
gem "pg_search"
gem "puma"
gem "pundit"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false, git: "https://github.com/MiniProfiler/rack-mini-profiler.git"
gem "responders"
gem "rollbar"
gem "seedbank"
gem "selectize-rails"
gem "sidekiq"
gem "stackprof"

group :staging, :production do
  gem "newrelic_rpm"
end

group :staging, :development, :test do
  gem "factory_girl_rails"
  gem "faker"
end

group :test do
  gem "capybara"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "guard-rspec"
  gem "launchy"
  gem "poltergeist"
  gem "rspec-its"
  gem "shoulda-matchers"
  gem "terminal-notifier-guard"
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bullet"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "letter_opener"
  gem "rails-erd"
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console"
end
