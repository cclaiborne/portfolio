ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "capybara/rails"
require "active_support/testing/setup_and_teardown"

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/Post$/, self)
end

Turn.config.format = :outline
