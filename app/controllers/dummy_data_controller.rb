# frozen_string_literal: true

# ダミーデータ処理のコントローラ
class DummyDataController < ApplicationController
  require 'jwt'
  require 'base64'

  # rubocop:disable all
  def index
    Faker::Config.locale = 'ja' # 日本語のデータを使用する設定

    @dummy_data = 5.times.map do
      {
        name: Faker::Name.name, # 日本人名
        dob: Faker::Date.birthday(min_age: 18, max_age: 65),
        address: "#{Faker::Address.city}#{Faker::Address.street_address}", # 日本の住所
        uuid: SecureRandom.uuid,
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        postal_code: Faker::Address.zip_code,
        email: Faker::Internet.email(domain: 'example.com'),
        # rubocop:disable all
        jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c', # JWT.encode(payload, 'secret', 'HS256')
        base64: Base64.encode64('サンプルデータ') # Base64エンコードされた文字列
      }
    end
  end
end
