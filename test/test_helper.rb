require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "lib/tasks/"
  add_filter "lib/helpers/"
  add_filter "lib/filters/"
  add_filter "lib/exceptions.rb"
  add_filter "app/channels/application_cable/"
  add_filter "app/jobs/"
  add_filter "app/mailers/"
  add_filter "app/helpers/"
  add_filter "app/controllers/"
  add_filter "app/controllers/api/"
end
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'contexts'


class ActiveSupport::TestCase
  # Since we are not using fixtures, comment this line out...
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  include Contexts

  # Add the infamous deny method...
  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end

  # A set methods to login various types of users (for controller tests)
  def login_client
    @owner = FactoryBot.create(:owner, first_name: "Ted", username: "ted", role: "client")
    get login_path
    post sessions_path, params: { username: "ted", password: "secret" }
  end
  
  def login_worker
    @owner = FactoryBot.create(:owner, first_name: "Pam", username: "pam", role: "worker")
    get login_path
    post sessions_path, params: { username: "pam", password: "secret" }
  end

  # Spruce up minitest results...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
