class HomeController < ApplicationController
  def index
    @dotenv_test_value = ENV['DOTENV_TEST']
  end
end