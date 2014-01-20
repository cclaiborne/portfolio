ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"

# class IntegrationTest < MiniTest::Spec
#   include Rails.application.routes.url_helpers
#   include Capybara::DSL
#   register_spec_type(/Post$/, self)
# end



class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

end

Turn.config.format = :outline
