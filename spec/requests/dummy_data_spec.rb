# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DummyData', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/dummy_data/index'
      expect(response).to have_http_status(:success)
    end
  end
end
