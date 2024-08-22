# frozen_string_literal: true

# rootパスのコントローラ
class HomeController < ApplicationController
  def index
    @dotenv_test_value = ENV.fetch('DOTENV_TEST', nil)
  end

  # rubocop:disable all
  def routes
    excluded_paths = [
      '/recede_historical_location',
      '/resume_historical_location',
      '/refresh_historical_location'
    ]

    @routes = Rails.application.routes.routes.map do |route|
      # コントローラ名でのフィルタリング
      next if route.defaults[:controller].nil?
      next if route.defaults[:controller].include?('rails') ||
              route.defaults[:controller].include?('active_storage') ||
              route.defaults[:controller].include?('action_mailbox')

      # パス名でのフィルタリング
      next if excluded_paths.include?(route.path.spec.to_s.gsub('(.:format)', ''))

      {
        verb: route.verb.presence || 'GET',
        path: route.path.spec.to_s.gsub('(.:format)', ''),
        controller: route.defaults[:controller],
        action: route.defaults[:action],
        name: route.name
      }
    end.compact
  end
end
