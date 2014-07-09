ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

# Run codeclimate-test-reporter only in CI
if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

Dir[Rails.root.join('spec/support/{sections,**}/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include Rails.application.routes.url_helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include FactoryGirl::Syntax::Methods

  config.before do
    ActionMailer::Base.deliveries.clear
  end
end
