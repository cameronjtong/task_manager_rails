ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    include ApplicationHelper
    def is_logged_in?
      !session[:user_id].nil?
    end

    def log_in_as(user)
      session[:user_id] = user.id
    end

    def is_logged_in?
      !session[:user_id].nil?
    end

    # Add more helper methods to be used by all tests here...
  end
end

module ActionDispatch
  class IntegrationTest
    def log_in_as(user, password: "foobar", remember_me: "1")
      post login_path,
           params: {
             session: {
               email: user.email,
               password: password,
               password_confirmation: password,
               remember_me: remember_me,
             },
           }
    end
  end
end
