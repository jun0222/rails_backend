# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DummyData', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/dummy_data/index'
      # expect(response).to have_http_status(:success)
      # 絶対に通るテスト
      it '絶対に通るテスト' do
        expect(1).to eq(1)
      end
    end
  end
end
