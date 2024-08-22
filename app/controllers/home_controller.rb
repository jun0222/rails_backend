# frozen_string_literal: true

# rootパスのコントローラ
class HomeController < ApplicationController
  def index
    @dotenv_test_value = ENV.fetch('DOTENV_TEST', nil)
  end

  def routes
    @routes = Rails.application.routes.routes.map do |route|
      {
        verb: route.verb,
        path: route.path.spec.to_s.gsub('(.:format)', ''),
        controller: route.defaults[:controller],
        action: route.defaults[:action]
      }
    end
  end
end
