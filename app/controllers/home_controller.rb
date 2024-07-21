# frozen_string_literal: true

# rootパスのコントローラ
class HomeController < ApplicationController
  def index
    @dotenv_test_value = ENV.fetch('DOTENV_TEST', nil)
  end
end
